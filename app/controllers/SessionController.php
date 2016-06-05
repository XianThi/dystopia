<?php
use Phalcon\Db\RawValue;
use Phalcon\Tag as Tag;

class SessionController extends ControllerBase
{
    public function initialize()
    {   $t=$this->_getTranslation();
        $this->view->setvar("lang",$t);
        $this->view->setTemplateAfter('main');
        Tag::setTitle($t->_("login"));
        parent::initialize();
    }

    public function indexAction()
    {
    
    }
    public function successAction()
    {

    }
    public function deleteAction()
    {

    }
    public function getRegionsAction(){
         $this->view->setRenderLevel(Phalcon\Mvc\View::LEVEL_NO_RENDER);
//header('Content-Type: application/json');

      $country_id = $_REQUEST['country_id'];
    if($country_id!='')
    {
       
      $country_id=$_REQUEST['country_id'];
    }
    else
    {
        $country_id="";
        exit();
    }

     echo $this->tag->select(array("regions",
                                     Zones::find("parent = ".$country_id),
                                    "useEmpty"  =>  true,
                                    "emptyText" =>  "Please select",
                                    "using" => array("id", "name"),
                                    ));
    
    //$this->view->disable();
    }
    
    
    public function registerAction()
    { $request = $this->request;
        $t=$this->_getTranslation();        
         Tag::setTitle($t->_("register_now"));

        if ($request->isPost()) {
            $username = $request->getPost('username');
            $email = $request->getPost('email', 'email');
            $password = $request->getPost('password');
            $repeatPassword = $request->getPost('repeatPassword');    
            $country=$request->getpost('country');
            $regions=$request->getpost('regions');
            if ($password != $repeatPassword) {
                $this->flash->error('Şifreler eşleşmedi.');
                return false;
            }
            //User 
            $user = new Users();
            $user->username = $username;
            $user->password = sha1($password);
            //$user->country = $country;
            $user->email = $email;
            $user->zones=$regions;
            $user->citizenship=$country;
            $user->created_at = new RawValue('now()');
            $user->active = 'Y';
            $user->avatar = 'public/img/avatar/no_avatar.jpg';

            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
            //User Info
            $userinfo=new userinfo();
            $userinfo->userid=$user->id;
            $userinfo->bio="";
            $userinfo->wellness=100;
            $userinfo->exp=0;
            $userinfo->str=0;
            $userinfo->economic_skill=0;
            $userinfo->gold=0;
            $userinfo->currency=20;
            $userinfo->country_id=$regions;
            $userinfo->energy=100;
            $userinfo->level=1;
              if ($userinfo->save() == false) {
                foreach ($userinfo->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                Tag::setDefault('email', '');
                Tag::setDefault('password', '');
                $this->flash->success($t->_("thanks_for_register"));
                return $this->forward('session/index');
            }
        }
    }
    
    }

    /**
     * Register authenticated user into session data
     *
     * @param Users $user
     */
    private function _registerSession($user)
    {
        $this->session->set('auth', array(
            'id' => $user->id,
            'name' => $user->username,
            'yetki'=> '1'
        ));
    }

    /**
     * This actions receive the input from the login form
     *
     */
    public function startAction()
    {
        $t=$this->_getTranslation(); 
        if ($this->request->isPost()) {
            $email = $this->request->getPost('email', 'email');

            $password = $this->request->getPost('password');
            $password = sha1($password);

            $user = Users::findFirst("email='$email' AND password='$password' AND active='Y'");
            if ($user != false) {
                $this->_registerSession($user);
                $this->flash->success($user->username. ' giriş başarıyla yapıldı.');
              //   if ($user->yetki!=2 || $user->yetki!=3){
              return $this->response->redirect('homepage/index');
           // }
          //  else{
          //   return $this->response->redirect('denetimraporu/index');   
            //}
            
            }
            $username = $this->request->getPost('email', 'alphanum');
            $user = Users::findFirst("username='$username' AND password='$password' AND active='Y'");
            if ($user != false) {
                $this->_registerSession($user);
                $this->flash->success($user->username. ' giriş başarıyla yapıldı.');
           //   if ($user->yetki!=2 || $user->yetki!=3){
              return $this->response->redirect('homepage/index');
           // }
           // else{
           //   return $this->response->redirect('denetimraporu/index');   
          //  }
            
            }

            $this->flash->error($t->_("login_error"));
        }

        return $this->forward('session/index');
    }

    /**
     * Finishes the active session redirecting to the index
     *
     * @return unknown
     */
    public function endAction()
    {
        $t=$this->_getTranslation(); 
        $this->session->remove('auth');
        $this->flash->success($t->_("goodbye"));
        return $this->forward('index/index');
    }
}
