<?php
use     Phalcon\Mvc\View;
class StockController extends ControllerBase
{
        private $timer;
        public function initialize(){
        $t=$this->_getTranslation();
        $this->view->setvar("lang",$t);
        $auth = $this->session->get('auth');
        $userid=$auth["id"];
        $user=Users::findfirst("id=$userid");
        $this->view->setvar("cover",$user->cover);
        $this->view->setvar("avatar",$user->avatar);
        $this->view->setvar("username",$user->username);
               $zones=new Zones();
        $regions=$zones->findfirst("id=$user->zones");
        $country=$zones->findfirst("id=$regions->parent");
       /* 
        $regions=new Regions();
        $country=$country->findfirst("id=$user->country");
        $regions=$regions->findfirst("id=$user->region");
        */
        $this->view->setvar("country_flag",$country->flag);
        $this->view->setvar("country",$country->name);
        $this->view->setvar("region",$regions->name);
        $userinfo=new userinfo();
        $userinfo=$userinfo->findFirst("userid=$userid");
        $this->view->setvar("wellness",$userinfo->wellness);
        $this->view->setvar("energy",$userinfo->energy);
        $this->view->setvar("gold",$userinfo->gold);
        $this->view->setvar("currency",$userinfo->currency);
        $level=new Level();
        $level=$level->findfirst("exp_min<=$userinfo->exp and exp_max>=$userinfo->exp");
        $exp_max=$level->exp_max;
        if($userinfo->exp==$level->exp_max){
            $level=$level->findfirst("level=$level->level+1");
            $exp_max=$level->exp_max;
        }
        $this->timer=0;
        $this->view->setvar("exp_max",$exp_max);
        $this->view->setvar("exp",$userinfo->exp);
        $this->view->setvar("level",$level->level);
        $this->view->setTemplateAfter('main2');
        parent::initialize();
    }

    
function getMarketInfoAction(){
        $exchange=new Exchange();
    $companies=$exchange->exchanges();
    $stock_comp=new StockComp();
foreach ($companies as $key => $entry) {
$stock_comp_id=$entry["stock_comp"];
$stock_comp=$stock_comp->findfirst("id=$stock_comp_id");
$companies[$key]["stock_comp_name"]=$stock_comp->name;
}
$this->view->disable();
 $this->response->setContentType('application/json', 'UTF-8');
 $this->response->setContent(json_encode($companies));
return $this->response->send();
}

public function UpdateMarketAction(){
$text="";
$time=time();
$timer=$this->timer;
if($time>$timer){
$text="update";
$this->timer=$now;
}
$this->view->disable();
$this->response->setContent($text);
return $this->response->send();
}

    public function IndexAction(){    
    }
    
    }