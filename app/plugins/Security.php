<?php

use Phalcon\Events\Event,
	Phalcon\Mvc\User\Plugin,
	Phalcon\Mvc\Dispatcher,
	Phalcon\Acl;

/**
 * Security
 *
 * This is the security plugin which controls that users only have access to the modules they're assigned to
 */
class Security extends Plugin
{
//Check whether acl data already exist
	public function __construct($dependencyInjector)
	{
		$this->_dependencyInjector = $dependencyInjector;
	}

	public function getAcl()
	{
		if (!isset($this->persistent->acl)) {

			$acl = new Phalcon\Acl\Adapter\Memory();

			$acl->setDefaultAction(Phalcon\Acl::DENY);

			//Register roles
			$roles = array(
				'users' => new Phalcon\Acl\Role('Users'),
				'guests' => new Phalcon\Acl\Role('Guests'),
                'admin' => new Phalcon\Acl\Role('Admin'),
                'mod' => new Phalcon\Acl\Role('Mod')
			);
			foreach ($roles as $role) {
				$acl->addRole($role);
			}

        
            //Private area resources
			$privateResources = array(
                'homepage' => array('index','messages','profile','settings','logout','online','geodata'),
                'messages' => array('index','read','new','delete'),
                'profile'  => array('edit'),
                'citizen'  => array('work','train','brain','upload','editbio','password','disable','jobs'),
                'workout'  => array('result','index'),
                'company'  => array('index','view','work','edit','new','manage','applyjob','editinfo','upload','getRegions','deleteoffers','addmoney','sell'),
                'newspaper'=> array('view','edit','new','index','subs','manage','getnews'),
                'article'  => array('view','edit','delete','new','vote'),
                'profile'  => array('index'),
                'settings' => array('index'),
                'gangs'    => array('index','new','view'),
                'maps' => array('index'),
                'notifications' => array('index','view'),
                'zone' => array('index','view','admin','gov'),
                'friends' => array('index','add','accept','reject'),
                'shout' => array('add','index'),
                'pages' => array('worknow'),
                'search' => array('all'),
                'market' => array('products','buyitem','companies','buycomp','buyraw','exchange'),
                'ideology' => array('view'),
                'userlsit' => array('zone','rank','str','level'),
                'stock' => array('index','getMarketInfo','UpdateMarket')
			);

			//Public area resources
			$publicResources = array(
				'index' => array('index','homepage'),
				'about' => array('index'),
				'session' => array('index', 'register', 'start', 'end','success','delete','getRegions'),
				'contact' => array('index', 'send'),
                'homepage' => array('online','geodata'),
                'cronjob' => array('minutely','hourly','daily','weekly','product')
			);
            
			foreach ($privateResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}
            
			foreach ($publicResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}

			//Grant access to public areas to both users and guests
			foreach ($roles as $role) {
				foreach ($publicResources as $resource => $actions) {
				    foreach ($actions as $action){
					$acl->allow($role->getName(), $resource, $actions);
				}
			}
            }
            

			//Grant acess to private area to role Users
			foreach ($privateResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('Users', $resource, $action);
                    $acl->allow('Admin', $resource, $action);
				}
			}


			//The acl is stored in session, APC would be useful here too
			$this->persistent->acl = $acl;
		}

		return $this->persistent->acl;
	}

	/**
	 * This action is executed before execute any action in the application
	 */
	public function beforeDispatch(Event $event, Dispatcher $dispatcher)
	{

		$auth = $this->session->get('auth');
		if (!$auth){
			$role = 'Guests';
		} else {
		  $yetki=$auth["yetki"];
        if($yetki==0){
            $role='Admin';
            }
        if($yetki==1){
			$role = 'Users';
            }
        if($yetki==2){
            $role='Mod';
            }
        if($yetki==3){
            $role='Banned';
            }
		}

		$controller = $dispatcher->getControllerName();
		$action = $dispatcher->getActionName();

		$acl = $this->getAcl();

		$allowed = $acl->isAllowed($role, $controller, $action);
		if ($allowed != Acl::ALLOW) {
			$this->flash->error("Bu alana giriş izniniz yok.");
			$dispatcher->forward(
				array(
					'controller' => 'index',
					'action' => 'index'
				)
			);
			return false;
		}
	}

}
