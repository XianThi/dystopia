<?php
use 
    Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
    Phalcon\Forms\Element\Select,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Hidden,
    Phalcon\Session as Session,
    Phalcon\Mvc\View;

class CompanyController extends ControllerBase
{
	        public function initialize(){
        $t=$this->_getTranslation();
        $this->view->setvar("lang",$t);
        $auth = $this->session->get('auth');
        $userid=$auth["id"];
        $user=Users::findfirst("id=$userid");
        $this->view->setvar("cover",$user->cover);
        $this->view->setvar("avatar",$user->avatar);
        $this->view->setvar("username",$user->username);
                $zones=new Zones();
        $regions=$zones->findfirst("id=$user->zones");
        $country=$zones->findfirst("id=$regions->parent");
       /* 
        $regions=new Regions();
        $country=$country->findfirst("id=$user->country");
        $regions=$regions->findfirst("id=$user->region");
        */
        $this->view->setvar("country_flag",$country->flag);
        $this->view->setvar("country",$country->name);
        $this->view->setvar("region",$regions->name);
        $userinfo=new userinfo();
        $userinfo=$userinfo->findFirst("userid=$userid");
        $this->view->setvar("wellness",$userinfo->wellness);
        $this->view->setvar("energy",$userinfo->energy);
        $this->view->setvar("gold",$userinfo->gold);
        $this->view->setvar("currency",$userinfo->currency);
        $level=new Level();
        $level=$level->findfirst("exp_min<=$userinfo->exp and exp_max>=$userinfo->exp");
        $exp_max=$level->exp_max;
        if($userinfo->exp==$level->exp_max){
            $level=$level->findfirst("level=$level->level+1");
            $exp_max=$level->exp_max;
        }
        $this->view->setvar("exp_max",$exp_max);
        $this->view->setvar("exp",$userinfo->exp);
        $this->view->setvar("level",$level->level);
        $this->view->setTemplateAfter('main2');
        parent::initialize();
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
                                    "onchange" => "this.form.submit()",
                                    "using" => array("id", "name"),
                                    ));
    
    //$this->view->disable();
    }
    
    protected function getForm($entity=null, $edit=false)
	{
		$form = new Form($entity);

		$form->add(new Text("name", array(
			"size" => 24,
			"maxlength" => 70
		)));
        
		$form->add(new Select('type2', CompanyTypes::find(array(
            "columns"   =>  "id,name")
        ),array(
            'useEmpty'  =>  true,
            'emptyText' =>  'None Specified',
            'onchange' => "getval(this);",
            'using'     => array('id', 'name'))));
            
		return $form;
	}
    
    
      public function IndexAction(){
    $t=$this->_getTranslation();
   $auth = $this->session->get('auth');
   $userid=$auth["id"];    
   if($this->request->isPost()){
   $country=$this->request->getPost("country");
   $region=$this->request->getPost("regions");
   $quality=$this->request->getPost("quality");
   $this->view->setvar("quality_post",$quality);
   $this->view->setvar("country_post",$country);
   $this->view->setvar("region_post",$region);
   
   }
   $users=new Users();
   $users=$users->findfirst("id=$userid");
   $company=new Company();
   if(isset($region)){
    $zones="and zones=$region";
   }else{
    $zones="";
   }
   if(isset($quality)){
    $quality_sql="and quality=$quality";
   }else{
    $quality_sql="";
   }
   $companies=$company->find("id=id $zones $quality_sql order by quality limit 20");
   $company=$company->find("owner=$userid");
   $this->view->setvar("my_companies",$company);
   $this->view->setvar("companies",$companies);
   Phalcon\Tag::setTitle("Dystopia | $t[companies]");     
    }
    
    public function ViewAction($id){
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];   
    $company=new Company();
    $company_types=new CompanyTypes();
    $users=new Users();
    $worktime=new Worktime();
    $stocks=new Stocks();
    $worktime=$worktime->get_employes($id);
    $company=$company->findfirst("id=$id");
    if(!$company){
        return $this->forward("homepage/error");
        }
    $stocks=$stocks->findfirst("companyid=$company->id");
    $company_types=$company_types->findfirst("type=$company->type and id=$company->type2");
    $users=$users->findfirst("id=$company->owner");
    if($userid==$company->owner){
        $this->view->setvar("owner","yes");
    }else{$this->view->setvar("owner","no");}
    $this->view->setvar("company",$company);
    $this->view->setvar("company_types",$company_types);
    $this->view->setvar("users",$users);
    $this->view->setvar("worktime",$worktime);
    $this->view->setvar("companyid",$id);
    $this->view->setvar("stocks",$stocks);
    Phalcon\Tag::setTitle("Dystopia | $company->name");  
    }
    
        public function NewAction(){
$t=$this->_getTranslation();
$auth = $this->session->get('auth');
   $userid=$auth["id"];  
  	$this->view->form = $this->getForm();
    if($this->request->isPost()){
$companytype=$this->request->getpost("type2");
$companyname=$this->request->getpost("name");
$country=$this->request->getpost('country');
$regions=$this->request->getpost('regions');
if(empty($companyname)){
    $this->flash->error("Lütfen geçerli bir isim giriniz.");
    return $this->forward("company/new");
}
$okey=$this->request->getpost("ok");
$companyx=new CompanyTypes();  
$companyx=$companyx->findfirst("id=$companytype");
$price=$companyx->price;
$type=$companyx->type;
if($okey!="ok"){
    $this->view->setvar("company_price",$price);
    }else{
    $company=new Company();
    $userinfo=new userinfo();
    $stocks=new Stocks();
    $userinfo=$userinfo->findfirst("userid=$userid");
    $gold=$userinfo->gold;
    if($gold<$price){
        $this->flash->error("Yeterli goldunuz yok");
        return $this->forward("company/index");
    }else{
     $company->name=strip_tags($companyname);
     $company->owner=$userid;
     $company->avatar="img/avatar/no_avatar.jpg";
     $company->type=$type;
     $company->zones=$regions;
     $company->type2=$companytype;
     $company->quality=1;
              if (!$company->save()) {
            foreach ($company->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("company/index/");
        } else {
            $userinfo->gold=$userinfo->gold-$price;
            $userinfo->update();
            $stocks->companyid=$company->id;
            $stocks->total_stock=0;
            $stocks->selling=0;
            $stocks->save();
            $this->flash->success("Şirket kuruldu. Haydi hayırlı olsun.");
            return $this->forward("company/index/");
        }   
        
    }
    }
        
    }
     Phalcon\Tag::setTitle("Dystopia | $t[create_company]"); 
    }
    
    
        public function WorkAction(){
        
  
        
    }
    
    public function ManageAction($id){
        $t=$this->_getTranslation();
        $auth = $this->session->get('auth');
        $userid=$auth["id"];  
        $selling=new Selling();
        $joboffers=new JobOffers();
        $worktime=new Worktime();
        $company=new Company();
        $stock=new Stocks();
        $companytype=new CompanyTypes();
        $company=$company->findfirst("id=$id");
        if($company){
        if($userid==$company->owner){
        $employes=$worktime->get_employes($id);
        if($this->request->isPost()){
        $teklif=$this->request->getpost("teklif");
        if($teklif=="isteklif"){
        $start_time=$this->request->getpost("start_time");
        $end_time=$this->request->getpost("end_time");
        $fee=$this->request->getpost("salary");
        $person=$this->request->getpost("person");
        $joboffer=$joboffers->findfirst("start_time='$start_time' and end_time='$end_time' and owner=$id and person>0");
        if($joboffer){
         $this->flash->error("Bu teklifi zaten koydun.");
         //return $this->forward("company/view/$id");
        }else{
        $joboffers->start_time=$start_time;
        $joboffers->end_time=$end_time;
        $joboffers->fee=$fee;
        $joboffers->owner=$id;
        $joboffers->person=$person;
        $joboffers->jobtype=1;
if (!$joboffers->save()) {
            foreach ($joboffers->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("company/manage/$id");
        } else {
            $this->flash->success("Teklif oluşturuldu.");
            //return $this->forward("company/manage/$id");
        }   
        }
        }
                if($teklif=="urunteklif"){
        $stock=$stock->findfirst("companyid=$id");
        $pcs=$this->request->getpost("pcs");
        $stockx=$stock->total_stock-$stock->selling;
        if($pcs>$stockx){
         $this->flash->error("Yeterli stok yok.");
         //return $this->forward("company/manage/$id");
        }else{
        $price=$this->request->getpost("price");
        $selling->companyid=$id;
        $selling->pcs=$pcs;
        $selling->price=$price;
        $selling->type=$company->type2;
        $selling->quality=$company->quality;
        $selling->zone=$company->zones;
if (!$selling->save()) {
            foreach ($selling->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("company/manage/$id");
        } else {
            $stock->selling=$stock->selling+$pcs;
            $stock->update();
            $this->flash->success("Teklif oluşturuldu.");
            //return $this->forward("company/manage/$id");
        }   
        }
        }
        
        }
        
        
    $companytype=$companytype->findfirst("id=$company->type2");
    $joboffersx=$joboffers->find("owner=$id order by start_time asc");
    $stocks=$stock->findfirst("companyid=$id");
    $sellingx=$selling->find("companyid=$id");
    $this->view->setvar("joboffers",$joboffersx);
    $this->view->setvar("employes",$employes);
    $this->view->setvar("company",$company);
    $this->view->setvar("companyid",$id);
    $this->view->setvar("sellingx",$sellingx);
    $this->view->setvar("companytype",$companytype->avatar);
    $this->view->setvar("stocks",$stocks);
    $this->view->setvar("selling",$selling);
    Phalcon\Tag::setTitle("Dystopia | $company->name $t[manage]"); 
    }else{
        $this->flash->error("Bu alana giriş izniniz yok.");
        return $this->forward("company/index");
    }
    }else{
        $this->flash->error("Şirket bulunamadı.");
        return $this->forward("company/index");
        }
    }
    
    public function ApplyJobAction($id){
    $auth = $this->session->get('auth');
    $userid=$auth["id"];  
    $joboffers=new JobOffers();
   // $userinfo=new userinfo();
    $worktime=new Worktime();
    $functions=new Functions();
    $joboffers=$joboffers->findfirst("id=$id");
   // $userinfo=$userinfo->findfirst("userid=$userid");
    $worktimey=$worktime->findfirst("userid=$userid and companyid=$id and start_time='$joboffers->start_time' and end_time='$joboffers->end_time'");
    if($worktimey){
     $this->flash->error("Bu işte zaten çalışıyorsun.");
     return $this->forward("citizen/jobs");    
    }
    $worktimex=$worktime->get_jobs($userid,$joboffers,$functions);
    if($worktimex!=TRUE){
         $this->flash->error("Bu saatler arasında bir işe sahipsin.");
         return $this->forward("citizen/jobs");
    }
    /*
    $a=$functions->check_time($result["start_time"],$result["end_time"]end_time,$joboffers->start_time);
    $b=$functions->check_time($result["start_time"],$result["end_time"],$joboffers->end_time);
    if($a==TRUE && $b==TRUE){
        
     else{
        return $this->flash->error("Yapacağın işi sikeyim");
            
         
    */

  
    if($joboffers->person>0){
    $owner=$joboffers->get_work($userid);
    //$userinfo->work=$owner;
    //$userinfo->update();
    $joboffers->person=$joboffers->person-1;
    $joboffers->update();
    $worktime->userid=$userid;
    $worktime->start_time=$joboffers->start_time;
    $worktime->end_time=$joboffers->end_time;
    $worktime->companyid=$joboffers->owner;
    $worktime->salary=$joboffers->fee;
    $worktime->save();
    $this->flash->success("işe alındınız !");
    return $this->forward('company/work/'.$joboffers->owner);
    }
    else{
        $this->flash->error("Üzgünüm iş dolu.");
    }
            
    }
    
    public function EditAction($id){
$auth = $this->session->get('auth');
$userid=$auth["id"];
    $company=new Company();
    $company=$company->findfirst("id=$id");
    if($userid==$company->owner){
    $this->view->setvar("company_name",$company->name);
    $this->view->setvar("company_id",$company->id);
        
    }else{
        $this->flash->error("Bu alana giriş izniniz yok.");
        return $this->forward("company/index");
    }
    
    
    }
    
    public function SellAction($id){
        
    }
    
    public function EditinfoAction($id){
   $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $company=new Company();
    $company=$company->findfirst("id=$id");
    if($userid==$company->owner){
    $newcompanyname=$this->request->getPost("company_name");
    if($newcompanyname==""){
    $this->flash->error("Şirket ismi boş olamaz.");
    return $this->forward("company/edit/$id");
    }else{
    $company->name=$newcompanyname;
    if (!$company->update()) {
            foreach ($company->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("company/index/");
        } else {
            $this->flash->success("Şirket ismi düzenlendi.");
            return $this->forward("company/index/");
        }   
    
    } 
    }else{
        $this->flash->error("Bu alana giriş izniniz yok.");
        return $this->forward("company/index");
    }     
   
    }
    
    
    public function AddMoneyAction($id){
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    if($this->request->isPost()){
    $money=$this->request->getPost("money");
    $company=Company::findfirst("id=$id");
    $userinfo=userinfo::findfirst("userid=$userid");
    if($userinfo->currency>=$money){
    $company->money=$company->money+$money;
    $company->update();
    $userinfo->currency=$userinfo->currency-$money;
    if($userinfo->update()){
        $this->flash->success("şirkete para eklendi.");
    }
    
    }
    }
    $this->view->setRenderLevel(View::LEVEL_NO_RENDER); 
    }
    
    public function UploadAction(){
            $auth = $this->session->get('auth');
$userid=$auth["id"];
$users=new Users();
if(!empty($_FILES['avatar']['name'])){
    // Configuration - Your Options
      $allowed_filetypes = array('.jpg','.gif','.bmp','.png'); // These will be the types of file that will pass the validation.
      $max_filesize = 2024288; // Maximum filesize in BYTES (currently 2MB).
      $upload_path = './img/avatar/'; // The place the files will be uploaded to (currently a 'files' directory).
 
   $filename = $_FILES['avatar']['name']; // Get the name of the file (including file extension).
   $ext = substr($filename, strpos($filename,'.'), strlen($filename)-1); // Get the extension from the filename.
 $filenamex=md5($userid).$ext;
   // Check if the filetype is allowed, if not DIE and inform the user.
   if(!in_array($ext,$allowed_filetypes)){
      $this->flash->error('The file you attempted to upload is not allowed.');
 }else{
   // Now check the filesize, if it is too large then DIE and inform the user.
   if(filesize($_FILES['avatar']['tmp_name']) > $max_filesize){
      $this->flash->error("File size too large");
      }else{
 
   // Check if we can upload to the specified path, if not DIE and inform the user.
   if(!is_writable($upload_path)){
         $this->flash->error('You cannot upload to the specified directory, please CHMOD it to 777.');
 }else{
 $newNamePrefix = 'avatar_';
 $manipulator = new ImageManipulator($_FILES['avatar']['tmp_name']);
        $width=$manipulator->getWidth();
        $height=$manipulator->getHeight();
        $newImage = $manipulator->resample($width/2,$height/2);
        // saving file to uploads folder
   // Upload the file to your specified path.
$manipulator->save($upload_path . $newNamePrefix . $filenamex);
$users=$users->findfirst("id=$userid");
$users->avatar=$upload_path.$newNamePrefix.$filenamex;

if (!$users->update()) {
            foreach ($users->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("homepage/settings");
        } else {
            $this->flash->success("Avatar changed.");
            return $this->forward("homepage/settings/");
        }
}
}
 }
 }
    }
    
    
}