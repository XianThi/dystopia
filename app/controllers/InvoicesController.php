<?php
use Phalcon\Tag as Tag;
use Phalcon\Flash as Flash;
use Phalcon\Session as Session;
class InvoicesController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Ortak Ekran');
        parent::initialize();
    }


    public function indexAction(){
        $auth = $this->session->get('auth');
        $user_id=$auth["id"];
        $duyurular=new duyurular();
        $uriParts = explode('/', $_SERVER["REQUEST_URI"]);
        $all = $uriParts[4];
 
        if($all=="all"){
            $text="";
 $this->view->setvar("duyurular",$duyurular->duyuru_listesi($user_id,$text)); 
    }else
    {
                  $text="and okundu=0";
 $this->view->setvar("duyurular",$duyurular->duyuru_listesi($user_id,$text));   
    }
    }

    

    public function profileAction()
    {
        //Get session info
        $auth = $this->session->get('auth');

        //Query the active user
        $user = Users::findFirst($auth['id']);
        if ($user == false) {
            $this->_forward('index/index');
        }

        $request = $this->request;

        if (!$request->isPost()) {
            Tag::setDefault('name', $user->isim_soyisim);
            Tag::setDefault('email', $user->email);
        } else {

            $name = $request->getPost('name', 'string');
            $email = $request->getPost('email', 'email');

            $name = strip_tags($name);

            $user->isim_soyisim = $name;
            $user->email = $email;
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('Hesap bilgileri güncellendi.');
            }
        }
    }
    
      public function successAction(){
    $uriParts = explode('/', $_SERVER["REQUEST_URI"]);
    $duyuruid = $uriParts[4];
    duyurular::okundu($duyuruid);
      $this->response->redirect('invoices/index');
          }
          
      public function deleteAction(){
    $uriParts = explode('/', $_SERVER["REQUEST_URI"]);
    $duyuruid = $uriParts[4];
   $duyurular=new duyurular();
  $duyurular->sil($duyuruid);
      $this->response->redirect('invoices/index');
          /*
      $duyuru_sil = duyurular::findFirst($duyuru_id);
if ($duyuru_sil != false) {
    if ($duyuru_sil->delete() == false) {
        echo "Sorry, we can't delete the robot right now: \n";
        foreach ($duyuru_sil->getMessages() as $message) {
            echo $message, "\n";
        }
    } else {
        echo "The robot was deleted successfully!";
    }
}
          */
          }
}
