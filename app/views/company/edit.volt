{{content()}}
<div class="showback">
<ul class="nav nav-pills">
<li class="active"><a href="#edit" data-toggle="tab"><?=$lang["company_edit"];?></a></li>
<li><a href="#sell" data-toggle="tab"><?=$lang["company_sell"];?></a></li>
<li class="pull-right"><input type="button" class="btn btn-info btn-xs" value="<?=$lang["go_back"];?>" onclick="history.go(-1)" /></li>
</ul></div>
<div class="tab-content"> 
<div class="tab-pane active showback" id="edit" style="float: left;"><h2><?=$lang["company_edit"];?></h2><hr />
<h3><?=$lang["edit_info"];?></h3>
<form action="{{url('company/editinfo/')}}<?php if(isset($company_id)){echo $company_id;}?>" method="POST">
<label for="name"><?=$lang["company_name"];?> <?=$lang["change"];?> : </label> 
<input type="text" name="company_name" value="<?php if(isset($company_name)){echo $company_name;}?>" />
<input class="btn btn-success" type="submit" value="<?=$lang['change'];?>" />

</form>
<h3><?=$lang["change_avatar"];?></h3>
<form action="{{url('company/upload')}}" method="post" enctype="multipart/form-data">
<label for="file"><?=$lang["select_file"];?></label> 
<input type="file" name="avatar" id="file" /> <br />
<button class="btn btn-success"><?=$lang["upload_file"];?></button>
</form>
</div>

<div class="tab-pane showback" id="sell" style="float: left;"><h4 class="page-header"><?=$lang["company_sell"];?></h4>
<form action="{{url('company/sell')}}" method="post">
</form>
</div>

</div>