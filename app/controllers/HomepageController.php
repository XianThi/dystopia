<?php
class HomepageController extends ControllerBase
{
        public function initialize()
    {   $t=$this->_getTranslation();
        $auth = $this->session->get('auth');
        $uriParts = explode('/', $_SERVER["REQUEST_URI"]);
        if(isset($uriParts[2])){
        $action= $uriParts[2];
        }else{
        $action="index";
        }
        if(isset($uriParts[3])){
        $action_id= $uriParts[3];
        }else{
        $action_id=$auth["id"];
        }
        $this->view->setvar("lang",$t);
        $this->view->setTemplateAfter('main2');
        $userid=$auth["id"];
        if($action=="profile"){
        $useridx=$action_id;
        }else{
            $useridx=$userid;
        }
        if(!empty($userid)){
        $user=Users::findfirst("id=$userid");
        $userx=Users::findfirst("id=$useridx");
        if($user==false){
        $this->flash->error("User not found.");
        $this->forward("homepage/index");
         }else{  
        if($userx==false){
                $this->flash->error("User not found.");
        $this->forward("homepage/index");
        }else{
        $this->view->setvar("cover",$user->cover);
        $this->view->setvar("avatar",$user->avatar);
        $this->view->setvar("username",$user->username);
        $this->view->setvar("coverx",$userx->cover);
        $this->view->setvar("avatarx",$userx->avatar);        
        $this->view->setvar("usernamex",$userx->username);
        $this->view->setvar("useridx",$userx->id);
        $zones=new Zones();
        $regions=$zones->findfirst("id=$user->zones");
        $country=$zones->findfirst("id=$regions->parent");
        $regionsx=$zones->findfirst("id=$userx->zones");
        $countryx=$zones->findfirst("id=$regionsx->parent");
                       
       /* 
        $regions=new Regions();
        $country=$country->findfirst("id=$user->country");
        $regions=$regions->findfirst("id=$user->region");
        */
        $this->view->setvar("country_flag",$country->flag);
        $this->view->setvar("country",$country->name);
        $this->view->setvar("region",$regions->name);
        $this->view->setvar("country_flagx",$countryx->flag);
        $this->view->setvar("countryx",$countryx->name);
        $this->view->setvar("regionx",$regionsx->name);
        $userinfo=new userinfo();
        
        $userinfo=$userinfo->findFirst("userid=$userid");
        $userinfox=$userinfo->findFirst("userid=$useridx");
        $this->view->setvar("wellness",$userinfo->wellness);
        $this->view->setvar("energy",$userinfo->energy);
        $this->view->setvar("gold",$userinfo->gold);
        $this->view->setvar("currency",$userinfo->currency);
        $this->view->setvar("wellnessx",$userinfox->wellness);
        $this->view->setvar("energyx",$userinfox->energy);
        $this->view->setvar("goldx",$userinfox->gold);
        $this->view->setvar("currencyx",$userinfox->currency);
        $level=new Level();
        $level=$level->findfirst("exp_min<=$userinfo->exp and exp_max>=$userinfo->exp");
        $exp_max=$level->exp_max;
        if($userinfo->exp==$level->exp_max){
            $level=$level->findfirst("level=$level->level+1");
            $exp_max=$level->exp_max;
        }
        $levelx=$level->findfirst("exp_min<=$userinfox->exp and exp_max>=$userinfox->exp");
        $exp_maxx=$levelx->exp_max;
        if($userinfox->exp==$levelx->exp_max){
            $levelx=$level->findfirst("level=$levelx->level+1");
            $exp_maxx=$levelx->exp_max;
        }
        $this->view->setvar("exp_max",$exp_max);
        $this->view->setvar("exp",$userinfo->exp);
        $this->view->setvar("level",$level->level);
         $this->view->setvar("exp_maxx",$exp_maxx);
        $this->view->setvar("expx",$userinfox->exp);
        $this->view->setvar("levelx",$levelx->level);
        
      
        parent::initialize();
    }
    }
    }
    }
    
    
   public static function _ago($date,$rcs = 0) {
  {
    if(empty($date)) {
        return "No date provided";
    }
    
    $periods         = array("second", "minute", "hour", "day", "week", "month", "year", "decade");
    $lengths         = array("60","60","24","7","4.35","12","10");
    
    $now             = time();
    $unix_date         = strtotime($date);
    
       // check validity of date
    if(empty($unix_date)) {    
        return "Bad date";
    }

    // is it future date or past date
    if($now > $unix_date) {    
        $difference     = $now - $unix_date;
        $tense         = "ago";
        
    } else {
        $difference     = $unix_date - $now;
        $tense         = "from now";
    }
    /*
    for($j = 0; $difference >= $lengths[$j] && $j < count($lengths)-1; $j++) {
        $difference /= $lengths[$j];
    }
    
    $difference = round($difference);
    
    if($difference != 1) {
        $periods[$j].= "s";
    }
    */
    return floor($difference/(60*60*24))." days ago";
   }

  // return floor($difference/(60*60*24))." ago ";
    }
    
      public function indexAction(){
         $t=$this->_getTranslation();
         Phalcon\Tag::setTitle("Dystopia | $t[homepage_title]");
    $language = $this->request->getBestLanguage();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $users=new Users();
    $users=$users->findfirst("id=$userid");
    $notice=new Notice();
    $notice=$notice->findfirst("lang='$language' order by id desc");
    $this->view->setvar("title",$notice->title);
    $this->view->setvar("text",$notice->text);
    $this->view->setvar("image",$notice->image);
        }
        
         public function MessagesAction()
    {
        $t=$this->_getTranslation();
        $auth = $this->session->get('auth');
        $userid=$auth["id"];
        Phalcon\Tag::setTitle("Dystopia | $t[message]");
    $messages=new Messages();
    $messages=$messages->find("to_id=$userid group by messageid order by id desc");
    if (count($messages) == 0) {
        $this->view->setvar("no_message","yes");
            $this->view->setvar("message_text",$t->_("no_any_message"));
           // return $this->forward("index/index");
        }
$numberPage = 1;
  $paginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $messages,
            "limit" => 10,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();
        $this->view->setVar("page", $page);
        $this->view->setVar("messages", $messages);
        //Sent message
        $messages=new Messages();
      $smessages=$messages->find("from_id=$userid group by messageid");
    if (count($smessages) == 0) {
        $this->view->setvar("no_smessage","yes");
            $this->view->setvar("smessage_text",$t->_("no_any_message"));
           // return $this->forward("index/index");
        }
$snumberPage = 1;
  $spaginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $smessages,
            "limit" => 10,
            "page" => $snumberPage
        ));
        $spage = $spaginator->getPaginate();
        $this->view->setVar("spage", $spage);
        $this->view->setVar("smessages", $smessages);
        
    }
    
    
  

    public function ProfileAction($id =''){
        
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    if($id==$userid){
    $buttons=FALSE;
    $inventory_view=TRUE;
    }else{
    $buttons=TRUE;
    $inventory_view=FALSE;
    }
    $inventory=Inventory::find("userid=$userid");
    $friends=new Friends();
    $friend=$friends->findfirst("(userid=$userid and friendid=$id) or (userid=$id and friendid=$userid)");
    if($friend==FALSE){
    $fr="no";
        }else{
    $fr="yes";
        }
    $userinfo=new userinfo();
    $company=new Company();
    $party=new Party();
    $military=new Army();
    $newspaper=new Newspaper();
    $users=new Users();
    $worktime=new Worktime();
    $reward_user=new RewardUser();
if($userid==""){}else{
if(empty($id)){
    return $this->forward("homepage/error");
    }

$userinfo=$userinfo->findfirst("userid=$id");
if(!$userinfo){
  return $this->forward("homepage/error");
}
$users=$users->findfirst("id=$id");
$birthday=self::_ago($users->created_at,0);
  // var_dump($birthday);
    $this->view->setvar("birthday",$birthday);
    $this->view->setvar("bio",$userinfo->bio);
    $this->view->setvar("str",$userinfo->str);
$ranked=$userinfo->ranked($id);
        $zones=new Zones();
        $regions=$zones->findfirst("id=$users->zones");
        $country=$zones->findfirst("id=$regions->parent");
$ranked_nation=$userinfo->nation_ranked($id,$country->id);
    $this->view->setvar("rank",$ranked[0]["rank"]);
    if(isset($ranked_nation[0])){
    $this->view->setvar("nation_rank",$ranked_nation[0]["rank"]);
}else{
    $this->view->setvar("nation_rank","N/A");
}
// var_dump($ranked);
    $this->view->setvar("int",$userinfo->intelling);
    $this->view->setvar("economic_skill",$userinfo->economic_skill);
if($userinfo->work!=""){
$works=$worktime->get_works($userid);
$this->view->setvar("works",$works);
$this->view->setvar("company",$company);
//    $this->view->setvar("company_name",$company->name);
//    $this->view->setvar("company_avatar",$company->avatar);
//  $this->view->setvar("company_id",$company->id);
    }
    
if($userinfo->party!=""){
$party=$party->findfirst("id=$userinfo->party");
if($party){
    $this->view->setvar("party_name",$party->name);
    $this->view->setvar("party_avatar",$party->avatar);
    $this->view->setvar("party_id",$party->id);
    }}
if($userinfo->army!=""){
$military=$military->findfirst("id=$userinfo->army");
if($military){
    $this->view->setvar("military_name",$military->name);
    $this->view->setvar("military_avatar",$military->avatar);
    $this->view->setvar("military_id",$military->id);
}}
if($userinfo->newspaper!=""){
$newspaper=$newspaper->findfirst("id=$userinfo->newspaper");
if($newspaper){
    $this->view->setvar("newspaper_name",$newspaper->name);
    $this->view->setvar("newspaper_avatar",$newspaper->avatar);
    $this->view->setvar("newspaper_id",$newspaper->id);
    }}
$this->view->setvar("buttons",$buttons);
$this->view->setvar("fr",$fr);
$this->view->setvar("inventory_view",$inventory_view);
$this->view->setvar("inventory",$inventory);
$reward_user=$reward_user->find("userid=$id group by rewardid");
if($reward_user){
    $this->view->setvar("reward_user",$reward_user);
}
      Phalcon\Tag::setTitle("Dystopia | $users->username $t[profile_title]");
    }
    }
        
    
    public function SettingsAction(){
         $t=$this->_getTranslation();
    Phalcon\Tag::setTitle("Dystopia | $t[settings_title]");  
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $userinfo=new userinfo();
    $userinfo=$userinfo->findfirst("userid=$userid");
    $this->view->setvar("bio",$userinfo->bio);
        }
        
    public function LogoutAction(){
    return $this->forward("session/end");
    }
    
    public function OnlineAction(){
$functions=new Functions();
$online=new Online();
if($functions->is_bot()) die();
$stringIp = $functions->getRealIpAddr();
//$stringIp="8.8.8.8";
$intIp = ip2long($stringIp);
$online_result=$online->onlinex($intIp,$stringIp,$this->cookies->get('geoData'));
echo "Çevrimiçi : $online_result";
return  $this->view->setRenderLevel(Phalcon\Mvc\View::LEVEL_NO_RENDER);
    }
    
    public function GeoDataAction(){

    $functions=new Functions();
    $online=new Online();
    if($functions->is_bot()) die();
    $get_online=$online->get_online();
    foreach($get_online as $row)
{
	echo '
	<div class="geoRow">
		<div class="flag"><img src="/img/famfamfam-countryflags/'.strtolower($row['countryCode']).'.gif" width="16" height="11" /></div>
		<div class="country" title="'.htmlspecialchars($row['country']).'">'.$row['country'].'</div>
		<div class="people">'.$row['total'].'</div>
	</div>
	';
}
         return  $this->view->setRenderLevel(Phalcon\Mvc\View::LEVEL_NO_RENDER);  
    }
    
    
    }