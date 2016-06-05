<?php
class WorkoutController extends ControllerBase
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

    public function ResultAction(){
        $t=$this->_getTranslation();
         $skill=$this->request->getpost("train_skill");
         if(empty($skill)){
            $this->flash->Error("Please select a skill");
          }else{
        if($this->request->isPost()){
        
          $auth = $this->session->get('auth');
        $userid=$auth["id"];
         
          if($skill==1){
            $str=1;
            $int=1;
            $hp=5;
          }
          if($skill==2){
            $str=5;
            $int=3;
            $hp=12;
          }
          if($skill==3){
            $str=10;
            $int=5;
            $hp=20;
          }
          $workout=new Workout();
          $train=$workout;
          $userinfo=new userinfo();
          $trainx=$train->findfirst("owner=$userid");
          $user_energy=$userinfo->findfirst("userid=$userid");
          if($user_energy->energy>0){
          if(empty($trainx->id)){
          $first_day=new \Phalcon\db\RawValue('now()');
          $last_day=new \Phalcon\db\RawValue('now()');
          $timerow=1;
          $owner=$userid;
          $train->first_day=$first_day;
          $train->last_day=$last_day;
          $train->timerow=$timerow;
          $train->owner=$owner;
           if (!$train->save()) {
            foreach ($train->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
           // return $this->forward("messages/new/".$id);
        } else {
        $functions=new Functions();          
          $userinfo=$userinfo->findfirst("userid=$userid");
          $userinfo->str=$userinfo->str+$str;
          $userinfo->intelling=$userinfo->intelling+$int;
          $userinfo->energy=$userinfo->energy-$hp;
           if (!$userinfo->update()) {
            foreach ($userinfo->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
           // return $this->forward("messages/new/".$id);
        } else {
        $functions->expver($userid,1);
            return $this->flash->success("You train today!");
             $this->view->setvar("win_str",$str);
             $this->view->setvar("win_int",$int);
             $this->view->setVar("timerow",$train->timerow);
             $this->view->setVar("total_str",$userinfo->str);
             $this->view->setVar("total_int",$userinfo->intelling);
            
           // return $this->forward("homepage/messages/");
        }
           // return $this->forward("homepage/messages/");
        }
          }else{
          
          $last_dayx=$trainx->last_day;
          $year=date('Y');
          $month=date('m');
          $day=date('d');
          $last_dayx=explode("-",$last_dayx);
          $yearx=$year-$last_dayx[0];
          $monthx=$month-$last_dayx[1];
          $dayx=$day-$last_dayx[2];
          $fark=($yearx*365)+($monthx*30)+$dayx;
          if($fark==0){
           $this->flash->error("You are already train today!");
          }
          if($fark>0){
            $trainx->last_day=new \Phalcon\db\RawValue('now()');
            if($fark==1){
                $timerw=$trainx->timerow+1;
                if($timerw>=30){
                    if($timerw % 30 == 0){
        $reward_user=new RewardUser();
        $reward=new Reward();
        $reward_user->userid=$userid;
        $reward_user->rewardid=2;
       if (!$reward_user->save()) {
            foreach ($reward_user->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            }
       else
       {
        $userinfo=$userinfo->findfirst("userid=$userid");
        $reward=$reward->findfirst("id=2");
        $userinfo->gold=$userinfo->gold+$reward->earn;
        $userinfo->update();
        $notifications=NotificationsController::create_notif($t["won_reward"]." ".$reward->name,$reward->desc,$userid,new \Phalcon\db\RawValue('now()'));
            }
                    }
                }
            $trainx->timerow=$trainx->timerow+1;
            }else{
                $trainx->timerow=1;
            }
             if (!$trainx->update()) {
            foreach ($trainx->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
           // return $this->forward("messages/new/".$id);
        } else {
     
          $functions=new Functions();
          $userinfo=$userinfo->findfirst("userid=$userid");
          $userinfo->str=$userinfo->str+$str;
          $userinfo->intelling=$userinfo->intelling+$int;
          $userinfo->energy=$userinfo->energy-$hp;
           if (!$userinfo->update()) {
            foreach ($userinfo->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
           // return $this->forward("messages/new/".$id);
        } else {
            $functions->expver($userid,1);
            return $this->flash->success("You did train today!");
            }
            }
            }
            $userinfo=$userinfo->findfirst("userid=$userid");
            $train=$train->findfirst("owner=$userid");
             $this->view->setvar("win_str",$str);
             $this->view->setvar("win_int",$int);
             $this->view->setVar("timerow",$trainx->timerow);
             $this->view->setVar("total_str",$userinfo->str);
             $this->view->setVar("total_int",$userinfo->intelling);
            
           // return $this->forward("homepage/messages/");
        
           // return $this->forward("homepage/messages/");
        
          
          
          
          }
          $userinfo=$userinfo->findfirst("userid=$userid");
        $train=$train->findfirst("owner=$userid");
         $this->view->setvar("win_str",$str);
             $this->view->setvar("win_int",$int);
             $this->view->setVar("timerow",$train->timerow);
             $this->view->setVar("total_str",$userinfo->str);
             $this->view->setVar("total_int",$userinfo->intelling);
            
        }else
        {
             return $this->flash->error("Enerjin kalmadığı için antreman yapamıyorsun");
        }
        }
        
        $userinfo=$userinfo->findfirst("userid=$userid");
        $train=$train->findfirst("owner=$userid");
             $this->view->setvar("win_str",$str);
             $this->view->setvar("win_int",$int);
             $this->view->setVar("timerow",$train->timerow);
             $this->view->setVar("total_str",$userinfo->str);
             $this->view->setVar("total_int",$userinfo->intelling);
         }   
        }
        
        public function IndexAction(){
        
        }
        
        }