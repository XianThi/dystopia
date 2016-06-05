{{content()}}
<div class="alert alert-info">
<div style="float: right;"><a href="{{url('article/vote/')}}<?=$article->id;?>" ><img src="{{url('img/vote.png')}}" height="40px" width="auto" /></a><b> (<?=$vote[0];?>)</b></div>
<p><?=$lang["newspaper"];?> : <a href="{{url('newspaper/view/')}}<?=$newspaper->id;?>"><b><?=$newspaper->name;?></b></a></p>
<p><?=$lang["writer"];?> :<a href="{{url('homepage/profile/')}}<?=$owner->id;?>"> <img width="20px" height="20px" src="{{url('')}}<?=$owner->avatar;?>" /><b> <?=$owner->username;?></b> </a></p>
</div>

<div class="showback">
 <h2> <?=$article->title;?></h2><hr />

<p><?=$article->content;?></p>
</div>

</div>