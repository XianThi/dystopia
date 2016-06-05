{{content()}}
<script>
$( document ).ready(function() {
        $("#buycomp").click(function()
        {
            var pcs = $("#pcs").val();
            var sellingid=$("#sellingid").val();
            var sellpcs=$("#sellpcs").val();
            var dataString = 'pcs='+ pcs + '&sellid='+ sellingid;
            var url   = '<?php echo  $this->url->get("market/buycomp");?>';
            if(pcs=='')
{
alert("adet boþ olamaz.");
}
else
{
  
            $.ajax({
                type: 'POST',
                //dataType:'json',  //if i uncomment this didn't get reply
                url: url,
                data:dataString,
            success: function (msg) {
            //Dönen sonucu ekranda gösterme
            $('#buyalert').html(msg);
          
        }
    });
    }

});
});
</script>
<h2><?=$lang["selling_companies"];?></h2> <hr />
<div id="buyalert"></div>
<div class="showback">
<form method="POST">
<div class="btn-group" data-toggle="buttons">
<?php $i=1; foreach($comptype as $cptp){ ?>
  <label class="btn btn-primary">
   <img src="{{url('')~cptp.avatar}}" height="15px" width="15px" /> <input type="radio" name="type{{cptp.type}}" id="option{{i}}" value="{{cptp.id}}"/> {{cptp.name}}
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
            <th><?=$lang["price"];?></th>
            <th><?=$lang["buy"];?></th>
        </tr>
    </thead>
    <?php foreach($selling as $sell){
       $company=Company::findfirst("id=$sell[companyid]");
       if($company){
       $company_type=CompanyTypes::findfirst("id=$company->type2");
       
        ?>
        <tbody>
        <tr>
            <input type="hidden" id="sellingid" value="{{sell["id"]}}" />
            <td><a href="{{url('company/view/'~company.id)}}"><img width="20px" height="20px" src="{{url(company.avatar)}}" />{{ company.name }}</a></td>
            <td><img src="{{url('')~company_type.avatar}}" height="20px" width="20px" /> {{company_type.name}}</td>
            <td>{{sell["quality"]}}</td>
            <td><img src="{{url('img/gold.png')}}" height="14px" width="14px"> {{sell["price"]}}</td>
            <td><input class="btn btn-success btn-xs" id="buycomp" type="submit" value="<?=$lang["buy"];?>" /> </td>
        </tr>
    </tbody>
    
    <?php }}?>
    </table>
    </div>