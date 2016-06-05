<?php
class Productivity extends Phalcon\Mvc\Model
{
public function initialize()
{
      $this->useDynamicUpdate(true);
}

public function products($companyid){
$db = $this->getDI()->get('db');
$sql="SELECT sum(product) as products, created_time FROM productivity where companyid=$companyid group by created_time order by created_time desc limit 7";
$query=$db->query($sql);
return $query->fetchAll();
}

public function products_user($companyid,$date,$userid){
$db = $this->getDI()->get('db');
$sql="SELECT SUM(product) as products FROM `productivity` where created_time='$date' and companyid=$companyid and userid=$userid ";
$query=$db->query($sql);
return $query->fetch();
}

}