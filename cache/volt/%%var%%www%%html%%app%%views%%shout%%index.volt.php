<?php if($action=="global"){ ?>
<?php foreach($global_shouts as $globalsh){ ?>
<?php $users=new Users(); $users=$users->findfirst("id=$globalsh->userid"); ?> 
<div class="desc">
<div class="thumb"><img src="<?php echo $this->url->get('') . $users->avatar; ?>" height="40px" width="40px" /></div>
<div class="details">
<p><muted><?php echo $globalsh->created_time; ?></muted><br />
<a href="<?php echo $this->url->get('homepage/profile/') . $users->id; ?>" title="<?php echo $users->username; ?> profile" ><?php echo $users->username; ?></a> 
<?php echo strip_tags($globalsh->message); ?></p> </div>
</div> 
<?php }}?>

<?php if($action=="zone"){ ?>
 <?php foreach($zone_shouts as $zonesh){ ?>
<?php $users=new Users(); $users=$users->findfirst("id=$zonesh->userid"); ?> 
<div class="desc">
<div class="thumb"><img src="<?php echo $this->url->get('') . $users->avatar; ?>" height="40px" width="40px" /></div>
<div class="details">
<p><muted><?php echo $zonesh->created_time; ?></muted><br />
<a href="<?php echo $this->url->get('homepage/profile/') . $users->id; ?>" title="<?php echo $users->username; ?> profile" ><?php echo $users->username; ?></a> 
<?php echo strip_tags($zonesh->message); ?></p> </div>
</div> 
<?php }}?>

<?php if($action=="friends"){ ?>
 <?php foreach($friends as $friend){
$friendshouts=new Shouts();
$friendshouts=$friendshouts->find("userid=$friend->friendid and type=1 order by created_time desc LIMIT 5");
    foreach($friendshouts as $friendshout){
    ?>
<?php $users=new Users(); $users=$users->findfirst("id=$friendshout->userid"); ?> 
<div class="desc">
<div class="thumb"><img src="<?php echo $this->url->get('') . $users->avatar; ?>" height="40px" width="40px" /></div>
<div class="details">
<p><muted><?php echo $friendshout->created_time; ?></muted><br />
<a href="<?php echo $this->url->get('homepage/profile/') . $users->id; ?>" title="<?php echo $users->username; ?> profile" ><?php echo $users->username; ?></a> 
<?php echo strip_tags($friendshout->message); ?></p> </div>
</div> 
<?php }}}?>