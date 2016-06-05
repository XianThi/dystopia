<?php echo $this->getContent(); ?>

<div class="showback">
<h2><?=$lang["message"];?></h2><hr />
<?php use Phalcon\Tag as Tag ?>
<ul class="nav nav-pills" id="myTab">
      <li class="active"><a href="#inbox" data-toggle="tab"><i class="fa fa-envelope-o"></i><?php echo $lang['inbox']; ?></a></li>
      <li><a href="#sent" data-toggle="tab"><i class="fa fa-reply-all"></i><?php echo $lang['sent']; ?></a></li>
      <li style="float:right"><?php echo Tag::linkTo("messages/new", "<i class='fa fa-envelope'></i> ".$lang['new']."</a></li>") ?>
    </ul>
    <div class="tab-content"> 
      <div class="tab-pane active" id="inbox"><?php if(isset($no_message)){echo $message_text;}else{?>
      <form method="post" action="<?php echo $this->url->get('messages/delete'); ?>">
      <input type="hidden" name="message_type" id="message_type" value="inbox"/>
      <?php
  
        if(isset($page->items)){
            foreach($page->items as $message){ ?>
              
                        
            <div class="btn-toolbar well well-sm" role="toolbar"  style="margin:0px;">
              <div class="btn-group"><input id="checkbox[]" value="<?=$message->messageid;?>" name="checkbox[]" type="checkbox"></div>
              <div class="btn-group col-md-3"><a href="<?php echo $this->url->get('messages/read/'); ?><?=$message->messageid;?>"><?php if($message->readx==0){echo "<b>".$message->title."</b>";}else{echo $message->title;}?> </a></div>
              
              <div class="clearfix"><a href="<?php echo $this->url->get('homepage/profile/'); ?><?=$message->from_id;?>"> <?php $user=new Users(); $user=$user->findfirst("id=$message->from_id"); echo $user->username;?> </div> <?php if($message->readx==0){echo "</b>";}?></a>
            
              <div class="btn-group col-md-8"><b></b> <div class="pull-right"><i class="glyphicon glyphicon-time"></i><?=$message->timestamp;?> 
              <label class="btn btn-primary btn-xs" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-share-square-o"><?php echo $lang['reply']; ?></i></label> </div> </div></div>
              
        
       <?php }
        } ?>  
      
       
      
        <?php }?>
  <br /> <button class="btn btn-primary btn-xs"><i class="fa fa-check-square-o"></i><?php echo $lang['delete_selected_msg']; ?></button>
   </form> </div>
      
      <div class="tab-pane" id="sent"><?php if(isset($no_smessage)){echo $smessage_text;}else{?>
      <form method="post" action="<?php echo $this->url->get('messages/delete'); ?>">
      <input type="hidden" name="message_type" id="message_type" value="sent"/>
      <?php

        if(isset($spage->items)){
            foreach($spage->items as $smessage){ ?>
            <div class="btn-toolbar well well-sm" role="toolbar"  style="margin:0px;">
             <div class="btn-group"><input id="checkbox[]" value="<?=$smessage->messageid;?>" name="checkbox[]" type="checkbox"></div>
             <div class="btn-group col-md-3"><a href="<?php echo $this->url->get('messages/read/'); ?><?=$smessage->messageid;?>"> <?php echo $smessage->title;?> </a></div>
              
             <div class="clearfix"><a href="<?php echo $this->url->get('homepage/profile/'); ?><?=$smessage->to_id;?>"> <?php $user=new Users(); $user=$user->findfirst("id=$smessage->to_id"); echo $user->username;?> </div></a>
            
              <div class="btn-group col-md-8"><b></b> <div class="pull-right"><i class="glyphicon glyphicon-time"></i><?=$smessage->timestamp;?> <button class="btn btn-primary btn-xs" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-share-square-o"><?php echo $lang['reply']; ?></i></button>  </div> </div></div>
             
        
       <?php }
        } ?>   <br>
      
       
      
        <?php }?>
   <br />   <button class="btn btn-primary btn-xs"><i class="fa fa-check-square-o"></i><?php echo $lang['delete_selected_msg']; ?></button>
   </form> </div>

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"><br/><br/>
            <form action="<?php echo $this->url->get('messages/reply'); ?>" method="POST" class="form-horizontal">
            <fieldset>
      
            
            <!-- Textarea -->
            <div class="form-group">
              <label class="col-md-2 control-label" for="message">Message :</label>
              <div class="col-md-8">                     
                <textarea class="form-control" id="message" name="message"></textarea>
              </div>
            </div>
            
            <!-- Button -->
            <div class="form-group">
              <label class="col-md-2 control-label" for="send"></label>
              <div class="col-md-8">
                <button id="send" name="send" class="btn btn-primary">Send</button>
              </div>
            </div>
            
            </fieldset>
            </form>

    </div>
  </div></div></div></div>