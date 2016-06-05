<?php
use \Phalcon\Tag;
class YonetimController extends ControllerBase
{
    public function initialize()
    {
      $this->view->setTemplateAfter('main');
        Tag::setTitle('Yönetim Paneli');
        parent::initialize();
    }

    public function indexAction()
    
{
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "katilimcilar", $_POST);
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
        $productTypes = katilimcilar::find("id=id order by id desc");
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
    
}
