{{content()}}
<ul class="nav nav-pills">
<li class="active">
<a href="#manage" data-toggle="tab"><?=$lang["manage"];?></a>
</li>
<li>
<a href="#edit" data-toggle="tab"><?=$lang["edit"];?></a>
</li>
    <li class="pull-right">
        {{ link_to("article/new/"~npid, lang["create_article"], "class": "btn btn-primary") }}
    </li>
</ul>

<div class="tab-content"> 
      <div class="tab-pane active" id="manage"> 
      
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            
            <th><?=$lang["article_title"];?></th>
            <th><?=$lang["vote"];?></th>
            <th><?=$lang["article_author"];?></th>
            <th><?=$lang["publish_time"];?></th>
            <th><?=$lang["proccess"];?></a></th>
        </tr>
    </thead>
    <?php foreach ($article_list as $article){
    $vote=new Vote();
    $users=new Users();
    $votex=$vote->get_vote($article->id);        
    $users=$users->findfirst("id=$article->author"); 
    ?>
        <tbody>
        <tr>
            
            <td><a href="{{url('article/view/')}}<?=$article->id;?>" class="link-active"><i class="icon-chevron-right"></i><?=$article->title;?></a></td>
            <td><?=$votex[0];?></a></td>
            <td><a href="{{url('homepage/profile/')}}<?=$users->id;?>"><img src="{{url('')}}<?=$users->avatar;?>" width="20px" height="20px" /><?=$users->username;?></a></td>
            <td><?=$article->create_time;?></td>
             <td width="5%">
             {{ link_to("article/edit/" ~ article.id, '<i class="fa fa-pencil"></i> '~lang["edit"], "class": "btn btn-info btn-xs") }}
             {{ link_to("article/delete/" ~ article.id, '<i class="fa fa-trash-o"></i> '~lang["delete"], "class": "btn btn-danger btn-xs") }}</td>
           
        </tr>
    </tbody>
    
    <?php }?>
    </table>
    <?php echo count($article_list)." ".$lang["total_article"];?>
      </div>
      
       <div class="tab-pane" id="edit"> 
       <div class="form-panel">
       <h4 class="page-header"><?=$lang["newspaper_edit"];?></h4>
<h4><?=$lang["edit_info"];?></h4><hr />
<form action="{{url('company/editinfo/')}}<?php if(isset($company_id)){echo $company_id;}?>" method="POST">
<label for="name"><?=$lang["newspaper_name"];?> <?=$lang["change"];?> : </label> <input type="text" name="newspaper_name" value="<?php if(isset($company_name)){echo $company_name;}?>" />
<input class="btn btn-info" type="submit" value="<?=$lang['change'];?>" />

</form>
<hr />
<h4><?=$lang["change_avatar"];?></h4>

<form action="{{url('company/upload')}}" method="post" enctype="multipart/form-data">
<label for="file"><?=$lang["select_file"];?></label> 
<input type="file" name="avatar" id="file" /> <br />
<button class="btn btn-info"><?=$lang["upload_file"];?></button>
</form>
      </div>
      
      </div>

</div>