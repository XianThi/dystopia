{{content()}}
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("notifications", "&larr; Geri Dön") }}
    </li>
</ul>
<div class="showback center">
<div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">{{notifications.title}}</h3>
      </div>
      <div class="panel-body">
        {{notifications.desc}} <span style="right: 10%; position:absolute;"><?php $functions=new Functions(); echo $functions->time_ago($notifications->created_time); ?></span>
      </div>
    </div>
</div>