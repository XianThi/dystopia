<?php
/* Helper functions: */
class Functions
{

 public function time_ago($date,$rcs = 0) {
  {
    if(empty($date)) {
        return "No date provided";
    }
    
    $periods         = array("second", "minute", "hour", "day", "week", "month", "year", "decade");
    $lengths         = array("60","60","24","7","4.35","12","10");
    
    $now             = time();
    $unix_date         = strtotime($date);
    
       // check validity of date
    if(empty($unix_date)) {    
        return "Bad date";
    }

    // is it future date or past date
    if($now > $unix_date) {    
        $difference     = $now - $unix_date;
        $tense         = "ago";
        
    } else {
        $difference     = $unix_date - $now;
        $tense         = "from now";
    }
    /*
    for($j = 0; $difference >= $lengths[$j] && $j < count($lengths)-1; $j++) {
        $difference /= $lengths[$j];
    }
    
    $difference = round($difference);
    
    if($difference != 1) {
        $periods[$j].= "s";
    }
    */
    return floor($difference/(60*60*24))." days ago";
   }

  // return floor($difference/(60*60*24))." ago ";
    }

function get_tag($tag,$xml)
{
	preg_match_all('/<'.$tag.'>(.*)<\/'.$tag.'>$/imU',$xml,$match);
    
    return $match[1];
}
  function saatfarki($saat1,$saat2) 
{ 
   return abs(strtotime(date('d.m.Y '.$saat1)) - strtotime(date('d.m.Y '.$saat2)))/60; 
} 


function getRealIpAddr()
{
    if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
    {
      $ip=$_SERVER['HTTP_CLIENT_IP'];
    }
    elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
    {
      $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    else
    {
      $ip=$_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}

function working($userid,$worktime){

$t=time();
$now=date("G:00:00",$t);
$now2=date("G:i:s");
$worktimex=new Worktime();
$works=$worktimex->get_worksx($userid);
if($works){
foreach($works as $result){
$a=$this->check_time($result["start_time"],$result["end_time"],$now);
if($a==TRUE){
$saatfarki=ceil($this->saatfarki($result["end_time"],$now2));
$return=array($result["companyid"],"Şuan iştesin, işin bitmesine $saatfarki dakika kaldı.");
break;
}else{
    $return=array(FALSE);
    }
}
}else{
    $return=array(FALSE);
}
return $return;
}


function is_bot()
{
	/* This function will check whether the visitor is a search engine robot */
	
	$botlist = array("Teoma", "alexa", "froogle", "Gigabot", "inktomi",
	"looksmart", "URL_Spider_SQL", "Firefly", "NationalDirectory",
	"Ask Jeeves", "TECNOSEEK", "InfoSeek", "WebFindBot", "girafabot",
	"crawler", "www.galaxy.com", "Googlebot", "Scooter", "Slurp",
	"msnbot", "appie", "FAST", "WebBug", "Spade", "ZyBorg", "rabaz",
	"Baiduspider", "Feedfetcher-Google", "TechnoratiSnoop", "Rankivabot",
	"Mediapartners-Google", "Sogou web spider", "WebAlta Crawler","TweetmemeBot",
	"Butterfly","Twitturls","Me.dium","Twiceler");

	foreach($botlist as $bot)
	{
		if(strpos($_SERVER['HTTP_USER_AGENT'],$bot)!==false)
		return true;	// Is a bot
	}

	return false;	// Not a bot
}

function check_time($t1, $t2, $tn) { 
    $t1 = +str_replace(":", "", $t1); 
    $t2 = +str_replace(":", "", $t2); 
    $tn = +str_replace(":", "", $tn); 
    if ($t2 >= $t1) { 
        return $t1 <= $tn && $tn < $t2; 
    } else { 
        return ! ($t2 <= $tn && $tn < $t1); 
    } 
}

function distance($lat1, $lon1, $lat2, $lon2, $unit) {

  $theta = $lon1 - $lon2;
  $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
  $dist = acos($dist);
  $dist = rad2deg($dist);
  $miles = $dist * 60 * 1.1515;
  $unit = strtoupper($unit);

  if ($unit == "K") {
    return ($miles * 1.609344);
  } else if ($unit == "N") {
      return ($miles * 0.8684);
    } else {
        return $miles;
      }
}


function energy_cron(){
$userinfo=new userinfo();
$return=$userinfo->energy_artir();
return $return;
} 
function onwork($start_time,$end_time,$now){
$a=$this->check_time($start_time,$end_time,$now);
if($a==FALSE){  
$return=TRUE;
}
else{
$return=FALSE;
}
return $return;
}

function clear_cron(){
$selling=new Selling();
$selling=$selling->find("pcs=0");
$selling->rewind();
while($selling->valid()){
    $selling->delete();
    $selling->next();
}
$joboffers=new JobOffers();
$joboffers=$joboffers->find("person=0");
$joboffers->rewind();
while($joboffers->valid()){
    $joboffers->delete();
    $joboffers->next();
}
}

function work_cron(){
$t=time();
$now=date("G:00:00",$t);
$worktimea=new Worktime();
$userinfo=new userinfo();
$company=new Company();
$users=new Users();
$raws=new Raws();
$stocks=new Stocks();
$productivity=new Productivity();
$worktime=$worktimea->find("id=id");
$worktime->rewind();
while($worktime->valid()){
$worktimex=$worktime->current();
$onwork=$this->onwork($worktimex->start_time,$worktimex->end_time,$now);
if($onwork==FALSE){
$company=$company->findfirst("id=$worktimex->companyid");
$users=$users->findfirst("id=$worktimex->userid");
$raws=new Raws();
$raws=$raws->findfirst("zoneid=$users->zones and type=$company->type2");
$userinfo=$userinfo->findfirst("userid=$worktimex->userid");
$ec=count($worktimea->find("companyid=$company->id group by userid"));
if($raws){
$grade=$raws->grade;}else{
    $grade=0.5;
}
$wellness=$userinfo->wellness;
$quality=$company->quality;
$economic_skill=$userinfo->economic_skill;
$max_product=$this->product($ec,$grade,100,$quality,$economic_skill,$company->type);
$product=$this->product($ec,$grade,$wellness,$quality,$economic_skill,$company->type);
$useraw=$this->useraw($company->id,$product);
if($company->type==1){
    $useraw=TRUE;
}

if($useraw==FALSE){
NotificationsController::create_notif("Your company havent enought raw!","Şirkette hammadde olmadığı için işçiler çalışamıyor.",$company->owner,new \Phalcon\db\RawValue('now()'));
NotificationsController::create_notif("You dont work!","$company->name şirketinde hammadde olmadığı için çalışamadın.",$worktimex->userid,new \Phalcon\db\RawValue('now()'));
$userinfo=$userinfo->findfirst("userid=$worktimex->userid");
$userinfo->work=0;
$userinfo->update();
}else{
$salary=($product*$worktimex->salary)/$max_product;
$company_money=$company->money;
if($userinfo->energy<$company->quality*5){
NotificationsController::create_notif("Enerjin kalmadı!","Enerjin olmadığı için $company->name şirketinde çalışamadın.",$userinfo->userid,new \Phalcon\db\RawValue('now()'));
$userinfo->work=0;
$userinfo->update();
}else{
if($salary>$company_money){
NotificationsController::create_notif("Your company havent enought money!","Şirkette para olmadığı için işçiler çalışamıyor.",$company->owner,new \Phalcon\db\RawValue('now()'));
NotificationsController::create_notif("You dont work!","$company->name şirketinde para olmadığı için çalışamadın.",$worktimex->userid,new \Phalcon\db\RawValue('now()'));
$userinfo->work=0;
$userinfo->update();
}else{
$productivity->userid=$worktimex->userid;
$productivity->companyid=$company->id;
$productivity->product=$product;
$productivity->created_time=new \Phalcon\db\RawValue('now()');
if (!$productivity->save()) {
			foreach ($productivity->getMessages() as $message) {
				$this->flash->error((string) $message);
			  	}
		}else{
$stocks=$stocks->findfirst("companyid=$company->id");
$stocks->total_stock=$stocks->total_stock+$product;
if (!$stocks->update()) {
			foreach ($stocks->getMessages() as $message) {
				var_dump($message);
			  	}
                }
$userinfo->currency=$userinfo->currency+$salary;
$userinfo->energy=$userinfo->energy-($company->quality*5);
$userinfo->economic_skill=$userinfo->economic_skill+(0.01);
$userinfo->work=1;
if (!$userinfo->update()) {
			foreach ($userinfo->getMessages() as $message) {
				$this->flash->error((string) $message);
			  	}
		}else{
		  $this->expver($worktimex->userid,1);
          if($company->type==2){
          $company->raw=$company->raw-($product*2);
            }
          $company->money=$company->money-$salary;
          $company->update();
         
		}}
    $worktime->next();

}
}
}
}
}
}



function product($Ec,$R,$W,$Q,$E,$CT){
    //P=Product
    //Ec=Employes count
    //R=Raw Grade
    //W=Wellness
    //Q=Company Quality
    //E=Economic Skill
    //CT=Company Type(1=Raw, 2=Manu)
    if($CT==2){
$P=(((100+$Ec)/10)+(1*($W/100)*(1/$Q))*($E*5))/2;
}
if($CT==1){
$P=((100+$Ec)/10)+(($R*0.5)*($W/100)*(1/$Q))*($E*5);    
}
return $P;
}

function useraw($companyid,$product){
$company=new Company();
$company=$company->findfirst("id=$companyid");
$reqraw=$product*$company->quality*2;
if($company->raw<$reqraw){
    $return = FALSE;
}else{
    $return = TRUE;
}
return $return;
}

function risk_cron(){

    
}

function expver($userid,$exp){
$userinfo=new userinfo();
$userinfo=$userinfo->findfirst("userid=$userid");
$newexp=$userinfo->exp+$exp;
$oldlevel=$userinfo->level;
$userinfo->exp=$userinfo->exp+$exp;
$userinfo->update();

$level=new Level();
$level=$level->findfirst("exp_min<=$newexp and exp_max>=$newexp");
$exp_max=$level->exp_max;
if($newexp==$exp_max){
            $level=$level->findfirst("level=$level->level+1");
        }
if($oldlevel!=$level->level){
$userinfo=$userinfo->findfirst("userid=$userid");
$userinfo->level=$level->level;
$userinfo->gold=$userinfo->gold+5;
$userinfo->update();
NotificationsController::create_notif("Seviye Atladın!","Yeni seviyen : $level->level. Ayrıca 5 gold kazandın!",$userid,new \Phalcon\db\RawValue('now()'));
}
}

}
?>