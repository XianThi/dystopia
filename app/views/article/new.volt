<script>
tinymce.init({
    selector: "textarea#elm1",
    theme: "modern",
    width: "100%",
    height:"400px",
    plugins: [
         "advlist autolink link image lists preview hr anchor pagebreak spellchecker",
         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
         "save table contextmenu directionality emoticons template paste textcolor"
   ],
   content_css: "css/content.css",
   toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons", 
   style_formats: [
        {title: 'Bold text', inline: 'b'},
        {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
        {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
        {title: 'Example 1', inline: 'span', classes: 'example1'},
        {title: 'Example 2', inline: 'span', classes: 'example2'},
        {title: 'Table styles'},
        {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
    ]
 }); 
</script>

<!-- place in body of your html document -->
{{content()}}
<h1 class="page-header"><?=$lang["create_article"];?></h1>
<!-- Place this in the body of the page content -->
<div class="form-panel">
<form method="post" onsubmit="editor.post()" action="#">
<label for="title"><?=$lang["title"];?> : </label>
<input type="text" name="title" value="" style="width:80%;" /><br />
<label for="content"><?=$lang["content"];?> : </label>
<textarea id="elm1" name="content"></textarea> <br />
<input class="btn btn-success" type="submit" value="<?=$lang["publish"]?>" />
</form>
</div>
</div>