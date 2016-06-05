<?php

Class Notifications extends Phalcon\Mvc\Model
{

public function getnotifications($userid){
$db = $this->getDI()->get('db');
$sql="SELECT count(*) FROM notifications where notifications.read=0 and userid=$userid";
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}

public function getnotifications2($userid){
$db = $this->getDI()->get('db');
$sql="SELECT count(*) FROM notifications where userid=$userid";
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}

public function readall($userid){
$db = $this->getDI()->get('db');
$sql="update notifications set notifications.read=1 where userid=$userid";
$query=$db->query($sql);    
}

public function readnotif($id){
$db = $this->getDI()->get('db');
$sql="update notifications set notifications.read=1 where id=$id";
$query=$db->query($sql);    
}
}