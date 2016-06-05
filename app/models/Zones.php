<?php

class Zones extends Phalcon\Mvc\Model
{

	public $id;

	public $name;

	public $flag;


public function country_list(){
$db = $this->getDI()->get('db');
$sql="select *from zones where parent=0";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

}
