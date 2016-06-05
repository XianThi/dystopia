{{content()}}
<div class="showback">
<h2><?=$lang["settings"];?></h2><hr />
<ul class="nav nav-pills">
<li class="active"><a href="#avatar" data-toggle="tab"><?=$lang["avatar_upload"];?></a></li>
<li><a href="#cover" data-toggle="tab"><?=$lang["cover_upload"];?></a></li>
<li><a href="#bio" data-toggle="tab"><?=$lang["edit_bio"];?></a></li>
<li><a href="#password" data-toggle="tab"><?=$lang["change_password"];?></a></li>
<li><a href="#delete" data-toggle="tab"><?=$lang["delete_account"];?></a></li>
</ul>
<div class="tab-content"> 

<div class="tab-pane active" id="avatar">
<h4><?=$lang["upload_new_avatar"];?></h4>
<form action="{{url('citizen/upload')}}" method="post" enctype="multipart/form-data">
<label for="file"><?=$lang["select_file"];?></label> 
<input type="file" name="avatar" id="file" /> <br />
<button class="btn btn-success"><?=$lang["upload"];?></button>
</form>
</div>

<div class="tab-pane" id="cover" style="">
<h4><?=$lang["upload_new_cover"];?></h4>
<form action="{{url('citizen/upload')}}" method="post" enctype="multipart/form-data">
<label for="file2"><?=$lang["select_file"];?></label> 
<input type="file" name="cover" id="file2" /> <br />
<button class="btn btn-success"><?=$lang["upload"];?></button>
</form>
</div>

<div class="tab-pane" id="bio" style="">
<h4><?=$lang["write_bio"];?></h4>
<form action="{{url('citizen/editbio')}}" method="post" enctype="multipart/form-data">


<textarea id="bio" name="bio" style="height:100px;width:100%;"><?php if(isset($bio)){echo $bio;} ?></textarea>
<button class="btn btn-info"><?=$lang["ok"];?></button>

</form>
</div>

<div class="tab-pane" id="password" style="">
<h4><?=$lang["change_password"];?></h4>
<div class="form-panel">
<form action="{{url('citizen/password')}}" method="post" enctype="multipart/form-data">
<div class="form-group">
<label class="col-sm-2" for="old_password"><?=$lang["current_password"];?> </label>
<input type="password" name="old_password" id="old_password" />
<span class="help-block"><?=$lang["current_password_help"];?></span>
</div>
<div class="form-group">
<label class="col-sm-2" for="password"><?=$lang["password"];?> </label>
<input type="password" name="password" id="password" />
<span class="help-block"><?=$lang["password_help"];?></span>
</div>
<div class="form-group">
<label class="col-sm-2" for="repassword"><?=$lang["repassword"];?> </label>
<input type="password" name="repassword" id="repassword" /><br />
<span class="help-block"><?=$lang["repassword_help"];?></span>
</div>
<button class="btn btn-success"><?=$lang["submit"];?></button>
</form>
</div></div>

<div class="tab-pane" id="delete" style="">
<h4><?=$lang["delete_account"];?></h4>
<form action="{{url('citizen/disable')}}" method="post" enctype="multipart/form-data">
<div class="form-group">
<label for="password"><?=$lang["password"];?> : </label>
<input type="password" name="password" id="password" /><br />
<span class="help-block"><?=$lang["please_write_password"];?></span>
</div>
<button class="btn btn-success"><?=$lang["delete_account"];?></button>

</form>
</div>

</div>

    </div>
    
    </div>
    
    