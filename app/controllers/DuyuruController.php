<?php
use \Phalcon\Tag;
class DuyuruController extends ControllerBase
{
    public function initialize()
    {
      $this->view->setTemplateAfter('main');
        Tag::setTitle('Duyuru Yönetimi');
        parent::initialize();
    }

    public function indexAction()
    
{
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "duyurular", $_POST);
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
            if ($numberPage <= 0) {
                $numberPage = 1;
            }
        }

        $parameters = array();
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }
        $productTypes = duyurular::find("id=id order by id desc");
        if (count($productTypes) == 0) {
            $this->flash->notice("Kişi bulunamadı.");
            return $this->forward("producttypes/index");
            
        }

        $paginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $productTypes,
            "limit" => 10,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("producttypes", $productTypes);
        
    }
    
public function newAction()
    {
if($this->request->ispost()){
        $duyuru = new Duyurular();
          $this->view->setvar("kisiler_aktif","Pasif");
        $duyuru->baslik = $this->request->getPost("baslik");
        $duyuru->baslik = strip_tags($duyuru->baslik);
        $duyuru->icerik = $this->request->getPost("icerik");
        $duyuru->yazar = $this->request->getPost("yazar");
        $duyuru->tarih = new \Phalcon\db\RawValue('now()');
        $duyuru->okundu= 0;
        $sahip=$this->request->getPost("sahip");
        foreach($sahip as $sahipx){
        if($sahipx=="all"){
        $duyurux=new Duyuru();
        $duyurux=$duyurux->kisiler();
        foreach($duyurux as $duyuruxx){
        $duyuru->sahip=$duyuru->sahip.",".$duyuruxx["id"];
        }}else{
        $duyuru->sahip = $duyuru->sahip.",".$sahipx;
        }
        }
       /* var_dump($duyuru->sahip);*/
        
       if (!$duyuru->save()) {
            foreach ($duyuru->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("duyuru/new");

        } else {
            $this->flash->success("Duyuru oluşturuldu.");
            return $this->response->redirect("duyuru/index");
 

}}else{
    $duyuru=new Duyuru();
  $this->view->setvar("kisiler_aktif","Aktif");
  $this->view->setvar("kisiler",$duyuru->kisiler());   
}
}
    
    public function editAction($id)
    {
        $request = $this->request;
        if (!$request->isPost()) {

            $duyuru = duyurular::findFirst(array('id=:id:', 'bind' => array('id' => $id)));
            if (!$duyuru) {
                $this->flash->error("Bu duyuru değiştirilemiyor.");
                return $this->forward("duyuru/index");
            }
            $this->view->setVar("id", $duyuru->id);
Tag::displayTo("id", $duyuru->id);
            Tag::displayTo("baslik", $duyuru->baslik);
            Tag::displayTo("icerik", $duyuru->icerik);
            Tag::displayTo("yazar", $duyuru->yazar);
            Tag::displayTo("tarih", $duyuru->tarih);
            Tag::displayTo("sahip", $duyuru->sahip);
        }
    }

    
public function saveAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward("duyuru/index");
        }

        $id = $this->request->getPost("id", "int");
        $duyuru = duyurular::findFirst("id='$id'");
        if ($duyuru == false) {
            $this->flash->error("Duyuru zaten var:" . $id);

            return $this->forward("duyuru/index");
        }
        $duyuru->baslik = $this->request->getPost("baslik", "int");
        $duyuru->icerik = $this->request->getPost("icerik", "striptags");
        $duyuru->yazar = $this->request->getPost("yazar", "striptags");
        $duyuru->tarih = $this->request->getPost("tarih", "striptags");
        $duyuru->sahip = $this->request->getPost("sahip", "striptags");

        if (!$duyuru->save()) {
            foreach ($duyuru->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("duyuru/edit/" . $duyuru->id);
        } else {
            $this->flash->success("Duyuru güncellendi.");
            return $this->forward("duyuru/index");
        }
    }
    
    public function deleteAction($id){
   $duyurular=new duyurular();
  $duyurular->sil($id);
      $this->response->redirect('duyuru/index');
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
