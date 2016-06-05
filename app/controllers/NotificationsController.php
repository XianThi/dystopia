<?php
class NotificationsController extends ControllerBase
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
    
    public static function create_notif($title,$desc,$userid,$created_time){
    $notifications=new Notifications();
    $notifications->title=$title;
    $notifications->desc=$desc;
    $notifications->userid=$userid;
    $notifications->created_time=$created_time;
    $notifications->read=0;
    if (!$notifications->save()) {
        foreach ($notifications->getMessages() as $message) {
    $this->flash->error((string) $message);
    }
            }
    }
    
    public function IndexAction(){
        if($this->request->isPost()){
        $delete=$this->request->getpost("delete");
        if($delete){
        $chkbox=$this->request->getpost("chkbox");
        $cnt=array();
        $cnt=count($chkbox);
        for($i=0;$i<$cnt;$i++){
        $notifications=new Notifications();
        $notifications=$notifications->findfirst("id=$chkbox[$i]");
        $notifications->delete();
        }
        $this->flash->success("Seçili bildirimler silindi");
        }
        }
       $auth = $this->session->get('auth');
        $userid=$auth["id"];
        $notifications=new Notifications();
        $notifications->readall($userid);
        $notifications=$notifications->find("userid=$userid order by created_time desc");
        $this->view->setvar("notifications",$notifications); 
                
    }
    
    public function ViewAction($id){
        
        $auth = $this->session->get('auth');
        $userid=$auth["id"];
        $notifications=new Notifications();
        $notifications->readnotif($id);
        $notifications=$notifications->findfirst("id=$id and userid=$userid");
        $this->view->setvar("notifications",$notifications); 
             
    }
    
    
    }