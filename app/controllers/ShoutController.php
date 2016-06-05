<?php
use     Phalcon\Mvc\View;
class ShoutController extends ControllerBase
{     
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
        
        $this->view->setvar("exp_max",$exp_max);
        $this->view->setvar("exp",$userinfo->exp);
        $this->view->setvar("level",$level->level);   
        $this->view->setTemplateAfter('main2');
        parent::initialize();
    }
    
    public function AddAction()
    {
        $t=$this->_getTranslation();
        if($this->request->isPost()){
        $auth = $this->session->get('auth');
        $userid=$auth["id"];
        $message=$this->request->getpost("message");
        $type=$this->request->getpost("type");
        $users=new Users();
        $users=$users->findfirst("id=$userid");
        $shouts=new Shouts();
        $shouts->message=$message;
        $shouts->userid=$userid;
        $shouts->type=$type;
        $shouts->zone=$users->zones;
        $shouts->created_time=new \Phalcon\db\RawValue('now()');
        if (!$shouts->save()) {
			foreach ($shouts->getMessages() as $message) {
				$this->flash->error((string) $message);
			}
		}
        else{
        $this->flash->success($t["shout_posted"]);
        }
        }
        $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
    
    public function IndexAction(){
    $uriParts = explode('/', $_SERVER["REQUEST_URI"]);
    if(isset($uriParts[3])){
        $action= $uriParts[3];
        }else{
        $action="global";
        }
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $users=new Users();
    $users=$users->findfirst("id=$userid");
    $shouts=new Shouts();
    $friends=new Friends();
    $friends=$friends->find("userid=$userid and status=1");
    $global_shouts=$shouts->find("type=0 order by created_time desc LIMIT 5");
    $zone_shouts=$shouts->find("zone=$users->zones and type=2 order by created_time desc LIMIT 5");
    $this->view->setvar("global_shouts",$global_shouts);
    $this->view->setvar("zone_shouts",$zone_shouts);
    $this->view->setvar("action",$action);
    $this->view->setvar("friends",$friends);
    $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }
    
    }