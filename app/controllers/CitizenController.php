<?php
class CitizenController extends ControllerBase
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

    public function WorkAction(){
Phalcon\Tag::setTitle("Dystopia | Work Today");
$auth = $this->session->get('auth');
$userid=$auth["id"];
$userinfo=new userinfo();
$worktime=new Worktime();
$function=new Functions();
$userinfo=$userinfo->findfirst("userid=$userid");
$company=$worktime->findfirst("userid=$userid");

if(!empty($company)){

$working=$function->working($userid,$worktime);
if($working[0]==FALSE){
    $this->flash->error("Şuan çalışmıyorsun, kendine bir iş bakabilirsin.");
    return $this->forward("citizen/jobs/");
}else{
if($userinfo->work==1){
    $this->flash->success($working[1]);
    //$this->forward("company/view/$working[0]");
}else{
$this->flash->error("şuan aktif olarak çalıştığın bir iş var ama bazı sebeplerden dolayı çalışamıyorsun. lütfen bildirimlerini kontrol et.");
}
}
}else{
    return $this->forward("citizen/jobs/");
}
}
        
    public function TrainAction(){
        Phalcon\Tag::setTitle("Dystopia | Train Today");
        if($this->request->isPost()){
  //return $this->response->redirect('train/result');

   }
   
}    
        
        
    public function BrainAction(){
Phalcon\Tag::setTitle("Dystopia | Enhance Intelligence");

if ($this->request->isPost()){
 
    }
    
}

    public function EditbioAction(){
if ($this->request->isPost()){
    $auth = $this->session->get('auth');
$userid=$auth["id"];
    $userinfo=new userinfo();
 $bio=$this->request->getpost("bio");
 $bio = ereg_replace("[^[:space:]a-zA-Z0-9*_.-]", "", $bio);
  $userinfo=$userinfo->findfirst("userid=$userid");
$userinfo->bio=$bio;
if(!$userinfo->update()){
     foreach ($userinfo->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("homepage/settings");
        } else {
            $this->flash->success("Bio edited.");
            return $this->forward("homepage/settings");
        }

    }
    
}

public function UploadAction(){
    $auth = $this->session->get('auth');
$userid=$auth["id"];
$users=new Users();
if($this->request->isPost()){
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

if(!empty($_FILES['cover']['name'])){

    // Configuration - Your Options
      $allowed_filetypes = array('.jpg','.gif','.bmp','.png'); // These will be the types of file that will pass the validation.
      $max_filesize = 2024288; // Maximum filesize in BYTES (currently 2MB).
      $upload_path = './img/cover/'; // The place the files will be uploaded to (currently a 'files' directory).
 
   $filename = $_FILES['cover']['name']; // Get the name of the file (including file extension).
   $ext = substr($filename, strpos($filename,'.'), strlen($filename)-1); // Get the extension from the filename.
 $filenamex=md5($userid).$ext;
   // Check if the filetype is allowed, if not DIE and inform the user.
   if(!in_array($ext,$allowed_filetypes)){
      $this->flash->error('The file you attempted to upload is not allowed.');
 }else{
   // Now check the filesize, if it is too large then DIE and inform the user.
   if(filesize($_FILES['cover']['tmp_name']) > $max_filesize){
      $this->flash->error("File size too large");
      }else{
 
   // Check if we can upload to the specified path, if not DIE and inform the user.
   if(!is_writable($upload_path)){
         $this->flash->error('You cannot upload to the specified directory, please CHMOD it to 777.');
 }else{
 $newNamePrefix = 'cover_';
 $manipulator = new ImageManipulator($_FILES['cover']['tmp_name']);
        $width=$manipulator->getWidth();
        $height=$manipulator->getHeight();
        $newImage = $manipulator->resample(940,170);
        // saving file to uploads folder
   // Upload the file to your specified path.
$manipulator->save($upload_path . $newNamePrefix . $filenamex);
$users=$users->findfirst("id=$userid");
$users->cover=$upload_path.$newNamePrefix.$filenamex;

if (!$users->update()) {
            foreach ($users->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("homepage/settings");
        } else {
            $this->flash->success("Cover changed.");
            return $this->forward("homepage/settings/");
        }
}
}
 }
 }

 }
  return $this->forward("homepage/settings/");

 

}

public function JobsAction(){
$auth = $this->session->get('auth');
$userid=$auth["id"];
$users=new Users();
    if($this->request->isPost()){
    $end_time=$this->request->getpost("end_time");
    $start_time=$this->request->getpost("start_time");
    if(!empty($end_time)){
    $end_time="and job_offers.end_time='$end_time'";
    }
    if(!empty($start_time)){
    $start_time="and job_offers.start_time='$start_time'";
    }
    }else{
    $start_time="";
    $end_time="";
    }
    $users=$users->findfirst("id=$userid");
    $joboffers=new JobOffers();
    $joboffers=$joboffers->get_jobs($users->zones,$start_time,$end_time);
    $this->view->setvar("joboffers",$joboffers);
}


}