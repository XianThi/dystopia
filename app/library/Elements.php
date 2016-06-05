<?php

/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Phalcon\Mvc\User\Component
{
    protected function _getTranslation()
  {

    //Ask browser what is the best language
    $language = $this->request->getBestLanguage();
//var_dump($language);
    //Check if we have a translation file for that lang
    if (file_exists("../app/languages/".$language.".php")) {
       require "../app/languages/".$language.".php";
    } else {
       // fallback to some default
       require "../app/languages/en.php";
    }

    //Return a translation object
    return new \Phalcon\Translate\Adapter\NativeArray(array(
       "content" => $lang_text
    ));

  }
    public function initialize()
    {   $t=$this->_getTranslation();
        parent::initialize();
    }
    private $_headerMenu = array(
        'pull-left' => array(
            'homepage' => array(
                'caption' => 'homepage',
                'action' => 'index'
            ),
            'messages' => array(
                'caption' => 'messages',
                'action' => 'index'
            ),
            'profile' => array(
                'caption' => 'profile',
                'action' => 'index'
            ),
            'settings' => array(
                'caption' => 'settings',
                'action' => 'index'
            ),
        ),

    );
private $_headerMenu2 = array(
        'pull-left' => array(
            'index' => array(
                'caption' => 'homepage',
                'action' => 'index'
            ),
            'denetimraporu' => array(
                'caption' => 'messages',
                'action' => 'index'
            ),
            'about' => array(
                'caption' => 'profile',
                'action' => 'index'
            ),
            'contact' => array(
                'caption' => 'settings',
                'action' => 'index'
            ),
        ),
        'pull-right' => array(
            'session' => array(
                'caption' => 'login_register',
                'action' => 'index'
            ),
        )
    );
    private $_tabs = array(
        '' => array(
            'controller' => 'invoices',
            'action' => 'index',
            'any' => false
        ),
        'RIPT' => array(
            'controller' => 'companies',
            'action' => 'index',
            'any' => true
        ),
        'Çıktı Al' => array(
            'controller' => 'products',
            'action' => 'index',
            'any' => true
        ),
        'Arama Yap' => array(
            'controller' => 'producttypes',
            'action' => 'index',
            'any' => true
        ),
        'Profil' => array(
            'controller' => 'invoices',
            'action' => 'profile',
            'any' => false
        )
    );
    private $_tabs2 = array(
        'Anasayfa' => array(
            'controller' => 'yonetim',
            'action' => 'index',
            'any' => false
        ),
        'Duyuru İşlemleri' => array(
            'controller' => 'duyuru',
            'action' => 'index',
            'any' => true
        ),
        'Seminer/Grup İşlemleri' => array(
            'controller' => 'islemler',
            'action' => 'index',
            'any' => true
        ),
        'Şifre İşlemleri' => array(
            'controller' => 'sifre',
            'action' => 'index',
            'any' => true
        ),
        'Kullanıcı Yönetimi' => array(
            'controller' => 'islemler',
            'action' => 'profile',
            'any' => false
        )
    );
    
    private $_tabs3=array('Denetim Raporu' => array(
            'controller' => 'denetimraporu',
            'action' => 'index',
            'any' => true
        ));
    /**
     * Builds header menu with left and right items
     *
     * @return string
     */
    public function getMenu()
    {
        $t=$this->_getTranslation();

        $auth = $this->session->get('auth');
        if ($auth["yetki"]==2 || $auth["yetki"]==3){
         if ($auth["yetki"]==0) {
            $this->_headerMenu2['pull-right']['yonetim'] = array(
                'caption' => 'Administrator',
                'action' => 'index'
            );}
        if ($auth) {
            $this->_headerMenu2['pull-right']['session'] = array(
                'caption' => 'logout',
                'action' => 'end'
            );
        } else {
            unset($this->_headerMenu2['pull-left']['denetimraporu']);
        }

        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu2 as $position => $menu) {
            echo '<ul class="nav top-menu', $position, '">';
            foreach ($menu as $controller => $option) {
                if ($controllerName == $controller) {
                    echo '<li>';
                } else {
                    echo '<li>';
                }
                echo Phalcon\Tag::linkTo($controller.'/'.$option['action'], $option['caption']);
                echo '</li>';
            }
            echo '</ul>';
        }
        echo '</div>';
        
        }else{
        if ($auth["yetki"]==0) {
            $this->_headerMenu['pull-right']['yonetim'] = array(
                'caption' => 'Administrator',
                'action' => 'index'
            );}
   /*     if ($auth) {
            $this->_headerMenu['pull-right']['session'] = array(
                'caption' => 'logout',
                'action' => 'end'
            );
       } else {
            unset($this->_headerMenu['pull-left']['invoices']);
        } */

        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<ul class="nav top-menu', $position, '">';
            foreach ($menu as $controller => $option) {
                if ($controllerName == $controller) {
                    echo '<li>';
                } else {
                    echo '<li>';
                }
                echo Phalcon\Tag::linkTo($controller.'/'.$option['action'], $t->_($option['caption']));
                echo '</li>';
            }
        }
        
       
    }
    }
    public function getdrTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs3 as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo Phalcon\Tag::linkTo($option['controller'].'/'.$option['action'], $t->_("$caption")), '<li>';
        }
        echo '</ul>';
    }
    
    public function getadminTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs2 as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo Phalcon\Tag::linkTo($option['controller'].'/'.$option['action'], $t->_("$caption")), '<li>';
        }
        echo '</ul>';
    }
    public function getTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo Phalcon\Tag::linkTo($option['controller'].'/'.$option['action'], $t->_("$caption")), '<li>';
        }
        
        echo '</ul>';
    }
}
