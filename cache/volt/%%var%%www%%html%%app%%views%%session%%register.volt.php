  <?php echo $this->tag->javascriptInclude('js/jquery.min.js'); ?> 
  
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
<section class="wrapper">

<div class="row mt">
<?php echo $this->getContent(); ?>
<div class="col-lg-12">
<div class="form-panel">
    <h3><i class="fa fa-angle-right"><?=$lang->_("register_for");?> Dystopia</i></h3>
<?php echo $this->tag->form(array('session/register', 'id' => 'registerForm', 'class' => 'form-horizontal style-form', 'onbeforesubmit' => 'return false')); ?>
    <fieldset>
        <div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label" for="username"><?=$lang->_("username");?></label>
            <div class="col-sm-10">
                <?php echo $this->tag->textField(array('username', 'class' => 'form-control')); ?>
                <p class="help-block">(<?=$lang->_("required");?>)</p>
                <div class="alert alert-warning" id="username_alert">
                    <strong><?=$lang->_("error");?></strong> <?=$lang->_("username_alert");?>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label" for="email"><?=$lang->_("email");?></label>
            <div class="col-sm-10">
                 <?php echo $this->tag->textField(array('email', 'class' => 'form-control')); ?>
                <p class="help-block">(<?=$lang->_("required");?>)</p>
                <div class="alert alert-warning" id="email_alert">
                    <strong><?=$lang->_("error");?></strong> <?=$lang->_("email_alert");?>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label" for="password"><?=$lang->_("password");?></label>
            <div class="col-sm-10">
                <?php echo $this->tag->passwordField(array('password', 'class' => 'form-control')); ?>
                <p class="help-block">(<?=$lang->_("password_required");?>)</p>
                <div class="alert alert-warning" id="password_alert">
                    <strong><?=$lang->_("error");?></strong><?=$lang->_("password_alert");?>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label" for="repeatPassword"><?=$lang->_("repassword");?></label>
            <div class="col-sm-10">
                <?php echo $this->tag->passwordField(array('repeatPassword', 'class' => 'form-control')); ?>
                <div class="alert alert-warning" id="repeatPassword_alert">
                    <strong><?=$lang->_("error");?></strong> <?=$lang->_("password_match");?>
                </div>
            </div>
        </div>
                <div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label" for="name"><?=$lang->_("country");?></label>
            <div class="col-sm-10">
         <?php  echo $this->tag->select(array("country",
                                    Zones::find("parent = 0"),
                                    "useEmpty"  =>  true,
                                    "emptyText" =>  "Please select",
                                    "using" => array("id", "name"),
                                    ));
            ?>
                <p class="help-block">(<?=$lang->_("required");?>)</p>
                <div class="alert alert-warning" id="country_alert">
                    <strong><?=$lang->_("error");?></strong> <?=$lang->_("country_alert");?>
                </div>
            </div>
        </div>
                <div class="form-group">
            <label class="col-sm-2 col-sm-2 control-label" for="name"><?=$lang->_("regions");?></label>
            <div class="col-sm-10">
            <div id="regions_div"></div>
  
                <p class="help-block">(<?=$lang->_("required");?>)</p>
               <div class="alert alert-warning" id="regions_alert">
                    <strong><?=$lang->_("error");?></strong> <?=$lang->_("regions_alert");?>
                </div>
           
            </div>
        </div>
        <p><?=$lang->_("term_priv_text");?></p>
              <?php echo $this->tag->submitButton(array($lang['register_button'], 'class' => 'btn btn-theme', 'onclick' => 'return SignUp.validate();')); ?>
       
    </fieldset>
</form></div></div></div>
</section>