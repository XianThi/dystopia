<?php
use Phalcon\Forms\Form,
    Phalcon\Forms\Element\Text,
    Phalcon\Forms\Element\Select,
    Phalcon\Forms\Element\Hidden,
    Phalcon\Forms\Element\TextArea;
class MessagesController extends ControllerBase
{
   public function initialize()
    {   $t=$this->_getTranslation();
        $uriParts = explode('/', $_SERVER["REQUEST_URI"]);
        if(isset($uriParts[3])){
        $action= $uriParts[3];}else{
            $action="index";
        }
        if(isset($uriParts[4])){
        $action_id= $uriParts[4];}
        $this->view->setvar("lang",$t);
        $this->view->setTemplateAfter('main2');
        $auth = $this->session->get('auth');
        $userid=$auth["id"];
        if($action=="profile"){
            $userid=$action_id;
        }
        $user=Users::findfirst("id=$userid");
        if($user==""){
        $this->flash->error("User not found.");
            exit();
         }else{  
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
        Phalcon\Tag::setTitle("Messages");
        parent::initialize();
    }
    }

      public function indexAction()
    {
    return $this->forward("homepage/messages/");
        }
        
         public function newAction($id)
    {
        $t=$this->_getTranslation();
        $form = new Form();
        $this->view->setvar("form",$form);
         $auth = $this->session->get('auth');
        $userid=$auth["id"];
        $user=new Users();
        if(!empty($id)){
            $user=$user->findfirst("id=$id");
            $form->add(new Text("title",array("style"=>"width:500px;")));
          $form->add(new TextArea("message",array("style"=>"height:200px;width:600px;","maxlenght"=>"255")));
        if ($this->request->isPost()) {
            $message=$this->request->getPost("message");
            $title=$this->request->getpost("title");
            $messages=new Messages();
            $messages->message = $message;
            $messages->to_id = $id;
            $messages->from_id = $userid;
            $messages->readx=0;
            $messages->timestamp=new \Phalcon\db\RawValue('now()');
            $messages->messageid=uniqid(rand(), true);
            $messages->title=$title;
            $messages->delete_user1=1;
            $messages->delete_user2=1;            
            if (!$messages->save()) {
            foreach ($messages->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("messages/new/".$id);
        } else {
            $messages->sent_message($id);
            $this->flash->success($t->_("message_sent"));
            return $this->forward("homepage/messages/");
        }
            }
        
        }
        else{
            $this->flash->Error("Please select a user");
            exit();
        }
    
    }
         public function ReadAction($id)
    { $t=$this->_getTranslation();
     $auth = $this->session->get('auth');
     $userid=$auth["id"];
      $user=new Users();
        $messages=new Messages();
        if($this->request->isPost()){
        $message=$this->request->getPost("message");
        $to_id=$this->request->getPost("to_id");
        $query=$messages->findfirst("messageid=$id and from_id=$to_id");
        $messages->message = $message;
            $messages->to_id = $to_id;
            $messages->from_id = $userid;
            $messages->readx=0;
     
            $messages->timestamp= new Phalcon\Db\RawValue('now()');
            $messages->messageid=$query->messageid;
            $messages->title=$query->title;
            if (!$messages->save()) {
            foreach ($messages->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
        }
         else {
            $this->flash->success($t->_("message_sent"));
        }
        }
       
        if(!empty($id)){
        $query=$messages->findfirst("messageid=$id");
        $this->view->setvar("title",$query->title);
        $count=$messages->get_message($id);
        $x=$count[0][0];
        $y=$x-10; 
        if($y<0){
            $y=0;
        }
        $pm1=$messages->find("messageid=$id order by timestamp asc LIMIT $x OFFSET $y");
        $this->view->setvar("pm1",$pm1);
            }else{
            $this->flash->Error("Please select a message");
            exit();
        }
    }
    
  public function DeleteAction(){
 if($this->request->ispost()){
 $checkbox=$this->request->getpost("checkbox");
$messages=new Messages();
$count=$messages->count();
for($i=0;$i<count($checkbox);$i++){
    $del_id = $checkbox[$i];
    if($del_id==""){echo "This message cant delete.";}else{
    $messages=$messages->find("messageid=$del_id");
    foreach($messages as $x){
    $x->delete_user1=0;
    }
    if ($x->update() == false) {
        echo "Sorry, not deleted item: \n";
        foreach ($x->getMessages() as $message) {
            echo $message;
        }
    } else {
         $this->flash->success("Delete selected message!");
    }}}
    

  }else{
            $this->flash->Error("Not selected item.");
            exit();
        }
  }
    
    }