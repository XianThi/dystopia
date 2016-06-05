<?php

Class Selling extends Phalcon\Mvc\Model
{
public function getselling($type,$zone,$quality){
$db = $this->getDI()->get('db');
$sql="SELECT *FROM selling where pcs<>0 and zone=$zone $type $quality order by price asc";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}


}