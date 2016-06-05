<?php
class Online extends Phalcon\Mvc\Model
{
public function get_online(){
$db = $this->getDI()->get('db');
$sql=("SELECT countryCode,country, COUNT(*) AS total FROM online GROUP BY countryCode ORDER BY total DESC LIMIT 15");
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

public function onlinex($intip,$stringIp,$cookies){
$db = $this->getDI()->get('db');
$sql=("SELECT 1 FROM online WHERE ip=".$intip);
$query=$db->query($sql);
/* */
$functions=new functions();
$cookiex = $this->getDI()->get('cookies');
$file="http://188.166.42.60:8080/xml/$stringIp";
//var_dump($cookies);
if($query->numRows()<1)
{
	// This user is not in the database, so we must fetch
	// the geoip data and insert it into the online table:
	
	if (!empty($cookies->getdomain)) {
		// A "geoData" cookie has been previously set by the script, so we will use it
		
		// Always escape any user input, including cookies:
        $geoData = $cookies;
        //var_dump($geoData->getValue());
		list($city,$countryName,$countryAbbrev) = explode('|',(strip_tags($geoData->getValue())));
	}else{
		// Making an API call to Hostip:
		
		$xml = file_get_contents($file);
      //var_dump($xml);
		$city = $functions->get_tag('City',$xml);
		$city = $city[0];
      // var_dump($city);
		
		$countryName = $functions->get_tag('CountryName',$xml);
		$countryName = $countryName[0];
	 //	var_dump($countryName);
        
		$countryAbbrev = $functions->get_tag('CountryCode',$xml);
    		$countryAbbrev = $countryAbbrev[0];
		//var_dump($countryAbbrev);
        
		// Setting a cookie with the data, which is set to expire in a month:
        $cookiex->set('geoData', $city.'|'.$countryName.'|'.$countryAbbrev, time()+60*60*24*30,'/');
	}
	
//	$countryName = str_replace('(Unknown Country?)','UNKNOWN',$countryName);
	
	// In case the Hostip API fails:
		
	if (empty($countryName))
	{
		$countryName='UNKNOWN';
		$countryAbbrev='XX';
		$city='(Unknown City?)';
	}
$sql2="INSERT INTO online (ip,city,country,countrycode) VALUES(".$intip.",'".$city."','".$countryName."','".$countryAbbrev."')";
$query2=$db->query($sql2);
}
 else
{
	// If the visitor is already online, just update the dt value of the row:
$sql3="UPDATE online SET dt=NOW() WHERE ip=".$intip;
$query3=$db->query($sql3);
}

// Removing entries not updated in the last 10 minutes:
$sql4="DELETE FROM online WHERE dt<SUBTIME(NOW(),'0 0:10:0')";
$query4=$db->query($sql4);
// Counting all the online visitors:
$sql5="SELECT COUNT(*) FROM online";
$query5=$db->query($sql5);
list($totalOnline) = $query5->fetch();
// Outputting the number as plain text:
return $totalOnline;
//return var_dump($xml);  

/**/
}


}

?>