<?php

class ControllerBase extends Phalcon\Mvc\Controller
{
    
    protected function _getmessagebadge(){
    $auth = $this->session->get('auth');
    $userid=$auth["id"];        
if(!empty($userid)){
    $messages=new Messages();
    $messages=$messages->find("readx=0 and to_id=$userid order by timestamp");
    $sayi=$messages->count();
     $notifications=new Notifications();
$notifications=$notifications->getnotifications($userid);
    return $this->assets
    ->addJs("js/messages.js?badge=$sayi",true,true,array("id"=>"message"))
    ->addJs("js/notifications.js?badge=$notifications[0]",true,true,array("id"=>"notif"));  
    }
    }

    
         protected function _getwelness(){
    $auth = $this->session->get('auth');
    $userid=$auth["id"];       
    if(!empty($userid)){ 
    $userinfo=new userinfo();
    $userinfo=$userinfo->findfirst("userid=$userid");
    $wellnes=$userinfo->wellness;
    if($wellnes<=0){
        $this->flash->error("You are dead aslşkhşlsahk :D");
        return $this->forward("dead/citizen");
    }
     }
    
    }
    
    
    protected function _getonline(){
	echo '
    <div class="onlineWidget">
	<div class="panel2"><img class="preloader" src="img/preloader.gif" alt="Loading.." width="22" height="22" /></div>
	<div class="count"></div>
    <div class="label">online</div>
    
    <div class="arrow"></div></div>
	';
}
    
    
    
    protected function _getTranslation()
  {

    //Ask browser what is the best language
    $language = $this->request->getBestLanguage();
//    $language="en";
//var_dump($language);
$languages=new Languages();
$languagesx=$languages->findfirst("code='$language'");
if(!$languagesx){
       // fallback to some default
       require "../app/languages/en.php";
    }else{
if (file_exists("../app/languages/".$language.".php")) {
       require "../app/languages/".$language.".php";
    } else {
       // fallback to some default
       require "../app/languages/en.php";
    }
    }
    //Return a translation object
    return new \Phalcon\Translate\Adapter\NativeArray(array(
       "content" => $lang_text
    ));

  }
 
  
    protected function initialize()
    {
        Phalcon\Tag::prependTitle('Dystopia | ');
       $auth = $this->session->get('auth');
    $userid=$auth["id"];       
         if(!isset($auth)){
            return  $this->session->remove('auth');
         }else{
     $message=$this->_getmessagebadge();
     $wellness=$this->_getwelness();
//     $online=$this->_getonline();
$userinfo=userinfo::findfirst("id=$userid");
if($userinfo->work==1){
$function=new Functions();
$t=time();
$now=date("G:i:s",$t);
$working=$function->working($userid,$now);
if($working[0]!=FALSE){
$uriParts = explode('/', $_SERVER["REQUEST_URI"]);
if($uriParts[1]!="company" && $uriParts[1]!="session" && $uriParts[1]!="friends" && $uriParts[1]!="bootstrap" && $uriParts[1]!="stock" && $uriParts[1]!="pages" && $uriParts[1]!="market" && $uriParts[1]!="newspaper" && $uriParts[1]!="article" && $uriParts[1]!="homepage" && $uriParts[1]!="zone" && $uriParts[1]!="notifications" && $uriParts[1]!="messages" && $uriParts[1]!="shout"){
return $this->response->redirect("pages/worknow/$working[1]");

}}
         }}
        
    }

    protected function forward($uri){
    	$uriParts = explode('/', $uri);
    	return $this->dispatcher->forward(
    		array(
    			'controller' => $uriParts[0], 
    			'action' => $uriParts[1]
    		)
    	);
    }
}
