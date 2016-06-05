<?php
use 
    Phalcon\Tag;

class DenetimRaporuController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Denetim Raporu');
        parent::initialize();
    }

    public function indexAction()
    {  
        $auth = $this->session->get('auth');
        $user_id=$auth["id"];
        $yetki=$auth["yetki"];
        if($yetki==2){
            return $this->forward("denetimraporu/index2");
        }else{
            $numberPage = 1;
        if ($this->request->isPost()) {
            $query = denetimraporu::find("sahip=$user_id and ustyazi=1 order by id desc");
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

        $productTypes = denetimraporu::find("sahip=$user_id and ustyazi=1 order by id desc");
        if (count($productTypes) == 0) {
            $this->flash->error("Tanımlı denetim raporu kaydı bulunamadı.");
           // return $this->forward("index/index");
            
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
      
    }}
    
    public function index2Action()
    {  
        $auth = $this->session->get('auth');
        $user_id=$auth["id"];
        $uzman=users::findfirst("id=".$user_id);
        $uzman=$uzman->isim_soyisim;
            $numberPage = 1;
        if ($this->request->isPost()) {
            $query = denetimraporu::find("uzman='$uzman' and ustyazi=0 order by id desc");
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

        $productTypes = denetimraporu::find("uzman='$uzman' and ustyazi=0 order by id desc");
        if (count($productTypes) == 0) {
            $this->flash->error("Tanımlı denetim raporu kaydı bulunamadı.");
           // return $this->forward("denetimraporu/index2");
            
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
    $auth = $this->session->get('auth');
    $user_id=$auth["id"];
$uzman=users::findfirst("id=".$user_id);
$vakasorumlusu=users::find("yetki=3 order by isim_soyisim asc");
$this->view->setvar("vakasorumlusu",$vakasorumlusu);
$this->view->setvar("uzman",$uzman);
        if ($this->request->isPost()){
           $dosya_no=$this->request->getpost("dosya_no");
           $dosya_turu=$this->request->getpost("dosya_turu");
           $isim_soyisim=$this->request->getpost("isim_soyisim");
           $sahip=$this->request->getpost("vaka_sorumlusu");
           $ustyazi=1;
        
        $denetimraporu=new DenetimRaporu();
        $denetimraporu->dosya_no=$dosya_no;
        $denetimraporu->dosya_turu=$dosya_turu;
        $denetimraporu->isim_soyisim=$isim_soyisim;
        $denetimraporu->uzman=$uzman->isim_soyisim;
        $denetimraporu->sahip=$sahip;
        $denetimraporu->ustyazi=$ustyazi;
        $denetimraporu->save();
        if (!$denetimraporu->save()) {
			foreach ($denetimraporu->getMessages() as $message) {
				$this->flash->error((string) $message);
			}
		}
echo Tag::linkTo(array("denetimraporu/index", "Geri Dön", "class" => "btn btn-ttc pull-left"));
		$this->flash->success("Denetim raporu bilgisi vaka sorumlusuna gönderildi!");
        }
        
        }
        
  public function onayAction($id){
     $auth = $this->session->get('auth');
        $user_id=$auth["id"];
        $yetki=$auth["yetki"];
        if($yetki==2){
        $denetimraporu=denetimraporu::findFirst('id='.(int)$id);
        if($denetimraporu){
        $denetimraporu->ustyazi=2;
        if (!$denetimraporu->update()) {
			foreach ($denetimraporu->getMessages() as $message) {
				$this->flash->error((string) $message);
			}
		}

echo Tag::linkTo(array("denetimraporu/index", "Geri Dön", "class" => "btn btn-ttc pull-left"));
		$this->flash->success("Denetim raporu onaylandı bilgisi silindi.Denetim rapor yedeği alındı.");
        
    
            }else
            {echo "Kayıt bulunamadı";}
            } else{
    $denetimraporu=denetimraporu::findFirst('id='.(int)$id);
    $denetimraporu->ustyazi=0;
if (!$denetimraporu->update()) {
			foreach ($denetimraporu->getMessages() as $message) {
				$this->flash->error((string) $message);
			}
		}
echo Tag::linkTo(array("denetimraporu/index", "Geri Dön", "class" => "btn btn-ttc pull-left"));
		$this->flash->success("Denetim raporu onaylandı bilgisi uzmana gönderildi!");
        
    
  }
  }
  
public function reddetAction($id){
$this->view->setvar("id",$id);

}

public function redAction(){
if ($this->request->isPost() == true) {
    $id=$this->request->getpost("id");
    $neden=$this->request->getPost("neden");
    $denetimraporu=denetimraporu::findFirst('id='.(int)$id);
    $denetimraporu->ustyazi=0;
    $denetimraporu->red=0;
    $denetimraporu->red_neden=$neden;
  
    if(!$denetimraporu->update()){
        	foreach ($denetimraporu->getMessages() as $message) {
				$this->flash->error((string) $message);
			}
    }
    echo Tag::linkTo(array("denetimraporu/index", "Geri Dön", "class" => "btn btn-ttc pull-left"));
    	$this->flash->success("Denetim raporu reddedildi!");
}
}

}
