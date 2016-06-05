<?php
use     Phalcon\Mvc\View;
class MarketController extends ControllerBase
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
    
    
    public function ProductsAction(){
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $users=Users::findfirst("id=$userid");
    if($this->request->isPost()){
    $quality=$this->request->getpost("quality");
    $type=$this->request->getpost("type1");
    $type2=$this->request->getpost("type2");
    }
    if(empty($type)){
    if(!empty($quality)){
    $quality="and quality=$quality";
    }else{
    $quality="";
    }
    if(empty($type2)){
    $type="";
    }else{
    $type2="and type=$type2";
    $type=$type2;
    }
    }else{
    if(empty($type2)){
    $type="and type=$type";
    $quality="";
    }else{
    $type="and type=$type2";
    $quality="and quality=$quality";
    }
    }
    
    
    $comptype=new CompanyTypes();
    $comptype=$comptype->find("id=id");
    $selling=new Selling();
    $selling=$selling->getselling($type,$users->zones,$quality);
    $this->view->setvar("selling",$selling);
    $this->view->setvar("comptype",$comptype);
    }
    
    public function CompaniesAction(){
    
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $users=Users::findfirst("id=$userid");
    if($this->request->isPost()){
    $quality=$this->request->getpost("quality");
    $type=$this->request->getpost("type");
    $type2=$this->request->getpost("type2");
    }
      if(!empty($quality)){
        $quality="and quality=$quality";
    }else{
        $quality="";
    }
        if(!empty($type)){
        $type="and type=$type";
    }else{
    if(isset($type2)){
        $type=$type2;
        }else{
            $type="";
        }
    }
    if(!empty($type) && empty($type2)){
        $quality="";
    }
     if(!empty($type2)){
        $type2="and type=$type2";
    }else{
        $type2="";
    }
    if(!empty($type) && !empty($type2)){
    $type=$type2;
    }
    $comptype=new CompanyTypes();
    $comptype=$comptype->find("id=id");
    $selling=new SellingCompanies();
    $selling=$selling->getselling($type,$quality,$users->zones);
    $this->view->setvar("selling",$selling);
    $this->view->setvar("comptype",$comptype);
        
    }
    
    
        public function BuyRawAction($compid){
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    if($this->request->isPOST()){
    $pcs=$this->request->getpost("pcs");
    $pcs=abs($pcs);
    $sellid=$this->request->getpost("sellid");
    $selling=Selling::findfirst("id=$sellid");
    if($selling->pcs<$pcs){
        $this->flash->error("bu kadar ürün yok");
    }
    else{
    $company=Company::findfirst("id=$compid");
    $companyseller=Company::findfirst("id=$selling->companyid");
    $price=$selling->price*$pcs;
    if($company->money>=$price){
    $stocks=new Stocks();
    $stocks=$stocks->findfirst("companyid=$selling->companyid");
    $stocks->total_stock=$stocks->total_stock-$pcs;
    $stocks->selling=$stocks->selling-$pcs;
       if (!$stocks->update()) {
            foreach ($stocks->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            }else{
    $selling->pcs=$selling->pcs-$pcs;
    $selling->update();
    $company->raw=$company->raw+$pcs;
    $company->money=$company->money-$price;
    if($company->update()){
    $companyseller->money=$companyseller->money+$price;
    $companyseller->update();
    $this->flash->success("hammadde alındı.");
    }
    }
    }else{
    $this->flash->error("şirkette yeterli para yok.");
    }
    }
    }
    $this->view->setRenderLevel(View::LEVEL_NO_RENDER);    
    }
    
    
    public function BuyItemAction(){
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    if($this->request->isPost()){
    $pcs=$this->request->getpost("pcs");
    $pcs=abs($pcs);
    $sellid=$this->request->getpost("sellid");
    $selling=Selling::findfirst("id=$sellid");
    if($selling->pcs<$pcs){
        $this->flash->error("bu kadar ürün yok");
    }
    else{
    $user=userinfo::findfirst("userid=$userid");
    $price=$selling->price*$pcs;
    if($user->currency>=$price){
    $stocks=new Stocks();
    $stocks=$stocks->findfirst("companyid=$selling->companyid");
    $companyseller=Company::findfirst("id=$selling->companyid");
    $stocks->total_stock=$stocks->total_stock-$pcs;
    $stocks->selling=$stocks->selling-$pcs;
    $stocks->update();
    $selling->pcs=$selling->pcs-$pcs;
    $selling->update();
    $inventory=new Inventory();
    $items=new Items();
    $items=$items->findfirst("type=$selling->type and quality=$selling->quality");
    $invitem=$inventory->findfirst("userid=$user->userid and itemid=$items->id");
    if($invitem){
    $invitem->pcs=$invitem->pcs+$pcs;
    $invitem->update();    
    }else{
    $inventory->userid=$user->userid;
    $inventory->itemid=$items->id;
    $inventory->pcs=$pcs;
    $inventory->save();
    }
    $user->currency=$user->currency-$price;
    $user->update();
    $companyseller->money=$companyseller->money+$price;
    $companyseller->update();
    $this->flash->success("$pcs adet $items->name alındı");
    }else{
    $this->flash->error("paran yetersiz.");
    }
    }
    }
    $this->view->setRenderLevel(View::LEVEL_NO_RENDER);    
    }
    
    public function BuyCompAction(){
    $t=$this->_getTranslation();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    if($this->request->isPost()){
    $sellid=$this->request->getpost("sellid");
    $selling=SellingCompanies::findfirst("id=$sellid");
    if($selling){
    $user=userinfo::findfirst("userid=$userid");
    $price=$selling->price;
    if($user->gold>=$price){
    $company=new Company();
    $company=$company->findfirst("$selling->companyid");
    $company->owner=$user->userid;
    $company->update();
    $user->gold=$user->gold-$price;
    $user->update();
    $selling->delete();
    $this->flash->success("$company->name, $price gold karşılığında alındı.");  
    }else{
    $this->flash->error("paran yetersiz.");
    }
    
    }
    }
    $this->view->setRenderLevel(View::LEVEL_NO_RENDER);    
    }
    
    }