<?php

use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;
use Phalcon\Mvc\Model\Criteria;
class Vote extends Phalcon\Mvc\Model
{
public function initialize()
{
      $this->useDynamicUpdate(true);
}
public function get_vote($article){
$db = $this->getDI()->get('db');
$sql="SELECT count(*) FROM vote where article=$article";
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}

public function best_article(){
$db = $this->getDI()->get('db');
$sql="select article, count(article) from vote group by article order by count(article) desc";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;   
    
}
}