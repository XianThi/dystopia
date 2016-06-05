<?php
use     Phalcon\Mvc\View;
class FriendsController extends ControllerBase
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
    
    public function IndexAction(){
    
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $friends=new Friends();
    $friend_requests=$friends->find("userid=$userid and status=0");
    $friends=$friends->find("userid=$userid and status=1");
    $this->view->setvar("friends",$friends);
    $this->view->setvar("friend_request",$friend_requests);
    }
    
    public function AddAction($id){
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $friends=new Friends();
    $users=new Users();
    $users=$users->findfirst("id=$userid");
    if($userid!=$id){
    $friend=$friends->findfirst("(userid=$userid and friendid=$id) or (userid=$id and friendid=$userid)");
    if($friend==FALSE){
    $friends->userid=$userid;
    $friends->friendid=$id;
    $friends->status=0;
     if ($friends->save() == false) {
                foreach ($friends->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $url = new Phalcon\Mvc\Url();
            NotificationsController::create_notif($t["friend_request"],"<a href='../../homepage/profile/$users->id'>".$users->username."</a> ".$t["add_you_friend"]." <a href='../../friends/accept/$users->id' class='btn btn-success'>".$t["accept"]."</a> <a href='../../friends/reject/$users->id' class='btn btn-success'>".$t["reject"]."</a>",$id,new \Phalcon\db\RawValue('now()'));
            $this->flash->success('Arkadaşlık isteği gönderildi.');
            }
    }else{
    $this->flash->error("Zaten arkadaşlık isteği gönderilmiş.");
    } 
    
    }
    $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
    
    public function AcceptAction($id){
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $friends=new Friends();
    $users=new Users();
    $users=$users->findfirst("id=$userid");
    if($userid!=$id){
    $friend=$friends->findfirst("userid=$id and friendid=$userid and status=0");
    if($friend==TRUE){
    $friend->status=1;
     if ($friend->update() == false) {
                foreach ($friend->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
            NotificationsController::create_notif($t["accept_friend"],"<a href='../../homepage/profile/$users->id'>".$users->username."</a> ".$t["accept_friend_request"],$id,new \Phalcon\db\RawValue('now()'));
            $friends->userid=$userid;
            $friends->friendid=$id;
            $friends->status=1;
            $friends->save();
            $this->flash->success('Arkadaşlık isteği kabul edildi.');
            }
    }else{
    $this->flash->error("Beklenmeyen bir hata oluştu.");
    } 
    
    }
    }
    
    public function RejectAction($id){
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $friends=new Friends();
    if($userid!=$id){
    $friend=$friends->findfirst("userid=$id and friendid=$userid and status=0");
    if($friend==TRUE){
    $friend->status=2;
     if ($friend->update() == false) {
                foreach ($friend->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('Arkadaşlık isteği reddedildi.');
            }
    }else{
    $this->flash->error("Beklenmeyen bir hata oluştu.");
    } 
    
    }    
    }
    
    }