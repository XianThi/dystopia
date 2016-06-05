<?php echo $this->getContent(); ?>
<ul class="pager">
    <li class="previous pull-left">
        <?php echo $this->tag->linkTo(array('notifications', '&larr; Geri Dön')); ?>
    </li>
</ul>
<div class="showback center">
<div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title"><?php echo $notifications->title; ?></h3>
      </div>
      <div class="panel-body">
        <?php echo $notifications->desc; ?> <span style="right: 10%; position:absolute;"><?php $functions=new Functions(); echo $functions->time_ago($notifications->created_time); ?></span>
      </div>
    </div>
</div>