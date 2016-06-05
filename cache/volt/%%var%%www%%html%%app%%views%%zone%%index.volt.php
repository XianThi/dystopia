<script type="text/javascript">
/* ensure any open panels are closed before showing selected */
$('#accordion').on('show.bs.collapse', function () {
    $('#accordion .in').collapse('hide');
});

</script>
<h2><?=$lang["capitals"];?></h2><hr />
<div class="panel-group" id="accordion">   
        <?=$lang["click_for_see_zones"];?>
<?php foreach($zones as $zone){ 
$zonesdb=new Zones(); 
$zonesdb=$zonesdb->find("parent=$zone->id");   
    ?>
<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel<?php echo $zone->id; ?>"><img height="40px" width="40px" src="<?php echo $this->url->get('') . $zone->flag; ?>" /> <?php echo $zone->name; ?>  </a>
			</h4>
		</div>
		<div id="panel<?php echo $zone->id; ?>" class="panel-collapse collapse">
			<div class="panel-body">
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["zone_name"];?></th>
            <th><?=$lang["total_player"];?></th>
            <th><?=$lang["total_power"];?></a></a></th>
            <th><?=$lang["ideology"];?></th>
            <th><?=$lang["central_coordinates"];?></th>
            <th><?=$lang["govner"];?></th>
        </tr>
    </thead>
<?php 
$i=1; foreach($zonesdb as $zonedb){
    $managers=new Managers();
    $auth = $this->session->get('auth');
    $userid=$auth["id"];
    $managers=$managers->findfirst("zoneid=$zonedb->id");
    $manager=$managers->userid;
    $users=new Users();
    $total_users=$users->total_user($zonedb->id);
    $government=new Government();
    $gov=new Gov();
    $govid=$gov->get_govid($zonedb->id);
    $government=$government->findfirst("id=$govid[1]");
    ?>
    <tbody>
     <tr>
            <td><?=$i;?></td>
            <td><a href="<?php echo $this->url->get('zone/view/') . $zonedb->id; ?>"><img src="<?php echo $this->url->get('') . $zonedb->flag; ?>" height="25px" width="25px" /> <?php echo $zonedb->name; ?></a></td>
            <td><a href="<?php echo $this->url->get('userlist/zone/') . $zonedb->id; ?>"><?=$total_users[0]." ".$lang["player"];?></a></td>
            <td></td>
            <td><a href="<?php echo $this->url->get('ideology/view/') . $government->id; ?>"><?=$government->name;?></a></td>
            <td>(<?php echo $zonedb->lat; ?>,<?php echo $zonedb->long; ?>)</td>
            <td><?php if(!empty($manager)){
    $manager_info=$users->findfirst("id=$manager");?> 
    <a href="<?php echo $this->url->get('homepage/profile/') . $manager_info->id; ?>" title="<?php echo $manager_info->username; ?>"><img class="img-circle" src="<?php echo $this->url->get('') . $manager_info->avatar; ?>" height="20" width="20" /><?php echo $manager_info->username; ?></a>
    <?php if($userid==$manager){?>
   -  <a href="<?php echo $this->url->get('zone/admin/') . $zonedb->id; ?>"><i class="fa fa-sitemap"><?=$lang["manage"];?></i></a>
    <?php }
    }else{echo "N/A";} ?></td>
        </tr>
        <?php $i++;} ?>
    </tbody>
    </table>
   			</div>
		</div>
        </div> 
   <?php }?>
   
 </div>