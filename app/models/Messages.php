<?php

class Messages extends Phalcon\Mvc\Model
{

	public $id;

	public $baslik;

	public $icerik;

	public $yazar;

	public $created_at;


public function get_message($id){
$db = $this->getDI()->get('db');
$sql="SELECT count(*) FROM messages where messageid=$id";    
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

public function read_message($messageid,$userid){
  $db = $this->getDI()->get('db');
$sql="update messages set messages.readx=1 where messageid='$messageid' and to_id=$userid";    
$query=$db->query($sql);
return $query;  
}
public function sent_message($id){
  $db = $this->getDI()->get('db');
$sql="select messageid from messages where id=$id";    
$query=$db->query($sql);
$messageid=$query->fetch();
$sql2="update messages set messages.readx=0 where messageid=$messageid->messageid";
$query2=$db->query($sql2);
return $query2;  
}
}
