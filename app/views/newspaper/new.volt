<script type="text/javascript">
   $( document ).ready(function() {
        $("#country").change(function()
        {
            var value = $(this).val();
            var url   = '<?php echo  $this->url->get("session/getRegions");?>';
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

});

</script>
{{content()}}
<?php if(isset($newspaper_price)){
  ?>
This newspaper is {{newspaper_price}} gold. Are you okey ?
<form method="POST">
<input type="hidden" name="ok" value="ok" />
<input type="hidden" name="name" value="<?=$_POST["name"];?>" />
<input type="hidden" name="country" value="<?=$_POST["country"];?>"/>
<input type="hidden" name="regions" value="<?=$_POST["regions"];?>" />
<input type="submit" value="Lets !" />
</form>
  <?php  
}?>
<form id="newspaperform" name="newspaperform" method="post" action="{{url('newspaper/new')}}" onbeforesubmit="return false">

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("newspaper", "&larr; "~lang["back"]) }}
    </li>
    <li class="pull-right">
        {{ submit_button(lang["save"], "class": "btn btn-success","onclick": "return Company.validate();") }}
    </li>
</ul>

<div class="center scaffold">
    <h2><?=$lang["create_newspaper"];?></h2>

    <div class="clearfix">
        <label for="name"><?=$lang["newspaper_name"];?> : </label>
        {{ form.render("name") }}
    </div>


<div class="control-group">
            <div class="controls">
            <label class="control-label" for="country"><?=$lang->_("country");?> : </label>
         <?php  echo $this->tag->select(array("country",
                                    Country::find("id = id"),
                                    "useEmpty"  =>  true,
                                    "emptyText" =>  "Please select",
                                    "using" => array("id", "name"),
                                    ));
            ?>
                <p class="help-block">(<?=$lang->_("required");?>)</p>
                <div class="alert" id="country_alert">
                    <strong><?=$lang->_("error");?></strong> <?=$lang->_("country_alert");?>
                </div>
            </div>
        </div>
                <div class="control-group">
            <div class="controls">
            <label class="control-label" for="regions"><?=$lang->_("regions");?> : </label>
            <span id="regions_div"></span>
  
                <p class="help-block">(<?=$lang->_("required");?>)</p>
               <div class="alert" id="regions_alert">
                    <strong><?=$lang->_("error");?></strong> <?=$lang->_("regions_alert");?>
                </div>
           
            </div>

</div>
</form>
</div>