<?php

Class level extends Phalcon\Mvc\Model
{

public function regions_list($country_id){
$db = $this->getDI()->get('db');
$sql="select *from regions where country=$country_id";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

}
