  <?php 
  if($action=="latest"){
foreach ($article_list as $article){
 $vote=new Vote();
    $votex=$vote->get_vote($article->id);?>
      <a href="{{url('article/view/')}}<?=$article->id;?>"><div class="well well-sm" style="margin:0px;"><span class="badge"><?=$votex[0];?> &raquo;</span>  <?=$article->title;?><span class="pull-right"><i class="glyphicon glyphicon-time"></i> <?=date($article->create_time);?></span></div></a>  
   <?php }}?> 
   
<?php
if($action=="best"){
$articlexx=new Article();  
$article_count=count($article_list2);
for ( $say=0 ; $say < $article_count ; $say++ ){
$articlexx=$articlexx->findfirst($article_list2[$say][0]);
    /*
$articlexx=$articlexx->find("id=$articlexxy->id");
foreach ($articlexx as $article2){?> */ ?>
      <a href="{{url('article/view/')}}<?=$articlexx->id;?>"><div class="well well-sm" style="margin:0px;"><span class="badge"><?=$article_list2[$say][1];?> &raquo;</span>  <?=$articlexx->title;?><span class="pull-right"><i class="glyphicon glyphicon-time"></i> <?=date($articlexx->create_time);?></span></div></a>  
   <?php }} ?> 