<?php
use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
class Worktime extends Phalcon\Mvc\Model
{
public function initialize()
{
      $this->useDynamicUpdate(true);
}
public function get_works($userid){
$db = $this->getDI()->get('db');
$sql="SELECT *FROM worktime where userid=$userid group by companyid";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}
public function get_worksx($userid){
$db = $this->getDI()->get('db');
$sql="SELECT *FROM worktime where userid=$userid";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}
public function get_jobs($userid,$joboffers,$functions){
$db = $this->getDI()->get('db');
$sql="SELECT *FROM worktime where userid=$userid";
$query=$db->query($sql);
if($query->numRows()!=0){
while($result=$query->fetch()){
$a=$functions->check_time($result["start_time"],$result["end_time"],$joboffers->start_time);
$b=$functions->check_time($result["start_time"],$result["end_time"],$joboffers->end_time);
if($a==FALSE && $b==FALSE){  
$return=TRUE;
}
else{
$return=FALSE;
}
}
}else{
$return=TRUE;
}
return $return;
}

public function get_employes($companyid){
$db = $this->getDI()->get('db');
$sql="SELECT userid,salary FROM worktime where companyid=$companyid group by userid desc";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

public function get_salary($companyid,$userid){
$db = $this->getDI()->get('db');
$sql="SELECT sum(salary) as salary FROM worktime where userid=$userid and companyid=$companyid";
$query=$db->query($sql);
$query=$query->fetch();
return $query;    
}


}