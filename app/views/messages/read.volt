</div></div><div class="container">{{content()}}
<?php use Phalcon\Tag as Tag;
global $to_id; ?>
<ul class="nav nav-tabs" id="myTab">
      <li><a href="{{url('homepage/messages#inbox')}}" ><i class="fa fa-envelope-o"></i>{{lang["inbox"]}}</a></li>
      <li><a href="{{url('homepage/messages#sent')}}"><i class="fa fa-reply-all"></i> {{lang["sent"]}}</a></li>
      <li  class="active" style="float:right"><?php echo Tag::linkTo("messages/new", "<i class='fa fa-envelope'></i> ".$lang['new']."</a></li>") ?>
    </ul>
    <div class="tab-content">
<div class="btn-toolbar well well-sm" role="toolbar"  style="margin:0px;">
 <div class="btn-group col-md-3"><?=$title;?></div></div>
 <br />
 <?php $auth = $this->session->get('auth');
     $userid=$auth["id"];
      $user=new Users();
$messages= new Messages();
 foreach($pm1 as $pm1_system){

     if($userid==$pm1_system->to_id){
        $messages->read_message($pm1_system->messageid,$userid);
 $usery=$user->findfirst("id=$pm1_system->from_id");?> 
 <div class="clearfix" style="float: left; clear:both;">
 <br /><img width="60px" height="60px" src="/dystopia/<?=$usery->avatar;?>"/> <?=$pm1_system->message; ?><br />
 <a href="/dystopia/homepage/profile/<?php $to_id=$usery->id; echo $usery->id;?>"><?=$usery->username; ?></a>
 <div style="float: right;"> <?=$pm1_system->timestamp;?></div>
</div>
    
<?php }else{  $userx=$user->findfirst("id=$pm1_system->from_id");?> 
 <div class="clearfix" style="float: right; clear:both;">
 <br /><img height="60px" width="60px" src="/dystopia/<?=$userx->avatar;?>"/> <p><a href="/dystopia/homepage/profile/<?=$userx->id;?>"><?=$userx->username; ?></a></p>
<?=$pm1_system->message; ?><br />

  <div style="float: right;"> <?=$pm1_system->timestamp;?></div>
</div>
             <?php }}?> 
             </div>
<div class="well well-sm" role="toolbar"  style="margin:10px;">
<form method="post">
Cevap : 
<br />
<input type="hidden" name="to_id" id="to_id" value="<?=$to_id;?>" />
<textarea name="message" id="message" style="height:150px;width:800px;"></textarea>
<button>Send</button>
</form>
</div>
    </div>
   