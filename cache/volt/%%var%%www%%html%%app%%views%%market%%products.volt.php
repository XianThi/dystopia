<?php echo $this->getContent(); ?>
<h2><?=$lang["product_market"];?></h2> <hr />
<div id="buyalert"></div>
<div class="showback">
<form method="POST">
<div class="btn-group" data-toggle="buttons">
<?php $i=1; foreach($comptype as $cptp){ ?>
  <label class="btn btn-primary">
   <img src="<?php echo $this->url->get('') . $cptp->avatar; ?>" height="15px" width="15px" /> <input type="radio" name="type<?php echo $cptp->type; ?>" id="option<?php echo $i; ?>" value="<?php echo $cptp->id; ?>"/> <?php echo $cptp->name; ?>
  </label>
  
<?php $i++; } ?>
</div>
<label class="control-label" for="quality"><?=$lang["quality"];?> : </label>
<select name="quality">
<option value="1">Q1</option>
<option value="2">Q2</option>
<option value="3">Q3</option>
<option value="4">Q4</option>
<option value="5">Q5</option>
</select>
<input type="submit" class="btn btn-primary btn-xs" value="<?=$lang["submit"];?>" />
</form>
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            
            <th><?=$lang["seller"];?></th>
            <th><?=$lang["products_type"];?></th>
            <th><?=$lang["quality"];?></th>
            <th><?=$lang["pcs"];?></th>
            <th><?=$lang["price"];?></th>
            <th><?=$lang["buy"];?></th>
        </tr>
    </thead>
     <tbody>
    <?php foreach($selling as $sell){
       $company=Company::findfirst("id=$sell[companyid]");
       if($company){
       $company_type=CompanyTypes::findfirst("id=$company->type2");
       
        ?>
       
        <tr>
            <input type="hidden" id="sellingid" value="<?php echo $sell['id']; ?>" />
            <td><a href="<?php echo $this->url->get('company/view/' . $company->id); ?>"><img width="20px" height="20px" src="<?php echo $this->url->get($company->avatar); ?>" /><?php echo $company->name; ?></a></td>
            <td><img src="<?php echo $this->url->get('') . $company_type->avatar; ?>" height="20px" width="20px" /> <?php echo $company_type->name; ?></td>
            <td><?php echo $sell['quality']; ?></td>
            <td><?php echo $sell['pcs']; ?></td>
            <td><i class="fa fa-money"></i> <?php echo $sell['price']; ?></td>
            <td><input id="pcs<?php echo $sell['id']; ?>" type="text" name="pcs" /> 
            <input class="btn btn-success btn-xs" onclick="buymarket(<?php echo $sell['id']; ?>)" type="submit" value="<?=$lang["buy"];?>" /> </td>
        </tr>
   
    
    <?php }}?>
     </tbody>
    </table>
    </div>