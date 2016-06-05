{{content()}}
<h2><?=$lang["delete_article_text_message"];?></h2><hr />
<div class="form-panel">
<form action="#" method="POST">
<input type="hidden" name="ok" value="ok" />
<input class="btn btn-success" type="submit" value="<?=$lang["yes"];?>" /> <input class="btn btn-danger" action="action" type="button" value="<?=$lang["no"];?>" onclick="history.go(-1);" />
</form>
</div>