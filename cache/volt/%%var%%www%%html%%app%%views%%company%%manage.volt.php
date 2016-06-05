<?php echo $this->getContent(); ?>
<?php  $productivity=new Productivity();
$products=$productivity->products($companyid);
 ?>
<script type="text/javascript">
 $(document).ready(function() {

    $("#addmoney").submit(function() { // intercepts the submit event
      $.ajax({ // make an AJAX request
        type: "POST",
        url: "<?=$this->url->get('company/addmoney/'.$companyid);?>", // it's the URL of your component B
        data: $("#addmoney").serialize(), // serializes the form's elements
        success: function(data)
        {
          // show the data you got from B in result div
          $("#alerts").html(data);
        }
      });
      e.preventDefault(); // avoid to execute the actual submit of the form
    });
  $("#addraw").submit(function() { // intercepts the submit event
      $.ajax({ // make an AJAX request
        type: "POST",
        url: "<?=$this->url->get('company/addraw/'.$companyid);?>", // it's the URL of your component B
        data: $("#addraw").serialize(), // serializes the form's elements
        success: function(data)
        {
          // show the data you got from B in result div
          $("#alerts").html(data);
        }
      });
      e.preventDefault(); // avoid to execute the actual submit of the form
    });
  });
function isteklif(){
     document.getElementById('isteklif').style.display = 'block';
}
function deleteworkoffer(jobid){
                $.ajax({
                type: 'POST',
                //dataType:'json',  //if i uncomment this didn't get reply
                url: '<?=$this->url->get("company/deleteoffers");?>',
                data:'jobid='+jobid+'&sellid=0',
            success: function (msg) {
          $('#alerts').html('<div class="alert alert-info">'+msg+'</div>');
        }
    });
}

function deleteselloffer(sellid){
                $.ajax({
                type: 'POST',
                //dataType:'json',  //if i uncomment this didn't get reply
                url: '<?=$this->url->get("company/deleteoffers");?>',
                data:'jobid=0'+'&sellid='+sellid,
            success: function (msg) {
          $('#alerts').html('<div class="alert alert-info">'+msg+'</div>');
        }
    });
}

function urunteklif(){
     document.getElementById('urunteklif').style.display = 'block';
}
function editjob(i){
$('#editjobs'+i).show();
$('#jobs'+i).hide();
}
//Morris charts snippet - js
 $(function() {
  Morris.Line({
        element: 'line-example',
        data: [
 <?php foreach($products as $productsx){
    
    $newDate = date("Y-m-d", strtotime($productsx["created_time"]));
    ?> 
{days:'<?=$newDate;?>',products: <?=$productsx["products"];?>},
 <?php } ?>       
 ],
                xkey: 'days',
                ykeys: ['products'],
                labels: ['Total Products'],
                hideHover: 'auto'
      });
 var ctx = document.getElementById("myChart").getContext("2d");
 var options = {

  //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
    scaleBeginAtZero : true,

    //Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines : true,

    //String - Colour of the grid lines
    scaleGridLineColor : "rgba(0,0,0,.05)",

    //Number - Width of the grid lines
    scaleGridLineWidth : 1,

    //Boolean - If there is a stroke on each bar
    barShowStroke : true,

    //Number - Pixel width of the bar stroke
    barStrokeWidth : 2,

    //Number - Spacing between each of the X value sets
    barValueSpacing : 10,

    //Number - Spacing between data sets within X values
    barDatasetSpacing : 1
};
var data = {
    datasets: [
        {
            fillColor: "rgba(220,220,220,0.5)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(220,220,220,0.75)",
            highlightStroke: "rgba(220,220,220,1)",
            data: [<?php foreach($employes as $result){
        $productivity=new Productivity();
        $worktime=new Worktime();
        $users=new Users();
        $users=$users->findfirst("id=".$result["userid"]);
        $now=new \Phalcon\db\RawValue("DATE_FORMAT(NOW(),'%Y-%m-%d')");
        $now=date('Y-m-d');
        $productivity=$productivity->products_user($companyid,$now,$users->id);
        if(!$productivity){$product=0;}else{$product=$productivity["products"];}
        $usernames[]=array("username"=>"$users->username"); 
        if(empty($product)){$product=0;}
        echo $product.",";
        }
        ?>]
        },
        
],
labels: [<?php foreach($usernames as $usernameb){ echo "\"".$usernameb["username"]."\",";} ?>]
};
 var myLineChart = new Chart(ctx).Bar(data,options);
 

});
</script>
<style>
.morris-hover{position:absolute;z-index:1000}.morris-hover.morris-default-style{border-radius:10px;padding:6px;color:#666;background:rgba(255,255,255,0.8);border:solid 2px rgba(230,230,230,0.8);font-family:sans-serif;font-size:12px;text-align:center}.morris-hover.morris-default-style .morris-hover-row-label{font-weight:bold;margin:0.25em 0}
.morris-hover.morris-default-style .morris-hover-point{white-space:nowrap;margin:0.1em 0}

</style>
<h2><?=$lang["manage"];?></h2><hr />
<div id="alerts"></div>
<div class="col-lg-3">
<div class="col-md-12">
<div class="showback">
<h4> <img height="20px" width="20px" src="<?php echo $this->url->get() . $companytype; ?>" /> <a href="<?php echo $this->url->get('company/view/') . $company->id; ?>"><?=$company->name;?></a></h4><hr />
<label><?php echo $lang['company_money']; ?>: </label> <span><i class="fa fa-money"></i> <?=$company->money;?></span><br />
<?php $items=Items::findfirst("quality=$company->quality and type=$company->type2"); ?>
<?php if($company->type==2){ $ct=CompanyTypes::findfirst("id=$company->type2"); $ctx=CompanyTypes::findfirst("id=$ct->req"); ?>
<label><?php echo $lang['company_raw']; ?>: </label> <span><img src="<?php echo $this->url->get('') . $ctx->avatar; ?>" height="15px" width="15px" /> <?=$company->raw;?></span><br /> <?php } ?>
<label><?php echo $lang['company_stock']; ?>: </label> <span><img src="<?php echo $this->url->get('') . $items->avatar; ?>" height="15px" width="15px" /> <?=$stocks->total_stock-$stocks->selling;?></span><br />
<input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#add" value="<?=$lang["add"];?>" />
</div>
</div>
</div>
<div class="col-lg-5">
<div class="col-md-12">
<div class="showback">
<h4>İş Teklifleri</h4> <hr />
<div id="isteklif" style="display: none;">
<form id="create_worktime" method="POST">
<label class="control-label" for="start_time">Başlangıç Zamanı : </label>
<select name="start_time" style="width: 20%;">
<?php for($i = 0; $i < 24; $i++){ 
    if($i<10){
        $i="0".$i;
    }?>
<option value="<?=$i.':00'?>"><?=$i.':00'?></option>
<?php }?>
</select>
<label class="control-label" for="end_time">Bitiş Zamanı : </label>
<select name="end_time"  style="width: 20%;">
<?php for($i = 0; $i < 24; $i++){ 
    if($i<10){
        $i="0".$i;
    }?>
<option value="<?=$i.':00'?>"><?=$i.':00'?></option>
<?php }?>
</select><br />
<label class="control-label" for="salary" >Ücret(<?php echo $lang['hourly']; ?>) : </label>
<input type="text"  style="width: 10%;" name="salary" onkeyup="this.value=this.value.replace(/[^0-9.]/g, '')"/>
<label class="control-label" for="person" >Kişi: </label>
<input type="text"  style="width: 10%;" name="person" onkeyup="this.value=this.value.replace(/[^\d]/,'')"/>
<input type="hidden" name="teklif" value="isteklif" />
<input type="submit" style="width: 10%;" class="btn btn-sm btn-success" />
</form>
</div>
<div class="right"><button class="btn btn-sm btn-info" onclick="isteklif()">Teklif Koy</button></div>
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["start_time"];?></th>
            <th><?=$lang["end_time"];?></th>
            <th><?=$lang["salary"];?></th>
            <th><?=$lang["person"];?></th>
            <th><?=$lang["proccess"];?></th>
        </tr>
    </thead>
    <tbody>
    <?php $i=1; foreach($joboffers as $jobs){ ?>
    <tr style="display: none;" id="editjobs<?php echo $i; ?>">
    <td><?php echo $i; ?></td>
    <td><input data-mask="99:00:00"  style="width:100%;" type="text" name="start_time" value="<?php echo $jobs->start_time; ?>" /></td>
    <td><input data-mask="99:00:00" style="width:100%;" type="text" name="end_time" value="<?php echo $jobs->end_time; ?>" /></td>
    <td><i class="fa fa-money"></i><input style="width:50%;" onkeyup="this.value=this.value.replace(/[^0-9.]/g, '')" type="text" name="fee" value="<?php echo $jobs->fee; ?>" /></td>
    <td><input style="width:100%;" type="text" onkeyup="this.value=this.value.replace(/[^\d]/,'')" name="person" value="<?php echo $jobs->person; ?>" /></td>
    <td>ok</td>
    </tr>
    <tr id="jobs<?php echo $i; ?>">
    <td><?php echo $i; ?></td>
    <td><?php echo $jobs->start_time; ?></td>
    <td><?php echo $jobs->end_time; ?></td>
    <td><i class="fa fa-money"></i><?php echo $jobs->fee; ?></td>
    <td><?php echo $jobs->person; ?></td>
    <td><button onclick="editjob(<?php echo $i; ?>);" class="btn btn-success btn-xs"><i class="icon-pencil"></i> <?=$lang["edit"];?></button>
    <button onclick="deleteworkoffer(<?php echo $jobs->id; ?>);" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i> <?=$lang["delete"];?></button></td>        
    </tr>
    <?php $i++; }?>
    </tbody>
    </table>
</div>
</div>

<div class="col-md-12">
<div class="showback">
<h4>Ürün Teklifleri</h4> <hr />
<div id="urunteklif" style="display: none;">
<form id="create_sale" method="POST">
<label class="control-label" for="pcs" >Adet : </label>
<input type="text"  style="width: 10%;" name="pcs" onkeyup="this.value=this.value.replace(/[^\d]/,'')"/>
<label class="control-label" for="price" >Fiyat: </label>
<input type="text"  style="width: 10%;" name="price" onkeyup="this.value=this.value.replace(/[^0-9.]/g, '')"/>
<input type="hidden" name="teklif" value="urunteklif" />
<input type="submit" style="width: 10%;" class="btn btn-sm btn-success" />
</form>
</div>
<div class="right"><button class="btn btn-sm btn-info" onclick="urunteklif()">Teklif Koy</button></div>
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["pcs"];?></th>
            <th><?=$lang["price"];?></th>
            <th><?=$lang["proccess"];?></th>
        </tr>
    </thead>
    <tbody>
    <?php $i=1; foreach($sellingx as $sell){ ?>
    <tr>
    <td><?php echo $i; ?></td>
    <td><img height="20px" width="20px" src="<?php echo $this->url->get() . $companytype; ?>" /> <?php echo $sell->pcs; ?></td>
    <td><i class="fa fa-money"> <?php echo $sell->price; ?></i></td>
    <td><button onclick="" class="btn btn-success btn-xs"><i class="icon-pencil"></i> <?=$lang["edit"];?></button>
    <button onclick="deleteselloffer(<?php echo $sell->id; ?>);" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i> <?=$lang["delete"];?></button></td>
    </tr>
    <?php $i++; }?>
    </tbody>
    </table>
</div>
</div>
</div>

<div class="col-lg-4">
<div class="col-md-12">
<div class="showback">
<h4>Şirket Verileri</h4> <hr />
Üretim Eğrisi<div id="line-example" style="height: 300px;"></div>
</div>
</div>
<div class="col-md-12">
<div class="showback">
<h4><?=$lang["employes"];?></h4><hr />
<canvas id="myChart" height="400"></canvas>
  <table class="table table-hover">    <thead>
        <tr>
          <th>#</th>
          <th><?=$lang["username"];?></th>
          <th><?=$lang["production"]." ($lang[now])";?></th>
          <th><?=$lang["salary"]." ($lang[hourly])";?></th>
        </tr>
      </thead>
      <tbody>
       <?php $i=1; foreach($employes as $result){
        $productivity=new Productivity();
        $worktime=new Worktime();
        $users=new Users();
        $users=$users->findfirst("id=".$result["userid"]);
        $now=new \Phalcon\db\RawValue("DATE_FORMAT(NOW(),'%Y-%m-%d')");
        $now=date('Y-m-d');
        $productivity=$productivity->products_user($companyid,$now,$users->id);
        if(!$productivity){$product="N/A";}else{$product=$productivity["products"];}
        $salary=$worktime->get_salary($companyid,$users->id);
        if(empty($product)){$product=0;}
        ?>
<tr>
<td><?=$i;?></td>
<td><?=$users->username; ?></td>
<td><?php echo $product; ?></td>
<td><i class="fa fa-money"><?=$salary["salary"];?></i></td>

</tr>

<?php $i++;} ?>      </tbody>
    </table></table></div>
</div>
</div>
<div id="add" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title"><?=$lang["company_req_add"];?></h4>
      </div>
      <div class="modal-body">
<ul class="nav nav-pills">
<li class="active">
<a href="#money" data-toggle="tab"><?=$lang["add_money"];?></a>
</li><li></li>
<li>
<a href="#raw" data-toggle="tab"><?=$lang["add_raw"];?></a>
</li><li></li>
</ul><hr />

<div class="tab-content">

<div class="tab-pane active" id="money">
<div class="showback">
<h4><?=$lang["add_by_inv"];?></h4>
<form id="addmoney">
<div class="control-group">
<label class="control-label">Amount : </label>
<input name="money" type="text" onkeyup="this.value=this.value.replace(/[^0-9.]/g, '')" /> (Max: <i class="fa fa-money"></i> <?php echo $currency; ?> )
<button type="submit" class="btn btn-primary"><?=$lang["add"];?></button>
</div>
</form>
</div>
</div>
<?php if($company->type==2){ ?>
<div class="tab-pane" id="raw">
<div class="showback">
<h4><?=$lang["add_by_inv"];?></h4>
<form id="addraw">
<div class="control-group">
<label class="control-label">Amount : </label>
<?php $auth = $this->session->get('auth');
        $userid=$auth["id"];  $inventory=Inventory::findfirst("userid=$userid and itemid=$ct->req");
        if(!$inventory){
            $rawpcs=0;
        }else{$rawpcs=$inventory->pcs;}
         ?>
<input name="raw" type="text" onkeyup="this.value=this.value.replace(/[^0-9.]/g, '')" /> (Max: <img src="<?php echo $this->url->get('') . $ctx->avatar; ?>" height="15px" width="15px" /> <?php echo $rawpcs; ?>  )
<button type="button" class="btn btn-primary"><?=$lang["add"];?></button>
</div>
</form>
</div>
<div class="showback">
<h4><?=$lang["add_by_market"];?></h4>

<table class="table table-striped table-advance table-hover">
    <thead>
        <tr>
            
            <th><?=$lang["seller"];?></th>
            <th><?=$lang["products_type"];?></th>
            <th><?=$lang["quality"];?></th>
            <th><?=$lang["pcs"];?></th>
            <th><?=$lang["price"];?></th>
            <th><?=$lang["buy"];?></th>
            <th><?=$lang["proccess"];?></th>
        </tr>
    </thead>
    <tbody>
<?php 
$getsell=$selling->getselling("and type=".$ct->req,$company->zones,"and quality=1");
foreach($getsell as $gtsl){
    $companysl=Company::findfirst("id=$gtsl[companyid]");
       if($companysl){
       $company_typesl=CompanyTypes::findfirst("id=$companysl->type2");
       ?>

        
        <tr>
            <td><a href="<?php echo $this->url->get('company/view/' . $companysl->id); ?>"><img width="20px" height="20px" src="<?php echo $this->url->get($companysl->avatar); ?>" /><?php echo $companysl->name; ?></a></td>
            <td><img src="<?php echo $this->url->get('') . $company_typesl->avatar; ?>" height="20px" width="20px" /> <?php echo $company_typesl->name; ?></td>
            <td><?php echo $gtsl['quality']; ?></td>
            <td><?php echo $gtsl['pcs']; ?></td>
            <td><i class="fa fa-money"></i> <?php echo $gtsl['price']; ?></td>
            <td class="col-md-3"><input id="pcs" class="col-sm-12" type="text" name="pcs" /> </td>
            <td><button class="btn btn-success btn-xs" onclick="buyitem(<?=$gtsl["id"];?>,<?php echo $companyid; ?>);"> <?=$lang["buy"];?></button></td>
        </tr>
   
    <?php }}?>
     </tbody>
    </table>
    
</div>
</div>

<?php } ?>
</div>
</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?=$lang["cancel"];?></button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    