<script type="text/javascript">
function addfriend(user2_id){   
$.ajax({
   type: "POST",
   url: "<?php echo $this->url->get('friends/add/'); ?>"+user2_id,
success: function(response){
 $.gritter.add({
               title: 'Friend Request',
               text: response,
               fade_in_speed: 'medium', // how fast notifications fade in (string or int)
               fade_out_speed: 2000, // how fast the notices fade out
               time: 3000 // hang on the screen for...
            });
        }
 });
}

function deletefriend(user2_id){   
$.ajax({
   type: "POST",
   url: "<?php echo $this->url->get('friends/delete/'); ?>"+user2_id,
success: function(response){
 $.gritter.add({
               title: 'Friend Deleted',
               text: response,
               fade_in_speed: 'medium', // how fast notifications fade in (string or int)
               fade_out_speed: 2000, // how fast the notices fade out
               time: 3000 // hang on the screen for...
            });
        }
 });
}
</script>
<div class="panel" style="background-image: url('/<?php echo $coverx; ?>');background-size: 100% 170px; height: 170px;">
<a href="<?php echo $this->url->get('homepage/settings#cover'); ?>" class="btn btn-xs btn-primary pull-right" style="margin:10px;"><span class="glyphicon glyphicon-picture"></span> <?php echo $lang['change_cover']; ?></a>
<div><img class="img-circle" style="border:3px solid;" src="/<?php echo $avatarx; ?>" width="170" alt="<?php echo $usernamex; ?>" /></div></div>
<h2><?php echo $usernamex; ?><?php if($buttons==TRUE){ ?> 
<?php if($fr=="no"){?>
<a title="<?=$lang["add_friend"];?>" onclick="addfriend('<?php echo $useridx; ?>')"><i class="fa fa-plus-circle fa-border"></i></a> 
<?php }else{ ?>
<a title="<?=$lang["delete_friend"];?>" onclick="deletefriend('<?php echo $useridx; ?>')"><i class="fa fa-minus-circle fa-border"></i></a> 
<?php } ?>
<a title="<?=$lang["donate"];?>" onclick=""><i class="fa fa-briefcase fa-border"></i></a>
<a title="<?=$lang["report"];?>" onclick=""><i class="fa fa-exclamation-triangle fa-border"></i></a>
<?php } ?></h2>
<div class="showback">
    <div class="row mt">
  <div class="col-md-4 box0">
<label><?php echo $lang['wellness']; ?> : </label>
<div class="progress progress-striped active">
						  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<?=$wellnessx;?>" aria-valuemin="0" aria-valuemax="100" style="width: <?=$wellness;?>%">
						    <span><?=$wellnessx;?>%</span>
						  </div>
						</div>
</div>
 
 <div class="col-md-4 box0">
<label><?php echo $lang['level']; ?> : <?php echo $levelx; ?></label>
<div class="progress progress-striped active">
<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<?php echo $expx/$exp_maxx*100; ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $exp/$exp_max*100; ?>%">
						    <span><?php echo $expx; ?>/<?php echo $exp_maxx; ?></span>
						  </div></div>
                          </div>

<div class="col-md-4 box0">
<label><?php echo $lang['energy']; ?> : <b></b></label>
<div class="progress progress-striped active">
						  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<?=$energyx;?>" aria-valuemin="0" aria-valuemax="100" style="width: <?=$energyx;?>%">
						    <span><?=$energyx;?></span>
						  </div>
						</div>
	</div>                
                           
               
  
<div class="col-md-3 box0"><label><?php echo $lang['location']; ?> : </label>  <img src="<?php echo $this->url->get($country_flagx); ?>" height="14px" width="14px" /> <?php echo $countryx; ?> , <?php echo $regionx; ?> (<?php echo $lang['change']; ?>) <br />

</div><div class="col-md-3 box0"><label><?php echo $lang['citizenship']; ?> : </label> <img src="<?php echo $this->url->get($country_flagx); ?>" height="14px" width="14px" /> buraya ırk ismi
</div>

</div>
</div>
<?php echo $this->getContent(); ?>
<div class="content-panel">
<div class="row mt">
<div class="col-md-2"><div class="showback">
<div class="grey-panel pn" style="height: 100%;"><div class="grey-header"><?=$lang["who_is"];?></div>

<label><?php echo $lang['birthday']; ?> :</label><?php echo $birthday; ?><br />
<label><?php echo $lang['national_rank']; ?> :</label><?php if(isset($nation_rank)){echo $nation_rank;} ?><br />
<label><?php echo $lang['international_rank']; ?>: </label> <span><?php echo $rank; ?></span><br />

</div>

<div class="grey-panel pn" style="height: 100%; margin-top:20px;"><div class="grey-header"><?=$lang["where_is_work"];?></div>
<?php
if(isset($works)){
 foreach($works as $result){
    $company=$company->findfirst("id=".$result["companyid"]);
?>
<div style="text-align: left; margin-bottom:10px;"><img width="20px" height="20px" src='<?php echo $this->url->get(''); ?><?php if(isset($company->avatar)){echo $company->avatar;}?>'/><a href='<?php echo $this->url->get('company/view/'); ?><?php if(isset($company->id)){echo $company->id;}?>' > <?php if(isset($company->name)){echo $company->name;}?> </a></div>
<?php }}else{?>
<img width="20px" height="20px" src='<?php echo $this->url->get('img/avatar/no_avatar.jpg'); ?>'/><a href='<?php echo $this->url->get('company/view/'); ?>' > <?=$lang["not_found"];?> </a> 
<?php } ?>

</div>
<div class="grey-panel pn" style="height: 100%; margin-top:20px;"><div class="grey-header"><?php echo $lang['gang']; ?></div>

<div style="text-align: left; margin-bottom:10px;"><img width="20px" height="20px" src='<?php echo $this->url->get(''); ?><?php if(isset($gang_avatar)){echo $gang_avatar;}else{echo 'img/avatar/no_avatar.jpg';} ?>'/><a href='<?php echo $this->url->get('gang/view/'); ?><?php if(isset($gang_id)){echo $gang_id;}?>'><?php if(isset($gang_name)){echo $gang_name;}else{echo $lang["not_found"];}?> </a> </div>
</div>

<div class="grey-panel pn" style="height: 100%; margin-top:20px;"><div class="grey-header"><?php echo $lang['party']; ?></div>

<div style="text-align: left; margin-bottom:10px;"><img width="20px" height="20px" src='<?php echo $this->url->get(''); ?><?php if(isset($party_avatar)){echo $party_avatar;}else{echo 'img/avatar/no_avatar.jpg';} ?>'/><a href='<?php echo $this->url->get('party/view/'); ?><?php if(isset($party_id)){echo $party_id;}?>' > <?php if(isset($party_name)){echo $party_name;}else{echo $lang["not_found"];}?> </a>
</div></div>

<div class="grey-panel pn" style="height: 100%; margin-top:20px;"><div class="grey-header"><?php echo $lang['military']; ?></div>

<div style="text-align: left; margin-bottom:10px;"><img width="20px" height="20px" src='<?php echo $this->url->get(''); ?><?php if(isset($military_avatar)){echo $military_avatar;}else{echo 'img/avatar/no_avatar.jpg';}?>'/><a href='<?php echo $this->url->get('military/view/'); ?><?php if(isset($military_id)){echo $military_id;}?>' > <?php if(isset($military_name)){echo $military_name;}else{echo $lang["not_found"];}?> </a>
</div></div>

<div class="grey-panel pn" style="height: 100%; margin-top:20px;"><div class="grey-header"><?php echo $lang['newspaper']; ?></div>

<div style="text-align: left; margin-bottom:10px;"><img width="20px" height="20px" src='<?php echo $this->url->get(''); ?><?php if(isset($newspaper_avatar)){echo $newspaper_avatar;}else{echo 'img/avatar/no_avatar.jpg';}?>'/><a href='<?php echo $this->url->get('newspaper/view/'); ?><?php if(isset($newspaper_id)){echo $newspaper_id;}?>' > <?php if(isset($newspaper_name)){echo $newspaper_name;}else{echo $lang["not_found"];}?> </a> </div>
</div>
</div>
</div>

<div class="col-md-10">
<div class="showback">
<div class="twitter-panel pn"><div class="grey-header grey-panel"><?=$lang["bio"];?></div>
<p><?php echo $bio; ?></p> 
<p class="user">@<?php echo $usernamex; ?></p>
</div>

<div class="col-md-6">
<div class="col-md-12">
<div class="showback">
<div class="grey-header grey-panel"><?=$lang["economic_details"];?></div>
<div class="col-md-9"><?=$lang["economic_skill"];?></div> <div class="col-md-1"><?php echo $economic_skill; ?></div><div class="col-md-1"></div><br />
</div> </div>
<?php if($inventory_view==TRUE){ ?>
<div class="col-md-12">
<div>
<div class="grey-header grey-panel"><?=$lang["inventory"];?></div>
<?php foreach($inventory as $inv){
 $item=Items::findfirst("id=$inv->itemid");   ?>
<div class="col-sm-2" style="border-radius:10px;border: 1px solid; margin:10px 10px 10px 0px;"><img title="<?php echo $item->name; ?>" src="<?php echo $this->url->get('') . $item->avatar; ?>"  width="35px" height="30px" /><span id="notifications_badge" class="badge bg-theme"><?php echo $inv->pcs; ?></span></div>
<?php }?>
</div>
</div>

<?php } ?>
   </div> 

 <div class="col-md-6">
 <div class="showback"> 
<div class="grey-header grey-panel"><?=$lang["military_details"];?></div>

<div class="col-md-9"><?=$lang["str"];?></div> <div class="col-md-1"><?php echo $str; ?></div><div class="col-md-1"></div><br />
<div class="col-md-9"><?=$lang["rank"];?></div> <div class="col-md-1"><?php echo $rank; ?></div><div class="col-md-1"></div><br />
<div class="col-md-9"><?=$lang["int"];?></div> <div class="col-md-1"><?php echo $int; ?></div><div class="col-md-1"></div><br />
</div>
   </div> 
   
<?php 
$reward=new Reward();
?>
<div class="col-md-12"> 
<div class="grey-header grey-panel"><?=$lang["medals"];?></div>
<div class="showback">

<?php
foreach($reward_user as $rewarduser){
$rewardx=$reward->findfirst("id=$rewarduser->rewardid");
$rewardy=$reward->getreward($rewarduser->userid,$rewarduser->rewardid);
?>
<script type="text/javascript">
$(function() {
  $('#medals<?=$rewardx->id;?>').balloon({contents: $('.medals-desc<?=$rewardx->id;?>').text() , position: "bottom" });
});
</script>

<img id="medals<?=$rewardx->id;?>" class="img-circle" title="<?php echo $rewardx->name; ?>" src="<?php echo $this->url->get('') . $rewardx->image; ?>" height="70px" width="70px" /><span id="notifications_badge" class="badge bg-theme"><?=$rewardy[0];?></span><div style="display: none;" class="medals-desc<?=$rewardx->id;?>"><?php echo $rewardx->desc; ?></div>
<?php } ?>



   </div> 
     </div>
   
   </div></div></div></div>