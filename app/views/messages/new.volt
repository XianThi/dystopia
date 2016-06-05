{{ content() }}
<?php use Phalcon\Tag as Tag ?>
<br /><br /><br />
<ul class="nav nav-tabs" id="myTab">
      <li><a href="{{url('homepage/messages#inbox')}}" ><i class="fa fa-envelope-o"></i>{{lang["inbox"]}}</a></li>
      <li><a href="{{url('homepage/messages#sent')}}"><i class="fa fa-reply-all"></i>{{ lang["sent"]}}</a></li>
      <li  class="active" style="float:right"><?php echo Tag::linkTo("messages/new", "<i class='fa fa-envelope'></i> ".$lang['new']."</a></li>") ?>
    </ul>
    <div class="tab-content">
 <form method="post">
   <div class="clearfix"> 
      <div class="clearfix"> 
   <label for="name">{{lang["title"]}} :</label>
   <?php echo $form->render("title") ?></div>
<div class="clearfix">
    <label for="message">{{lang["message_box"]}} :</label>
    <?php echo $form->render("message") ?></div>
    <div class="clearfix">
      <input type="submit" value="{{lang['send']}}" /></div>
   </form>
    </div>
    
    
    </div></div>