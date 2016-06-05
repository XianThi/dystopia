{{content()}}
      <script type="text/javascript">
        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: "{{title}}",
            // (string | mandatory) the text inside the notification
            text: "{{text}}",
            // (string | optional) the image to display on the left
            image: "{{url()~image}}",
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

$("#submitglobal").click(function(){
var formid=$(this).closest('form').attr('id');
$('#'+formid).myfunction(formid);
});
$("#submitfriends").click(function(){
var formid=$(this).closest('form').attr('id');
$('#'+formid).myfunction(formid);
});
$("#submitzone").click(function(){
var formid=$(this).closest('form').attr('id');
$('#'+formid).myfunction(formid);
});
$(function($){
$.fn.myfunction = function(formid) {
var message = $("#"+formid+" textarea[name=message]").val();
var type = $("#"+formid+" input[name=type]").val();
// Returns successful data submission message when the entered information is stored in database.
var dataString = 'message='+ message + '&type='+ type;
if(message==''||type=='')
{
alert("Message cant empty");
}
else
{
// AJAX Code To Submit Form.
$.ajax({
type: "POST",
url: "{{url('shout/add')}}",
data: dataString,
cache: false,
success: function(response){
$("#"+formid+" textarea[name=message]").val("");
 $.gritter.add({
               title: 'Shout!',
               text: response,
               fade_in_speed: 'medium', // how fast notifications fade in (string or int)
               fade_out_speed: 2000, // how fast the notices fade out
               time: 3000 // hang on the screen for...
            });

        }
});
} }; });
 var refreshId = setInterval(function() {
      $("#globalshouts").load("{{url('shout/index/global')}}");
      $("#zoneshouts").load("{{url('shout/index/zone')}}");
      $("#friendshouts").load("{{url('shout/index/friends')}}");
      $("#latest").load("{{url('newspaper/getnews/latest')}}");
      $("#best").load("{{url('newspaper/getnews/best')}}");
   }, 2000);
return false;

        });
        /*
function globalshout(){
    $("#globalshouts").html("<img src='{{url('img/loading.gif')}} />");
            $.get("{{url('shout/index/global')}}", function(data) {
            $("#globalshouts").html(data);
         
        });
}
function friendshout(){
     $("#friendshouts").html("<img src='{{url('img/loading.gif')}}' />");
            $.get("{{url('shout/index/friend')}}", function(data) {
            $("#friendshouts").html(data);
         
        });
}
function zoneshout(){
     $("#zoneshouts").html("<img src='{{url('img/loading.gif')}}' />");
            $.get("{{url('shout/index/zone')}}", function(data) {
            $("#zoneshouts").html(data);
         
        });
        }
        */
	</script>
    <div class="col-md-7">
    
  <div>
 <div class="col-md-12" style="margin-bottom: 5%;">
 <div class="weather-2 pn" style="height: 100%;"><div class="weather-2-header"><p><?=$lang["wars"];?></p></div>
    <ul class="nav nav-pills" id="myTab">
      <li class="active"><a href="#zonewars" data-toggle="tab"><i class="fa fa-fighter-jet"></i>{{ lang["zonewars"]}}</a></li>
        <li><a href="#globalwars" data-toggle="tab"><i class="fa fa-fighter-jet"></i>{{ lang["globalwars"]}}</a></li>
    </ul>  </div>
</div>
 </div>


 <div>
 <div class="col-md-12" style="margin-bottom: 5%;">
 <div class="weather-2 pn" style="height: 100%;"><div class="weather-2-header"><p><?=$lang["actions"];?></p></div>
    <ul class="nav nav-pills" id="myTab">
    <li class="active"><a href="#agenda" data-toggle="tab"><i class="fa fa-clock-o"></i> {{ lang["agenda"]}}</a></li>
      <li><a href="#laws" data-toggle="tab"><i class="fa fa-clock-o"></i> {{ lang["laws"]}}</a></li>
        <li><a href="#pacts" data-toggle="tab"><i class="fa fa-fighter-jet"></i> {{ lang["pacts"]}}</a></li>
    </ul>  </div>
</div>
 </div>
 
 <div>
<div class="col-md-5" style="margin-bottom: 5%;">
<div class="weather-2 pn" style="height: 100%;"><div class="weather-2-header"><p><?=$lang["news"];?></p></div>
    <ul class="nav nav-pills nav-stacked" id="myTab">
      <li class="active"><a href="#latest" data-toggle="tab"><i class="fa fa-file-text-o"></i>{{ lang["latest_articles"]}}</a></li>
      <li><a href="#best" data-toggle="tab"><i class="fa fa-file-text-o"></i>{{ lang["best_articles"]}}</a></li>
    </ul>  </div></div>
    
    <div class="col-md-7">
<div class="weather-2 pn" style="height: 100%;"><div class="weather-2-header"><p><?=$lang["news_content_panel"];?></p></div>                                                                                   
    <div class="tab-content">
      
     <div class="tab-pane active" id="latest">
   
      
     </div>
          <div class="tab-pane" id="best">
     
      
     </div>
     
     <div class="tab-pane" id="events">
       <div class="media">
                  <a class="pull-left" href="#">
                    <img class="media-object img-thumbnail" width="100" src="http://cfi-sinergia.epfl.ch/files/content/sites/cfi-sinergia/files/WORKSHOPS/Workshop1.jpg" alt="...">
                  </a>
                  <div class="media-body">
                    <h4 class="media-heading">Working this area</h4>
                    we made this area please hold the line.
                  </div>
            </div>
    </div>
    
    
       <div class="tab-pane" id="wars">
        <a href=""><div class="well well-sm" style="margin:0px;">Savaşlar burada <span class="pull-right"><i class="glyphicon glyphicon-time"></i> 12:20 AM 20 Dec 2014 </span></div></a>        
     </div>     
  
    </div></div></div>
    </div></div>
  
  <div class="col-md-5">

<div class="col-md-3">
<div class="weather-2 pn" style="height: 100%;"><div class="weather-2-header"><p><?=$lang["channel"];?></p></div>
<ul class="nav nav-pills nav-stacked" id="myTab">
   <li class="active"><a href="#global" data-toggle="tab"><?=$lang["global"];?></a></li>
   <li><a href="#friends" data-toggle="tab"><?=$lang["friends"];?></a></li>
   <li><a href="#zone" data-toggle="tab"><?=$lang["zone"];?></a></li>
</ul></div></div>
<div class="col-md-9">
<div class="weather-2 pn" style="height: 100%;"><div class="weather-2-header"><p><?=$lang["last_shout"];?></p></div>
<div class="tab-content">
      
     <div class="tab-pane active" id="global">
<form id="global" class="style-form">
<div class="form-group"><label class="col-sm-2 control-label" for="message"><?=$lang["write_shout"];?></label><textarea class="form-control" name="message" ></textarea>
<input type="hidden" name="type" value="0" />
<input id="submitglobal" type="button" class="btn btn-info btn-xs" value="<?=$lang["submit"];?>" />
</div>
</form>
<div id="globalshouts" class="col-lg-12 ds">

 </div>
     </div>
     <div class="tab-pane" id="friends">
     <form id="friend" class="style-form">
<div class="form-group"><label class="col-sm-2 control-label" for="message"><?=$lang["write_shout"];?></label><textarea class="form-control" name="message"></textarea>
<input type="hidden" name="type" value="1" />
<input id="submitfriends" type="button" class="btn btn-info btn-xs" value="<?=$lang["submit"];?>" />
</div>
</form>
<div id="friendshouts" class="col-lg-12 ds">
     </div>
     </div>
     <div class="tab-pane" id="zone">
<form id="zone" class="style-form" method="POST">
<div class="form-group"><label class="col-sm-2 control-label" for="message"><?=$lang["write_shout"];?></label><textarea class="form-control" name="message"></textarea>
<input type="hidden" name="type" value="2" />
<input id="submitzone" type="button" class="btn btn-info btn-xs" value="<?=$lang["submit"];?>" />
</div>
</form>
<div id="zoneshouts" class="col-lg-12 ds">

 </div>
         


     </div> 
     
     </div>
  </div></div>
    </div>
 <div id="gritter-notice-wrapper">
</div>
