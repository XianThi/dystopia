<?php

use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;
use Phalcon\Mvc\Model\Criteria;
class Subs extends Phalcon\Mvc\Model
{
public function initialize()
{
      $this->useDynamicUpdate(true);
}
public function get_subs($newspaper){
$db = $this->getDI()->get('db');
$sql="SELECT count(*) FROM subs where newspaper=$newspaper";
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}

}