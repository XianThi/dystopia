<?php echo $this->getContent(); ?>
<?php if(empty($country_post)){
$country_post=0;
         }
         if(empty($quality_post)){
        $quality_post=1;
         }
         ?>
<script type="text/javascript">
   $( document ).ready(function() {
        $("#country").change(function()
        {
            var value = $(this).val();
            var url   = '<?php echo  $this->url->get("company/getRegions");?>';
            $.ajax({
                type: 'POST',
                //dataType:'json',  //if i uncomment this didn't get reply
                url: url,
                data:{country_id:value},
            success: function (msg) {
            //Dönen sonucu ekranda gösterme
            $('#regions_div').html(msg);
          
        }
    });

});

$('#quality option').eq(<?=$quality_post;?>).prop('selected', true);
$('#country option').eq(<?=$country_post;?>).prop('selected', true);

});

</script>
<div class="showback"><h2><?=$lang["companies"];?></h2><hr />
<ul class="nav nav-pills">
<li class="active">
<a href="#companies" data-toggle="tab"><?=$lang["companies"];?></a>
</li><li></li>
<li>
<a href="#my_company" data-toggle="tab"><?=$lang["my_company"];?></a>
</li><li></li>
</ul>
<ul class="pager">
<form method="POST" action="<?php echo $this->url->get('company/index'); ?>">
<label class="control-label" for="country"><?=$lang->_("country");?> : </label>
         <?php  echo $this->tag->select(array("country",
                                    Zones::find("parent = 0"),
                                    "useEmpty"  =>  true,
                                    "emptyText" =>  "Please select",
                                    "using" => array("id", "name"),
                                    ));
            ?>
            <label class="control-label" for="regions"><?=$lang->_("regions");?> : </label>
            <span id="regions_div"><select><option><?=$lang["please_select_country"];?></option></select></span>
            <label class="control-label" for="quality"><?=$lang["quality"];?> : </label>
 <select onchange="this.form.submit()" name="quality">
<option value="1">1. <?=$lang["quality"];?></option>
<option value="2">2. <?=$lang["quality"];?></option>
<option value="3">3. <?=$lang["quality"];?></option>
<option value="4">4. <?=$lang["quality"];?></option>
<option value="5">5. <?=$lang["quality"];?></option>
 </select>        
         
    <li class="pull-right">
        <?php echo $this->tag->linkTo(array('company/new', $lang['create_company'], 'class' => 'btn btn-success')); ?>
    </li>
     </form>
</ul>

<div class="tab-content"> 
<div class="tab-pane active" id="companies">
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            
            <th><?=$lang["company_name"];?></th>
            <th><?=$lang["company_type"];?></th>
            <th><?=$lang["company_worker"];?></th>
            <th><?=$lang["location"];?></th>
            <th><?=$lang["company_quality"];?></a></a></th>
        </tr>
    </thead>
    <?php foreach($companies as $companyx){
        $company_types=new CompanyTypes();
        $zones=new Zones();
        $company_types=$company_types->findfirst("type=$companyx->type and id=$companyx->type2");
        $worktime=new Worktime();
        $region=$zones->findfirst("id=$companyx->zones");
        $country=$zones->findfirst("id=$region->parent");
        $worktime=$worktime->find("companyid=$companyx->id group by userid");
        $worker=count($worktime);
        
        ?>
        <tbody>
        <tr>
            
            <td><a href="<?php echo $this->url->get('company/view/' . $companyx->id); ?>"><img width="20px" height="20px" src="<?php echo $this->url->get($companyx->avatar); ?>" /><?php echo $companyx->name; ?></a></td>
            <td><?php echo $company_types->name; ?> <img src="<?php echo $this->url->get('') . $company_types->avatar; ?>" height="20px" width="20px" /></td>
            <td><?php echo $worker; ?></td>
            <td><?php echo $country->name; ?>/<?php echo $region->name; ?></td>
            <td><?php echo $companyx->quality; ?><?=$lang["quality_text"];?></td>
           
        </tr>
    </tbody>
    
    <?php }?>
    </table>
</div>


     <div class="tab-pane" id="my_company">     
      
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            
            <th><?=$lang["company_name"];?></th>
            <th><?=$lang["company_type"];?></th>
            <th><?=$lang["company_worker"];?></th>
            <th><?=$lang["location"];?></th>
            <th><?=$lang["company_quality"];?></a></a></th>
            <th>İşlemler</th>
        </tr>
    </thead>
    <?php 
    if(!empty($companyx)){
    foreach($my_companies as $company){
        $company_types=new CompanyTypes();
 $zones=new Zones();
        $company_types=$company_types->findfirst("type=$companyx->type and id=$companyx->type2");
        $worktime=new Worktime();
        $region=$zones->findfirst("id=$companyx->zones");
        $country=$zones->findfirst("id=$region->parent");
        $worktime=$worktime->find("companyid=$companyx->id");
        $worker=count($worktime);
        
        ?>
        <tbody>
        <tr>
            
            <td><a href="<?php echo $this->url->get('company/manage/' . $company->id); ?>"><img width="20px" height="20px" src="<?php echo $this->url->get($company->avatar); ?>" /><?php echo $company->name; ?></a></td>
            <td><?php echo $company_types->name; ?></td>
            <td><?php echo $worker; ?></td>
            <td><?php echo $country->name; ?>/<?php echo $region->name; ?></td>
            <td><?php echo $company->quality; ?><?=$lang["quality_text"];?></td>
            <td width="12%"><?php echo $this->tag->linkTo(array('company/edit/' . $company->id, '<i class="fa fa-pencil"></i> ' . $lang['edit'], 'class' => 'btn btn-primary btn-xs')); ?>
            <?php echo $this->tag->linkTo(array('company/sell/' . $company->id, '<i class="fa fa-trash-o "></i> ' . $lang['sell'], 'class' => 'btn btn-danger btn-xs')); ?></td>
           
        </tr>
    </tbody>
    
    <?php }}?>
    </table>
    </div>
    

     
     </div></div>