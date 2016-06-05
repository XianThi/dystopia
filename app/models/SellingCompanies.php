<?php

Class SellingCompanies extends Phalcon\Mvc\Model
{
public function getselling($type,$quality,$zone){
$db = $this->getDI()->get('db');
$sql="SELECT *FROM selling_companies where price<>0 $type $quality order by price desc";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}


}