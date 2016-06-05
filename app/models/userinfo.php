<?php

class userinfo extends Phalcon\Mvc\Model
{

public function regions_list($country_id){
$db = $this->getDI()->get('db');
$sql="select *from regions where country=$country_id";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

public function ranked($id){
$db=$this->getDI()->get('db');
$sql_x="SET @rownum := 0";
$db->query($sql_x);
$sql="SELECT rank, userid,point FROM (
                        SELECT @rownum := @rownum + 1 AS rank, userid, @point:=(exp/level)+((wellness/100)+((5*(intelling+economic_skill))/(3*str))) as point
                        FROM userinfo ORDER BY point DESC
                        ) as result WHERE userid=$id";
$query=$db->query($sql);
$query=$query->fetchall();
return $query;
}

public function nation_ranked($id,$country_id){
$db=$this->getDI()->get('db');
$sql_x="SET @rownumx := 0";
$db->query($sql_x);
$sql="SELECT rank, userid,point FROM (
                        SELECT @rownumx := @rownumx + 1 AS rank,country_id, userid, @point:=(exp/level)+((wellness/100)+((5*(intelling+economic_skill))/(3*str))) as point
                        FROM userinfo where country_id=$country_id ORDER BY point DESC
                        ) as result WHERE userid=$id";
$query=$db->query($sql);
$query=$query->fetchall();
return $query;
}

public function energy_artir(){
$db = $this->getDI()->get('db');
$sql="update userinfo set energy=energy+5 where energy<100";
$sql2="update userinfo set energy=100 where energy>100";
$query=$db->query($sql);    
$db->query($sql2);
return $query;
}

}
