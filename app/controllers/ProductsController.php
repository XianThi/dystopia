<?php
include("fpdf/html2pdf.php");
use Phalcon\Tag;
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Db\Adapter;
class ProductsController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Çıktı Al');
        parent::initialize();
    }

    public function indexAction()
    {
    return $this->response->redirect("companies/index/2");

    }

    public function searchAction()
    {
        
       
    }


    public function newAction($id)
    {
          $numberPage = 1;
     if ($this->request->isAjax()){
    $action=$this->request->getpost("action");
    if($action=="cikti"){
         $seminer=new Companies();
         $seminerler=new seminerler();
          $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
         $seminer_turu=$this->request->getpost("seminer_turu");
            $donem=$this->request->getpost("donem");
            $semineradi=$this->request->getpost("seminer_adi");
            $seminertarihi=$this->request->getpost("seminer_tarihi");
            $seminersaati=$this->request->getpost("seminer_saati");
    $seminerid=$seminer->seminer_id($seminer_turu,$donem,$semineradi,$seminertarihi,$seminersaati);    
        $this->view->setvar("seminer_bilgi",$seminerler->seminer_bilgileri($seminerid[0]["id"])); 
            $query = Criteria::fromInput($this->di, "katilimcilar", $_POST);
            $this->persistent->searchParams = $query->getParams();
        
      $productTypes = katilimcilar::find("seminer_id=".$seminerid[0]["id"]." order by isim asc");
      if (count($productTypes) == 0) {
            $this->flash->notice("Kişi bulunamadı.");
            return $this->forward("producttypes/index");
            
        }
        
        $paginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $productTypes,
            "limit" => 200,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("seminer_listesi", $productTypes);
 } else {
            $numberPage = $this->request->getQuery("page", "int");
            if ($numberPage <= 0) {
                $numberPage = 1;
            }
        }
    }
    else{
        $seminerler=new seminerler();
 $this->view->setvar("seminer_bilgi",$seminerler->seminer_bilgileri($id)); 
    $query = Criteria::fromInput($this->di, "katilimcilar", $_POST);
            $this->persistent->searchParams = $query->getParams();
     $productTypes = katilimcilar::find("seminer_id=".$id);
      if (count($productTypes) == 0) {
            $this->flash->notice("Kişi bulunamadı.");
            return $this->forward("producttypes/index");
            
        }
        
        $paginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $productTypes,
            "limit" => 200,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        //$this->view->setVar("seminer_listesi", $productTypes);  

 }
    }
    

    public function editAction($id)
    {
      
    }

    public function createAction()
    {

      
    }

    public function saveAction()
    {
    
    }

    public function deleteAction($id)
    {
      
    }
}
