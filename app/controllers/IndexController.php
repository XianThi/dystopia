<?php

class IndexController extends ControllerBase
{
  
    public function initialize()
    {   $t=$this->_getTranslation();
        $this->view->setvar("lang",$t);
        $this->view->setTemplateAfter('main');
        
        Phalcon\Tag::setTitle($t->_("welcome"));
        parent::initialize();
    }

    public function indexAction()
    {
        $auth=$this->session->get("auth");
        if($auth){
            $this->forward("homepage/index");
        }else{
           // $this->forward("session/index");
            if (!$this->request->isPost()) {
            $t=$this->_getTranslation();
            $this->flash->notice($t->_("notice"));
        }
        }
    }
    public function homepageAction()
    {   
        
        }

}
