<?php echo $this->getContent(); ?>
<div class="showback"><h2><?=$lang["search_result"];?></h2><hr />
<ul class="nav nav-pills">
<li class="active">
<a href="#users" data-toggle="tab"><?=$lang["users"];?></a>
</li><li></li>
<li>
<a href="#companies" data-toggle="tab"><?=$lang["companies"];?></a>
</li>
<li><a href="#newspapers" data-toggle="tab"><?=$lang["newspapers"];?></a></li>
</ul>
<div class="tab-content"> 
<div class="tab-pane active" id="users">
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["username"];?></th>
            <th><?=$lang["exp"];?></th>
            <th><?=$lang["point"];?></th>
        </tr>
    </thead>
    <?php if(!empty($users)){ $i=1; foreach($users as $user){
        $userinfo=new userinfo();
        $point=$userinfo->ranked($user->id);
        $userinfo=$userinfo->findfirst("userid=$user->id");
        ?>
        <tbody>
        <tr>
            <td><?php echo $i; ?></td>
            <td><a href="<?php echo $this->url->get('homepage/profile/' . $user->id); ?>"><img width="20px" height="20px" src="<?php echo $this->url->get($user->avatar); ?>" /> <?php echo $user->username; ?></a></td>
           <td><?php echo $userinfo->exp; ?></td>
           <td><?=$point[0][2];?></td>
        </tr>
    </tbody>
    
    <?php $i++;}}?>
    </table>
</div>


     <div class="tab-pane" id="companies">     
      
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["company_name"];?></th>
            <th><?=$lang["company_type"];?></th>
            <th><?=$lang["company_worker"];?></th>
            <th><?=$lang["location"];?></th>
            <th><?=$lang["company_quality"];?></th>
            <th>İşlemler</th>
        </tr>
    </thead>
    <?php 
    if(!empty($companies)){
        $i=1;
    foreach($companies as $company){
        $company_types=new CompanyTypes();
        $zones=new Zones();
        $company_types=$company_types->findfirst("type=$company->type and id=$company->type2");
        $worktime=new Worktime();
        $region=$zones->findfirst("id=$company->zones");
        $country=$zones->findfirst("id=$region->parent");
        $worktime=$worktime->find("companyid=$company->id");
        $worker=count($worktime);
        
        ?>
        <tbody>
        <tr>
            <td><?php echo $i; ?></td>
            <td><a href="<?php echo $this->url->get('company/manage/' . $company->id); ?>"><img width="20px" height="20px" src="<?php echo $this->url->get($company->avatar); ?>" /><?php echo $company->name; ?></a></td>
            <td><?php echo $company_types->name; ?></td>
            <td><?php echo $worker; ?></td>
            <td><?php echo $country->name; ?>/<?php echo $region->name; ?></td>
            <td><?php echo $company->quality; ?><?=$lang["quality_text"];?></td>
            <td width="12%"><?php echo $this->tag->linkTo(array('company/edit/' . $company->id, '<i class="fa fa-pencil"></i> ' . $lang['edit'], 'class' => 'btn btn-primary btn-xs')); ?>
            <?php echo $this->tag->linkTo(array('company/sell/' . $company->id, '<i class="fa fa-trash-o "></i> ' . $lang['sell'], 'class' => 'btn btn-danger btn-xs')); ?></td>
           
        </tr>
    </tbody>
    
    <?php $i++;}}?>
    </table>
    </div>
    
         <div class="tab-pane" id="newspapers">     
      
<table class="table table-striped table-advance table-hover" align="center">
     <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["newspaper_name"];?></th>
            <th><?=$lang["newspaper_owner"];?></th>
            <th><?=$lang["newspaper_subs"];?></th>
        </tr>
    </thead>
    <?php 
    if(!empty($newspapers)){
    $i=1;
    foreach($newspapers as $newspaper){
        $subs=new Subs();
        $get_subs=$subs->get_subs($newspaper->id);
        $users=new Users();
        $users=$users->findfirst("id=$newspaper->owner");
        
        ?>
        <tbody>
        <tr>
            <td><?=$i;?></td>
            <td><a href="<?php echo $this->url->get('newspaper/view/' . $newspaper->id); ?>"><img width="20px" height="20px" src="<?php echo $this->url->get($newspaper->avatar); ?>" /><?php echo $newspaper->name; ?></a></td>
            <td><a href="<?php echo $this->url->get('homepage/profile/' . $users->id); ?>"><img width="20px" height="20px" src="<?php echo $this->url->get($users->avatar); ?>" /><?php echo $users->username; ?></a></td>
            <td><?=$get_subs[0];?></td>
      
        </tr>
    </tbody>
    
    <?php  $i++; }}?>
    </table>
    </div>

     
     </div></div>