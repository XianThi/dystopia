{{content()}}
<div class="showback">
<h2 ><?=$lang["job_offers"];?></h2><hr />
<div class="center">
<form id="create_worktime" method="POST">
<label class="control-label" for="start_time">Başlangıç Zamanı : </label>
<select onchange="this.form.submit()" name="start_time" style="width: 10%;">
<option value=""><?=$lang["please_select"];?></option>
<?php for($i = 0; $i < 24; $i++){ 
    if($i<10){
        $i="0".$i;
    }?>
<option value="<?=$i.':00'?>"><?=$i.':00'?></option>
<?php }?>
</select>
<label class="control-label" for="end_time">Bitiş Zamanı : </label>
<select onchange="this.form.submit()" name="end_time"  style="width: 10%;">
<option value=""><?=$lang["please_select"];?></option>
<?php for($i = 0; $i < 24; $i++){ 
    if($i<10){
        $i="0".$i;
    }?>
<option value="<?=$i.':00'?>"><?=$i.':00'?></option>
<?php }?>
</select>
</form>
</div><hr />
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            
            <th><?=$lang["job_company"];?></th>
            <th><?=$lang["job_start_time"];?></th>
            <th><?=$lang["job_end_time"];?></th>
            <th><?=$lang["job_fee"];?></th>
            <th><?=$lang["job_type"];?></a></a></th>
            <th><?=$lang["proccess"];?></th>
        </tr>
    </thead>
    <?php
    foreach($joboffers as $jobs){
    $company=new Company();
    if(isset($jobs["owner"])){
    $company=$company->findfirst("id=".$jobs["owner"])
    
        ?>
        <tbody>
        <tr>
            
            <td><a href="{{url('company/view/'~company.id)}}"><img width="20px" height="20px" src="{{url(company.avatar)}}" />{{ company.name }}</a></td>
            <td>{{jobs["start_time"]}}</td>
            <td>{{jobs["end_time"]}}</td>
            <td><i class="fa fa-money">{{jobs["fee"]}}</i></td>
            <td><?php if($jobs["job_type"]==1){echo $lang["raw"];} 
            if($jobs["job_type"]==2){echo $lang["manu"];} ?></td>
            <td><a class="btn btn-default" href="{{url('company/applyjob/'~jobs['id'])}}"><i class="icon-polaroid">Gir</i></a></td>
                 
        </tr>
    </tbody>
    
    <?php }} ?>
    </table></div>