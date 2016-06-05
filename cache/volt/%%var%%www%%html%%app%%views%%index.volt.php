<!DOCTYPE html>
<html style="overflow: hidden;">
    <head>
        <meta charset="utf-8">        
        <meta http-equiv="X-UA-Compatible" content="edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?php echo $this->tag->getTitle(); ?>
        <?php echo $this->tag->stylesheetLink('bootstrap/css/bootstrap.css'); ?>
        <?php echo $this->tag->stylesheetLink('bootstrap/css/style-responsive.css'); ?>
         <?php echo $this->tag->stylesheetLink('bootstrap/css/table-responsive.css'); ?>
        <?php echo $this->tag->stylesheetLink('css/style.css'); ?>
        <?php echo $this->tag->stylesheetLink('css/jquery-ui.css'); ?>                
        <?php echo $this->tag->stylesheetLink('bootstrap/css/bootstrap-theme.min.css'); ?>
       <?php echo $this->tag->stylesheetLink('bootstrap/css/template.css'); ?>
        <?php echo $this->tag->stylesheetLink('css/css/font-awesome.css'); ?>
         <?php echo $this->tag->stylesheetLink('css/css/jasny-bootstrap.min.css'); ?>
         <?php echo $this->tag->stylesheetLink('css/css/whhg.css'); ?>
         <?php echo $this->tag->stylesheetLink('gritter/css/jquery.gritter.css'); ?>
         <?php echo $this->tag->stylesheetLink('css/morris.css'); ?>
         <?php echo $this->tag->stylesheetLink('datatable/css/jquery.dataTables.min.css'); ?>
                  <!-- JAVASCRIPT -->
                  
        
        <?php echo $this->tag->javascriptInclude('js/jquery.min.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/jquery-ui.js'); ?>
        <?php echo $this->tag->javascriptInclude('bootstrap/js/bootstrap.min.js'); ?>
        <?php echo $this->tag->javascriptInclude('datatable/js/jquery.dataTables.min.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/jquery.dc.min.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/jquery.nicescroll.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/jquery.scrollto.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/utils.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/functions.js.php'); ?>
        <?php echo $this->tag->javascriptInclude('js/tinymce/tinymce.min.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/widget.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/polygon.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/chart.js'); ?>
        <?php echo $this->tag->javascriptInclude('gritter/js/jquery.gritter.min.js'); ?>
        <?php echo $this->tag->javascriptInclude('bootstrap/js/commonscripts.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/jquery.balloon.min.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/morris.min.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/raphael-min.js'); ?>
        <?php echo $this->tag->javascriptInclude('js/jasny-bootstrap.min.js'); ?>
        <!--[if lt IE 9]>
<?php echo $this->tag->javascriptInclude('js/dist/html5shiv.js'); ?>
<?php echo $this->tag->javascriptInclude('js/respond.js'); ?>
<![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Dystopia | New world">
        <meta name="author" content="XianTh">
    </head>
    
    <body>

        <?php echo $this->getContent(); ?>

    </body>
    


  
</html>