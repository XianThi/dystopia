<?php

use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;
use Phalcon\Mvc\Model\Criteria;
class Party extends Phalcon\Mvc\Model
{
public function initialize()
{
      $this->useDynamicUpdate(true);
}

}