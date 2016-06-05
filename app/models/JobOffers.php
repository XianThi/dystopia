<?php

use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;
use Phalcon\Mvc\Model\Criteria;
class JobOffers extends Phalcon\Mvc\Model
{
public function initialize()
{
      $this->useDynamicUpdate(true);
}
public function get_work($userid){
$db = $this->getDI()->get('db');
$sql="SELECT count(*) FROM worktime where userid=$userid group by companyid";
$query=$db->query($sql);
$query=$query->fetch();
return $query;
}

public function get_jobs($zones,$start_time,$end_time){
$db = $this->getDI()->get('db');
$sql="SELECT job_offers.* FROM job_offers join company on company.id=job_offers.owner and zones=$zones and job_offers.person<>0 $start_time $end_time  order by start_time desc";
$query=$db->query($sql);
$query=$query->fetchAll();
return $query;
}

}