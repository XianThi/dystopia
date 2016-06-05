<!DOCTYPE html>
<html style="overflow: hidden;">
    <head>
        <meta charset="utf-8">        
        <meta http-equiv="X-UA-Compatible" content="edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        {{ get_title() }}
        {{ stylesheet_link('bootstrap/css/bootstrap.css') }}
        {{ stylesheet_link('bootstrap/css/style-responsive.css') }}
         {{ stylesheet_link('bootstrap/css/table-responsive.css') }}
        {{ stylesheet_link('css/style.css') }}
        {{ stylesheet_link('css/jquery-ui.css') }}                
        {{ stylesheet_link('bootstrap/css/bootstrap-theme.min.css') }}
       {{ stylesheet_link('bootstrap/css/template.css') }}
        {{ stylesheet_link('css/css/font-awesome.css') }}
         {{ stylesheet_link('css/css/jasny-bootstrap.min.css') }}
         {{ stylesheet_link('css/css/whhg.css') }}
         {{stylesheet_link('gritter/css/jquery.gritter.css')}}
         {{stylesheet_link('css/morris.css')}}
         {{stylesheet_link('datatable/css/jquery.dataTables.min.css')}}
                  <!-- JAVASCRIPT -->
                  
        
        {{ javascript_include('js/jquery.min.js') }}
        {{ javascript_include('js/jquery-ui.js') }}
        {{ javascript_include('bootstrap/js/bootstrap.min.js') }}
        {{ javascript_include('datatable/js/jquery.dataTables.min.js')}}
        {{ javascript_include('js/jquery.dc.min.js') }}
        {{ javascript_include('js/jquery.nicescroll.js') }}
        {{ javascript_include('js/jquery.scrollto.js') }}
        {{ javascript_include('js/utils.js') }}
        {{ javascript_include('js/functions.js.php') }}
        {{javascript_include('js/tinymce/tinymce.min.js')}}
        {{javascript_include('js/widget.js')}}
        {{javascript_include('js/polygon.js')}}
        {{javascript_include('js/chart.js')}}
        {{javascript_include('gritter/js/jquery.gritter.min.js')}}
        {{ javascript_include('bootstrap/js/commonscripts.js') }}
        {{javascript_include('js/jquery.balloon.min.js')}}
        {{ javascript_include('js/morris.min.js') }}
        {{ javascript_include('js/raphael-min.js') }}
        {{ javascript_include('js/jasny-bootstrap.min.js') }}
        <!--[if lt IE 9]>
{{ javascript_include('js/dist/html5shiv.js') }}
{{ javascript_include('js/respond.js') }}
<![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Dystopia | New world">
        <meta name="author" content="XianTh">
    </head>
    
    <body>

        {{ content() }}

    </body>
    


  
</html>