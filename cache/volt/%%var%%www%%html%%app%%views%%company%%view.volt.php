<?php echo $this->getContent(); ?>
<?php if(isset($company)){ ?>
<div class="col-md-2 well mt">
<div class="polaroid">
<p><?=$company->name;?></p>
<img width="150px" src="<?php echo $this->url->get('') . $company->avatar; ?>" /></div>
<?php if($owner=="yes"){?> 
<div style="border:1px solid #e3e3e3; padding:5% 0 5% 0;">
<a href="<?php echo $this->url->get('company/manage/') . $company->id; ?>" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-cog"></span> Manage</a>
<a href="<?php echo $this->url->get('company/edit/') . $company->id; ?>" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-list"></span> Edit</a>
</div>
<?php }else{ } ?>
<br />
<div class="grey-panel pn" style="height: 100%;"><div class="grey-header"><?=$lang["information"];?></a></div>

<label><?php echo $lang['company_quality']; ?> :</label> <?php echo $company->quality; ?><?=$lang["quality_text"];?><br />
<label><?php echo $lang['company_type']; ?> :</label> <?php echo $company_types->name; ?> <img src="<?php echo $this->url->get('') . $company_types->avatar; ?>" height="20px" width="20px" /><br />
<label><?php echo $lang['company_owner']; ?>: </label> <span><a href="<?php echo $this->url->get('homepage/profile/') . $users->id; ?>"><?php echo $users->username; ?></a></span><br />
<label><?php echo $lang['company_stock']; ?>: </label> <span><?=$stocks->total_stock-$stocks->selling;?></span><br />
<label><?php echo $lang['company_type']; ?>: </label> <span><?php if($company_types->type==1){echo $lang["raw"];} if($company_types->type==2){echo $lang["manu"];} ?></span><br />
</div>

</div>

<?php } ?>
<div class="col-md-10 mt">
<div class="row">
<div class="col-md-6">
<div class="well"></div>
</div>
<div class="col-md-4">
<div class="content-panel">
<h4><i class="fa fa-angle-right"></i><?=$lang["employes"];?></h4><hr />
  <table class="table table-hover">    <thead>
        <tr>
          <th>#</th>
          <th><?=$lang["username"];?></th>
          <th><?=$lang["production"];?></th>
          <th><?=$lang["salary"];?></th>
        </tr>
      </thead>
      <tbody>
       <?php $i=1; foreach($worktime as $result){
        $users=new Users();
        $users=$users->findfirst("id=".$result["userid"]);
        $productivity=new Productivity();
        $now=new \Phalcon\db\RawValue("DATE_FORMAT(NOW(),'%Y-%m-%d')");
        $productivity=$productivity->findfirst("userid=$users->id and companyid=$companyid and created_time=$now");
        if(!$productivity){$product="N/A";}else{$product=$productivity->product;}
        ?>
<tr>
<td><?=$i;?></td>
<td><?=$users->username; ?></td>
<td><?php echo $product; ?></td>
<td><i class="fa fa-money"><?=$result["salary"];?></i></td>

</tr>

<?php $i++;} ?>      </tbody>
    </table></table></div>
</div>
</div>

</div>

