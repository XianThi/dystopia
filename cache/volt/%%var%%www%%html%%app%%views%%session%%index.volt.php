<section class="wrapper">
    <div class="row mtbox">
    <?php echo $this->getContent(); ?>
        <div class="col-md-5">
           <div class="form-panel">
            <h4 class="mb"><i class="fa fa-angle-right"></i><?=$lang->_("login");?></h4>
            <?php echo $this->tag->form(array('session/start', 'class' => 'style-form')); ?>
                    <div class="form-group">
                        <label class="control-label" for="email"><?=$lang->_("username_email");?></label>
                        <div class="controls">
                         <?php echo $this->tag->textField(array('email', 'size' => '30', 'class' => 'input-xlarge', 'placeholder' => '')); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="password"><?=$lang->_("password");?></label>
                        <div class="controls">
                         <?php echo $this->tag->passwordField(array('password', 'size' => '30', 'class' => 'input-xlarge', 'placeholder' => '')); ?>
                        </div>
                    </div>
                   
                       <?php echo $this->tag->submitButton(array($lang['login_button'], 'class' => 'btn btn-theme btn-lg')); ?>
</div></div>
        <div class="col-md-5">
        <h3><i class="fa fa-angle-right"></i><?=$lang->_("register_title");?></h3>
           
            <p><?=$lang->_("register_text");?></p>
            <ul>
                <li><i class="fa fa-angle-right"> <?=$lang->_("register_text_2");?></i></li>
            </ul>

            
                <?php echo $this->tag->linkTo(array('session/register', $lang['register_button'], 'class' => 'btn btn-theme btn-lg')); ?>
       
        </div>

    </div>
</section>