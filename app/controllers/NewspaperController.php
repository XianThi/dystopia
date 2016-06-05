<?php
use 
    Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
    Phalcon\Forms\Element\Select,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Hidden,
    Phalcon\Session as Session,
    Phalcon\Mvc\View;
class NewspaperController  extends ControllerBase
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
        $title=phalcon\tag::gettitle("");
        Phalcon\Tag::setTitle($title." ".$t["newspaper"]);
    }
    
      protected function getForm($entity=null, $edit=false)
	{
		$form = new Form($entity);

		$form->add(new Text("name", array(
			"size" => 24,
			"maxlength" => 70
		)));
        
            
		return $form;
	}
    
    
   public function GetnewsAction(){
   $uriParts = explode('/', $_SERVER["REQUEST_URI"]);
    if(isset($uriParts[3])){
    $action= $uriParts[3];
    }else{
    $action="latest";
    }
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $users=new Users();
    $users=$users->findfirst("id=$userid");
    $article=new Article();
    $articlex=$article->article_list($users->zones);
    $this->view->setvar("article_list",$articlex);
    $vote=new Vote();
    $best_article=$vote->best_article();
    $articley=$article->find("id=id order by vote desc LIMIT 15");
    $this->view->setvar("article_list2",$best_article);
    $this->view->setvar("action",$action);
    $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
   }
    
    public function ViewAction($id){
    $auth = $this->session->get('auth');
    $userid=$auth["id"];  
    $newspaper=new Newspaper();
    $users=new Users();
    $article=new Article();
    $subs=new Subs();
    $newspaper=$newspaper->findfirst("id=$id");
    $article=$article->find("owner=$newspaper->id");
    $usersx=$users->findfirst("id=$newspaper->owner");
    if($newspaper->owner==$userid){
        $this->view->setvar("newspaper_owner","yes");
    }
    $this->view->setvar("newspaper",$newspaper);
    $this->view->setvar("owner",$usersx);
    $this->view->setvar("article_list",$article);
    $this->view->setvar("subs",$subs->get_subs($newspaper->id));
   }
   
      public function IndexAction(){
   $auth = $this->session->get('auth');
   $userid=$auth["id"];      
   $newspaper=new Newspaper();
   $newspaper=$newspaper->find("id=id order by subs");
   $this->view->setvar("newspapers",$newspaper);
   $this->view->setvar("userid",$userid);
   $mynewspaper=new Newspaper();
   $mynewspaper=$mynewspaper->find("owner=$userid");
   $this->view->setvar("mynewspaper",$mynewspaper);
    }
   
        public function NewAction(){
$auth = $this->session->get('auth');
   $userid=$auth["id"];  
  	$this->view->form = $this->getForm();
    if($this->request->isPost()){
$newspapername=$this->request->getpost("name");
$country=$this->request->getpost('country');
$regions=$this->request->getpost('regions');
if(empty($newspapername)){
    $this->flash->error("Lütfen geçerli bir isim giriniz.");
    return $this->forward("newspaper/new");
}
$okey=$this->request->getpost("ok");
$price=3;
if($okey!="ok"){
    $this->view->setvar("newspaper_price",$price);
    }else{
    $newspaper=new Newspaper();
    $userinfo=new userinfo();
    $userinfo=$userinfo->findfirst("userid=$userid");
    $gold=$userinfo->gold;
    if($gold<$price){
        $this->flash->error("Yeterli goldunuz yok");
        return $this->forward("newspaper/index");
    }else{
     $newspaper->name=strip_tags($newspapername);
     $newspaper->owner=$userid;
     $newspaper->avatar="img/avatar/no_avatar.jpg";
     $newspaper->country=$country;
     $newspaper->region=$regions;
              if (!$newspaper->save()) {
            foreach ($newspaper->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("newspaper/index/");
        } else {
            $userinfo->gold=$userinfo->gold-$price;
            $userinfo->update();
            $this->flash->success("Gazete kuruldu. Haydi hayırlı olsun.");
            return $this->forward("newspaper/index/");
        }   
        
    }
    }
        
    }
    }
    
    
   public function SubsAction($id){
   $t=$this->_getTranslation();
   $auth = $this->session->get('auth');
   $userid=$auth["id"];
   $subs=new Subs();
   $newspaper=new Newspaper();
   $newspaper=$newspaper->findfirst("id=$id");
   $subsx=$subs->findfirst("userid=$userid and newspaper=$id");
   if($subsx==false){
   $subs->newspaper=$id;
   $subs->userid=$userid;
             if (!$subs->save()) {
            foreach ($subs->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("newspaper/view/".$id);
        } else {
            $newspaper->subs=$newspaper->subs+1;
            $newspaper->update();
            $this->flash->success($t->_("newspaper_subbed"));
             return $this->forward("newspaper/view/".$id);
        }
   
    }else{
           $this->flash->error($t->_("already_sub"));
             return $this->forward("newspaper/view/".$id);
    }
   }
   
   
   public function ManageAction($id){
   $auth = $this->session->get('auth');
   $userid=$auth["id"];
   $newspaper=new Newspaper();
   $newspaper=$newspaper->findfirst("id=$id");
   if($userid==$newspaper->owner){
    $article=new Article();
    $article=$article->find("owner=$id");
    $this->view->setvar("article_list",$article);
    $this->view->setvar("npid",$id);
    
   }else{
           $this->flash->error("Bu alana giriş izniniz yok.");
             return $this->forward("newspaper/index");
    }
}
   
   
     
   
   
    }
    
    ?>