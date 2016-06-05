{{content()}}
<script>function toggle(source) {
  checkboxes = document.getElementsByName('chkbox[]');
  for(var i=0, n=checkboxes.length;i<n;i++) {
    checkboxes[i].checked = source.checked;
  }
}</script>
<div class="showback">
<h2><?=$lang["notifications"];?></h2><div class="pull-right"><form method="post"><input class="btn btn-primary" type="submit" name="delete" value="Delete Selected" /></div><hr />
<table class="table table-striped table-advance table-hover" align="center">
    <thead>
        <tr>
        <th><input type="checkbox" style="width: 15px; height:15px;" onclick="toggle(this);" /> #</th>
        <th><?=$lang["title"];?></th>
        <th><?=$lang["desc"];?></th>
        <th><?=$lang["time"];?></th>
        </tr>
        </thead>
        <tbody>
        <?php $i=1; foreach($notifications as $notifx){ ?>
        <tr>
        <td><input type="checkbox" style="width: 15px; height:15px;" id="chkbox[]" name="chkbox[]"  value="{{notifx.id}}" /> <?=$i;?></td>
        <td><a href="{{url('notifications/view/')~notifx.id}}" ><?=$notifx->title;?></a></td>
        <td><?=$notifx->desc;?></td>
        <td><?=$notifx->created_time;?></td>
        </tr>
        <?php $i++; } ?>
        </tbody></form>
</div>