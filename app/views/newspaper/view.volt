{{content()}}
<div class="alert alert-block alert-info">
<div style="float: right;"><a href="{{url('newspaper/subs/')}}<?=$newspaper->id;?>" ><img src="{{url('img/subs.png')}}" height="40px" width="120px" /></a><strong> (<?=$subs[0];?>)</strong></div>
 <h2>  <img src="{{url('')}}<?=$newspaper->avatar;?>" height="100px" width="100px" /> <a href="{{url('newspaper/view/')}}<?=$newspaper->id;?>"> <?=$newspaper->name;?></a></h2>
<p><?=$lang["editor"];?> :<a href="{{url('homepage/profile/')}}<?=$owner->id;?>"> <img width="20px" height="20px" src="{{url('')}}<?=$owner->avatar;?>" /><strong> <?=$owner->username;?></a><?php if(isset($newspaper_owner)){?> (<a href="{{url('newspaper/manage/')}}<?=$newspaper->id;?>"><?=$lang["manage"];?></a>)<?php } ?></strong> </p>
</div>

<div class="showback">
<h2><?=$lang["all_article"];?></h2><hr />
<ul class="nav nav-list bs-docs-sidenav affix-top">
<?php 
foreach ($article_list as $article){
    $vote=new Vote();
    $votex=$vote->get_vote($article->id);
    ?>
<li><a href="{{url('article/view/')}}<?=$article->id;?>" class="link-active"><i class="icon-chevron-right"></i> <?=$article->title." (".$votex[0]." ".$lang['vote'].")";?></a></li>
   <?php }?> 
     </ul>

<?php echo count($article_list)." ".$lang["total_article"];?>
</div>

</div>