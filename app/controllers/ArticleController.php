<?php
class ArticleController extends ControllerBase
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
    
   public function ViewAction($id){
    $t=$this->_getTranslation();
    $newspaper=new Newspaper();
    $users=new Users();
    $article=new Article();
    $vote=new Vote();
    $article=$article->findfirst("id=$id");
    if($article==false){
    $this->flash->error($t->_("article_not_found"));
    $this->forward("newspaper/index");
   }else{
    $newspaper=$newspaper->findfirst("id=$article->owner");
    $usersx=$users->findfirst("id=$article->author");
    $this->view->setvar("newspaper",$newspaper);
    $this->view->setvar("owner",$usersx);
    $this->view->setvar("article",$article);
    $this->view->setvar("vote",$vote->get_vote($article->id));
  }
   }
   
      public function VoteAction($id){
   $t=$this->_getTranslation();
   $auth = $this->session->get('auth');
   $userid=$auth["id"];
   $vote=new Vote();
   $article=new Article();
   $article=$article->findfirst("id=$id");
   $votex=$vote->findfirst("userid=$userid and article=$id");
   if($votex==false){
   $vote->article=$id;
   $vote->userid=$userid;
   $article->vote=$article->vote+1;
   $article->update();
             if (!$vote->save()) {
            foreach ($vote->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("article/view/".$id);
        } else {
        
        $votesay=$article->vote;
        if($votesay==250){
        $reward_user=new RewardUser();
        $reward=new Reward();
        $newspaper=new Newspaper();
        $userinfo=new userinfo();
        $newspaper=$newspaper->findfirst("id=$article->owner");
        $newspaper_owner=$newspaper->owner;
        $reward_user->userid=$newspaper_owner;
        $reward_user->rewardid=1;
       if (!$reward_user->save()) {
            foreach ($reward_user->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            }
       else
       {
        $userinfo=$userinfo->findfirst("userid=$newspaper_owner");
        $reward=$reward->findfirst("id=1");
        $userinfo->gold=$userinfo->gold+$reward->earn;
        $userinfo->update();
        $notifications=NotificationsController::create_notif($t["won_reward"]." ".$reward->name,$reward->desc,$newspaper_owner,new \Phalcon\db\RawValue('now()'));
            }
       }
        
            $this->flash->success($t->_("article_vote"));
             return $this->forward("article/view/".$id);
        }
   
    }else{
           $this->flash->error($t->_("already_vote"));
             return $this->forward("article/view/".$id);
    }
   }
   
 public function EditAction($id){
$t=$this->_getTranslation();
   $auth = $this->session->get('auth');
   $userid=$auth["id"];  
   $article=new Article();
   $article=$article->findfirst("id=$id");
      if($article==false){
    $this->flash->error($t->_("article_not_found"));
    $this->forward("newspaper/index");
   }else{
   if($this->request->isPost()){
   $title=$this->request->getpost("title");
   $content=$this->request->getpost("content");
   $article->title=$title;
   $article->content=$content;
             if (!$article->update()) {
            foreach ($article->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("article/view/".$id);
        } else {
            $this->flash->success($t->_("article_edited"));
             return $this->forward("article/view/".$id);
        }
   }
   $newspaper=new Newspaper();
 
   $newspaper=$newspaper->findfirst("id=$article->owner");
   if($userid==$newspaper->owner){
    $this->view->setvar("article_title",$article->title);
    $this->view->setvar("article_content",$article->content);
    
   }else{
           $this->flash->error("Bu alana giriş izniniz yok.");
             return $this->forward("article/view/$id");
   }
   }
    } 
    
    
    public function DeleteAction($id){
        
    $t=$this->_getTranslation();
   $auth = $this->session->get('auth');
   $userid=$auth["id"];  
   $article=new Article();
   $article=$article->findfirst("id=$id");
   if($article==false){
    $this->flash->error($t->_("article_not_found"));
    $this->forward("newspaper/index");
   }else{
   $newspaper=new Newspaper();
   $newspaper=$newspaper->findfirst("id=$article->owner");
   if($this->request->isPost()){
   $ok=$this->request->getpost("ok");
   if (!$article->delete()) {
            foreach ($article->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("newspaper/manage/$newspaper->id");
        } else {
            $this->flash->success($t->_("article_deleted"));
             return $this->forward("newspaper/manage/$newspaper->id");
        }
   }
   
   if($userid==$newspaper->owner){
    $this->view->setvar("article_title",$article->title);
    $this->view->setvar("article_content",$article->content);
    
   }else{
           $this->flash->error("Bu alana giriş izniniz yok.");
             return $this->forward("article/view/$id");
   }    
        
        }
    }
   
   public function NewAction($id){
    $t=$this->_getTranslation();
   $auth = $this->session->get('auth');
   $userid=$auth["id"];
   $newspaper=new Newspaper();
   $article=new Article();
   $newspaper=$newspaper->findfirst("id=$id");
   if($userid==$newspaper->owner){
   if($this->request->isPost()){
   $title=$this->request->getpost("title");
   $content=$this->request->getpost("content");
   if(empty($title)){
   $this->flash->error("Başlık boş olamaz");
   return $this->forward("newspaper/view/".$id);
   }else{
   $article->title=strip_tags($title);
   $article->content=$content;
   $article->author=$userid;
   $article->owner=$id;
   $article->vote=0;
   $article->create_time=new \Phalcon\db\RawValue('now()');
   if (!$article->save()) {
            foreach ($article->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("newspaper/view/".$id);
        } else {
            $this->flash->success($t->_("article_created"));
             return $this->forward("newspaper/view/".$id);
        }
  
    }
    }
   }else{
    
    $this->flash->error("Yetki yok");
    $this->forward("newspaper/index");
   }
   
   }
   
    }
    
    ?>