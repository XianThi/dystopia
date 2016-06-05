<?php

Class Reward extends Phalcon\Mvc\Model
{

public function getreward($userid,$rewardid){
$db = $this->getDI()->get('db');
$sql="SELECT count(*) FROM reward_user where userid=$userid and rewardid=$rewardid";
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}

}