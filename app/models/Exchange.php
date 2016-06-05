<?php

class Exchange extends Phalcon\Mvc\Model
{
    
public function exchanges(){
$db = $this->getDI()->get('db');
$sql="select *from exchange order by id";    
$query=$db->query($sql);
$query->setFetchMode(Phalcon\Db::FETCH_ASSOC);
$query=$query->fetchAll();
return $query;
}

}

