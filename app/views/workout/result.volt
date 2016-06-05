{{content()}}
<table class="table table-striped table-advance table-hover">
<!-- On rows -->
<tr>
<td class="danger"></td>
<td class="active"><?=$lang["win_str"];?></td>
<td class="active"><?=$lang["win_int"];?></a></td>
<td class="active"><?=$lang["timerow"];?></a></td>
<td class="active"><?=$lang["current"];?> <?=$lang["str"];?></td>
<td class="active"><?=$lang["current"];?> <?=$lang["int"];?></td>
</tr>
<!-- On cells (`td` or `th`) -->
<tr>
<td class="danger"><label><?=$lang["train_result"];?> : </label></td>
  <td class="info"><?php if(!empty($win_str)){echo $win_str;} ?></td>
  <td class="warning"><?php if(!empty($win_int)){echo $win_int;} ?></td>
  <td class="success"><?php if(!empty($timerow)){echo $timerow;} ?> <?=$lang["day_of_total"];?></td>
  <td class="info"><?php if(!empty($total_str)){echo $total_str;} ?></td>
  <td class="warning"><?php if(!empty($total_int)){echo $total_int;} ?></td>
</tr>
</table>
</div>