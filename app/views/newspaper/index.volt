{{content()}}
<div class="showback"><h2><?=$lang["newspapers"];?></h2><hr />
<ul class="nav nav-pills">
<li class="active">
<a href="#newspapers" data-toggle="tab"><?=$lang["newspapers"];?></a>
</li>
<li>
<a href="#my_newspaper" data-toggle="tab"><?=$lang["my_newspaper"];?></a>
</li>
    <li class="pull-right">
        {{ link_to("newspaper/new", lang["newspaper_create"], "class": "btn btn-primary") }}
    </li>
</ul>

<div class="tab-content"> 
      <div class="tab-pane active" id="newspapers"> 

<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["newspaper_name"];?></th>
            <th><?=$lang["newspaper_owner"];?></th>
            <th><?=$lang["newspaper_subs"];?></a></a></th>
            <th>İşlemler</th>
        </tr>
    </thead>
    <?php 
    $i=1;
    foreach($newspapers as $newspaper){
        $subs=new Subs();
        $get_subs=$subs->get_subs($newspaper->id);
        $subs=$subs->findfirst("userid=$userid and newspaper=$newspaper->id");
        $users=new Users();
        $users=$users->findfirst("id=$newspaper->owner");
        
        ?>
        <tbody>
        <tr>
            <td><?=$i;?></td>
            <td><a href="{{url('newspaper/view/'~newspaper.id)}}"><img width="20px" height="20px" src="{{url(newspaper.avatar)}}" />{{ newspaper.name }}</a></td>
            <td><a href="{{url('homepage/profile/'~users.id)}}"><img width="20px" height="20px" src="{{url(users.avatar)}}" />{{users.username }}</a></td>
            <td><?=$get_subs[0];?></td>
           <?php if($subs==false){ ?> <td width="12%">{{ link_to("newspaper/subs/" ~ newspaper.id, '<i class="icon-pencil"></i> '~lang["sub"], "class": "btn btn-success btn-xs") }}</td>
           <?php }else { ?><td width="12%">{{ link_to("newspaper/view/" ~ newspaper.id, '<i class="icon-ok"></i> '~lang["already_sub"], "class": "btn btn-warning btn-xs") }}</td> <?php }?>
      
        </tr>
    </tbody>
    
    <?php  $i++; }?>
    </table>
    </div>
    
    
      <div class="tab-pane" id="my_newspaper"> 
      
      <table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["newspaper_name"];?></th>
            <th><?=$lang["newspaper_owner"];?></th>
            <th><?=$lang["newspaper_subs"];?></a></a></th>
            <th><?=$lang["proccess"];?></th>
        </tr>
    </thead>
    <?php 
    $i=1;
    foreach($mynewspaper as $newspaperx){
        $subs=new Subs();
        $get_subs=$subs->get_subs($newspaperx->id);
        $usersx=new Users();
        $usersx=$usersx->findfirst("id=$newspaperx->owner");
        
        ?>
        <tbody>
        <tr>
            <td><?=$i;?></td>
            <td><a href="{{url('newspaper/view/'~newspaperx.id)}}"><img width="20px" height="20px" src="{{url(newspaperx.avatar)}}" />{{ newspaperx.name }}</a></td>
            <td><a href="{{url('homepage/profile/'~usersx.id)}}"><img width="20px" height="20px" src="{{url(usersx.avatar)}}" />{{usersx.username }}</a></td>
            <td><?=$get_subs[0];?></td>
             <td width="12%">{{ link_to("newspaper/manage/" ~ newspaperx.id, '<i class="icon-pencil"></i> '~lang["manage"], "class": "btn btn-success btn-xs") }}</td>
           
        </tr>
    </tbody>
    
    <?php  $i++; }?>
    </table>
      
      </div>
    
    
    
    </div></div>