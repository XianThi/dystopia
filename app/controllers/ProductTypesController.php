<?php

use Phalcon\Tag;
use Phalcon\Mvc\Model\Criteria;

class ProductTypesController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Arama Yap');
        parent::initialize();
    }

    public function indexAction()
    {
        $this->session->conditions = null;
    }

    public function searchAction()
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

        $productTypes = katilimcilar::find($parameters);
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
//var_dump($page);
        $this->view->setVar("page", $page);
        $this->view->setVar("producttypes", $productTypes);
      
        
    }

    public function newAction()
    {
    }

    public function editAction($id)
    {
        $request = $this->request;
        if (!$request->isPost()) {

            $producttypes = katilimcilar::findFirst(array('id=:id:', 'bind' => array('id' => $id)));
            if (!$producttypes) {
                $this->flash->error("Bu kişiye düzenleme yapılamıyor.");
                return $this->forward("producttypes/index");
            }
            $this->view->setVar("id", $producttypes->id);
            Tag::displayTo("id", $producttypes->id);
            Tag::displayTo("dosya_no", $producttypes->dosya_no);
            Tag::displayTo("isim", $producttypes->isim);
            Tag::displayTo("soyisim", $producttypes->soyisim);
            Tag::displayTo("vaka_sorumlusu", $producttypes->vaka_sorumlusu);
            Tag::displayTo("tc_kimlik", $producttypes->tc_kimlik);
        }
    }

    public function createAction()
    {
        if (!empty($seminer_id)){
        if (!$this->request->isPost()) {
            return $this->forward("producttypes/index");
        }

        $producttypes = new ProductTypes();
        $producttypes->id = $this->request->getPost("id", "int");
        $producttypes->name = $this->request->getPost("name");

        $producttypes->name = strip_tags($producttypes->name);

        if (!$producttypes->save()) {
            foreach ($producttypes->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("producttypes/new");
        } else {
            $this->flash->success("Kişi oluşturuldu, plan kişiye tanımlandı.");
            return $this->forward("producttypes/index");
        }
    }
    else {$this->flash->error((string) "Plan tanımlanmadı.");
    return $this->forward("companies/index");
    }
}
    public function saveAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward("producttypes/index");
        }

        $id = $this->request->getPost("id", "int");
        $producttypes = katilimcilar::findFirst("id='$id'");
        if ($producttypes == false) {
            $this->flash->error("Kişi zaten var" . $id);

            return $this->forward("producttypes/index");
        }
        $producttypes->tc_kimlik = $this->request->getPost("tc_kimlik", "int");
        $producttypes->dosya_no = $this->request->getPost("dosya_no", "striptags");
        $producttypes->isim = $this->request->getPost("isim", "striptags");
        $producttypes->soyisim = $this->request->getPost("soyisim", "striptags");
        $producttypes->vaka_sorumlusu = $this->request->getPost("vaka_sorumlusu", "striptags");

        if (!$producttypes->save()) {
            foreach ($producttypes->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("producttypes/edit/" . $producttypes->id);
        } else {
            $this->flash->success("Kişi güncellendi.");
            return $this->forward("producttypes/index");
        }
    }

    public function deleteAction($id)
    {
        $id = $this->filter->sanitize($id, array("int"));

        $producttypes = katilimcilar::findFirst('id="' . $id . '"');
        if (!$producttypes) {
            $this->flash->error("Kişi bulunamadı.");

            return $this->forward("producttypes/index");
        }

        if (!$producttypes->delete()) {
            foreach ($producttypes->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("producttypes/search");
        } else {
            $this->flash->success("Kişi silindi.");
            return $this->forward("producttypes/search");
        }
    }
}
