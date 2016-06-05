<section class="wrapper">
    <div class="row mtbox">
    {{ content() }}
        <div class="col-md-5">
           <div class="form-panel">
            <h4 class="mb"><i class="fa fa-angle-right"></i><?=$lang->_("login");?></h4>
            {{ form('session/start', 'class': 'style-form') }}
                    <div class="form-group">
                        <label class="control-label" for="email"><?=$lang->_("username_email");?></label>
                        <div class="controls">
                         {{    text_field('email', 'size': "30", 'class': "input-xlarge","placeholder": "") }}
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="password"><?=$lang->_("password");?></label>
                        <div class="controls">
                         {{    password_field('password', 'size': "30", 'class': "input-xlarge","placeholder": "") }}
                        </div>
                    </div>
                   
                       {{  submit_button(lang["login_button"], 'class': 'btn btn-theme btn-lg') }}
</div></div>
        <div class="col-md-5">
        <h3><i class="fa fa-angle-right"></i><?=$lang->_("register_title");?></h3>
           
            <p><?=$lang->_("register_text");?></p>
            <ul>
                <li><i class="fa fa-angle-right"> <?=$lang->_("register_text_2");?></i></li>
            </ul>

            
                {{ link_to('session/register', lang["register_button"], 'class': 'btn btn-theme btn-lg') }}
       
        </div>

    </div>
</section>