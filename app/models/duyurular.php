<?php

use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;
use Phalcon\Mvc\Model\Criteria;
class duyurular extends Phalcon\Mvc\Model
{ 
    public $sahip;
public function initialize()
{
      $this->useDynamicUpdate(true);
}
public function duyuru_listesi($userid,$all){
    $db = $this->getDI()->get('db');
if($all==""){
$sql="select *from duyurular where sahip like '%$userid%' order by tarih desc";
}else{
$sql="select *from duyurular where sahip like '%$userid%' $all order by tarih desc";    
}
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}
public function okundu($duyuruid){
    $db = $this->getDI()->get('db');
    $sql="update duyurular set okundu=1 where id=$duyuruid";
    $query=$db->query($sql);
    if($query){
        $message="Okundu olarak iþaretlendi.";
    }
    else
    { $message="Bilinmeyen hata oluþtu";}
  return $message;
    }

public function sil($duyuruid){
    $db = $this->getDI()->get('db');
    $sql="delete from duyurular where id=$duyuruid";
    $query=$db->query($sql);
    if($query){
        $message="Duyuru silindi.";
    }
    else
    { $message="Bilinmeyen hata oluþtu";}
  return $message;
    }
    
public function kisiler(){
$db = $this->getDI()->get('db');
$sql="select *from users where yetki=1 order by id asc";    
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

}
