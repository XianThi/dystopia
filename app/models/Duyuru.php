<?php

class Duyuru extends Phalcon\Mvc\Model
{

	public $id;

	public $baslik;

	public $icerik;

	public $yazar;

	public $created_at;


public function kisiler(){
$db = $this->getDI()->get('db');
$sql="select *from users where yetki=1 order by id asc";    
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}
}
