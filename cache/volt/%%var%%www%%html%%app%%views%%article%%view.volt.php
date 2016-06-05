<?php echo $this->getContent(); ?>
<div class="alert alert-info">
<div style="float: right;"><a href="<?php echo $this->url->get('article/vote/'); ?><?=$article->id;?>" ><img src="<?php echo $this->url->get('img/vote.png'); ?>" height="40px" width="auto" /></a><b> (<?=$vote[0];?>)</b></div>
<p><?=$lang["newspaper"];?> : <a href="<?php echo $this->url->get('newspaper/view/'); ?><?=$newspaper->id;?>"><b><?=$newspaper->name;?></b></a></p>
<p><?=$lang["writer"];?> :<a href="<?php echo $this->url->get('homepage/profile/'); ?><?=$owner->id;?>"> <img width="20px" height="20px" src="<?php echo $this->url->get(''); ?><?=$owner->avatar;?>" /><b> <?=$owner->username;?></b> </a></p>
</div>

<div class="showback">
 <h2> <?=$article->title;?></h2><hr />

<p><?=$article->content;?></p>
</div>

</div>