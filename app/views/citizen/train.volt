{{content()}}
<form method="post" action="{{url('workout/result')}}">
<h2><?=$lang["select_train_skill_text"];?></h2><hr />
<table class="table table-striped table-advance table-hover">
<tr>
<td class="active"> <?=$lang["train_skill1"];?> </td>
<td class="active"> <?=$lang["train_skill2"];?>  </td>
<td class="active"> <?=$lang["train_skill3"];?>  </td>
</tr>
<tr>
<td class="active"> <?=$lang["train_skill1_text"];?> <br /><input type="radio" value="1" name="train_skill" /><label><?=$lang["select_skill"];?></label> </td>
<td class="active"> <?=$lang["train_skill2_text"];?> <br /><input type="radio" value="2" name="train_skill" /><label><?=$lang["select_skill"];?></label></td>
<td class="active"> <?=$lang["train_skill3_text"];?> <br /><input type="radio" value="3" name="train_skill" /><label><?=$lang["select_skill"];?></label></td>
</tr>
</table>




<button class="btn btn-success"><?=$lang["train"];?></button>
</form>
</div>