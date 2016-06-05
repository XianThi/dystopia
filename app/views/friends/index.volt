<h2><?=$lang["friend_list"];?></h2><hr />
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
            <th>#</th>
            <th><?=$lang["username"];?></th>
        </tr>
    </thead>
<?php 
$i=1; foreach($friends as $friend){
    $users=new Users();
    $users=$users->findfirst("id=$friend->friendid");
    ?>
    <tbody>
     <tr>
            <td><?=$i;?></td>
            <td><a href="{{url('profile/view/')~users.id}}"><img src="{{url('')~users.avatar}}" height="25px" width="25px" /> {{users.username}}</a></td>
        </tr>
        <?php $i++;} ?>
    </tbody>
    </table>