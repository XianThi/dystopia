<?php

class Gov extends Phalcon\Mvc\Model
{
public function get_govid($zone){
$db = $this->getDI()->get('db');
$sql="select *from gov where zoneid=$zone";    
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}
}
