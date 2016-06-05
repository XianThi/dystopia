<?php

class Denetimraporu extends Phalcon\Mvc\Model
{

	public $id;

	public $dosya_no;

	public $dosya_turu;

	public $isim_soyisim;
    
    public $sahip;
    
	public $uzman;
    
    public $ustyazi;


public function kisiler(){
$db = $this->getDI()->get('db');
$sql="select *from users where yetki=1 order by id asc";    
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}
}
