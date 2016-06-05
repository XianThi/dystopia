<?php use Phalcon\Tag as Tag ?>
 <?php $this->assets->outputJs() ?>
 <section id="container">
 <header class="header black-bg">
<div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
              <a href="{{url('homepage/index')}}" class="logo"><b>Dystopia</b></a>
              
              <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
      {{ elements.getMenu() }}
      <?php 
      $auth = $this->session->get('auth');
      $userid=$auth["id"];
      $notifications=new Notifications();
      $functions=new Functions();
      $unread=$notifications->getnotifications($userid);
      $total=$notifications->getnotifications2($userid);
      $notificationsx=$notifications->find("userid=$userid order by created_time desc LIMIT 3");
      ?>
<li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle">
                            <i class="fa fa-tasks"> <?=$lang["notifications"];?></i>
                            <span id="notifications_badge" class="badge bg-theme"></span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green"><?=$lang["unread_notif"];?> : <?=$unread[0];?><br /> <?=$lang["total_notif"];?> : <?=$total[0];?></p>
                            </li>
                            <?php foreach($notificationsx as $notif){ ?>
                            <li>
                               <div class="task-info"> 
                                        <div class="desc"><a href="{{url('notifications/view/')~notif.id}}">{{notif.title}} - <?=$functions->time_ago($notif->created_time);?></a></div>
                                   
                                    <p>{{notif.desc}}</p>
                                
                                 </div>
                            </li>
                            
                            <?php } ?>
                            <li class="external">
                                <a href="{{url('notifications/index')}}"><?=$lang["see_all_notif"];?></a>
                            </li>
                        </ul>
                    </li>
                                         <li> <form class="navbar-form" action="{{url('search/all')}}" method="POST" role="search">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
            </div>
          </div>
        </form></li>
                    </div>
            </div>
<div class="nav notify-row" id="top_menu">
            	<ul class="nav pull-right top-menu">
                <li>
                <?php
        
        $users=new Users();
        $users=$users->findfirst("id=".$auth["id"]);
        $clock="
        <script type=\"text/javascript\">
     
	var imgSrcs = [\"../img/bg/anarchy-01.jpg\", \"../img/bg/anarchy-01.jpg\", \"../img/bg/anarchy-02.jpg\"];
 function changebg() {
    $(\"body\").css(\"background\", \"url(\" + imgSrcs[imgSrcs.push(imgSrcs.shift())-1] + \")  no-repeat center\");
   document.body.style.backgroundSize = 'cover';
}
function display()
{
    var today = new Date();
    var hour = today.getHours();
    var minute = today.getMinutes();
    var seconds = today.getSeconds();

    var output ='<font color=white>Sunucu Zamanı : '+hour + ':' + minute + ':' + seconds+'</font>';

  document.getElementById('clock').innerHTML=output;
}
setInterval(display, 1000);
</script>
<div id=\"clock\"></div>";

        echo '<ul class="nav pull-right top-menu">
          <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown">'.$auth["name"].'<b class="caret"></b></a>
          <ul class="dropdown-menu" style="right:auto;">
            <li align="center" class="well">
                <div><img class="img-responsive" style="padding:12%;" src="'.$users->avatar.'"/><a class="change" href="/homepage/settings">Resim Değiştir</a></div>
                <a href="/homepage/settings" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-lock"></span> Ayarlar</a>
            </li>
           </ul>
           
        </li>
        
      </ul>';
                ?></li>
                    <li><a class="logout" href="{{url('session/end')}}">Logout</a></li>
                    <li><?=$clock;?></li><br />
            	</ul>
            </div>
</header>
</section>
<aside>
          <div id="sidebar" class="nav-collapse " tabindex="5000" style="overflow:hidden; outline: none; margin-left: 0px;">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion" style="display: block;">
              
              	  <a href="{{url('homepage/profile/')~userid}}"><p class="centered"><img src="/{{avatar}}" class="img-thumbnail" width="60"></p>
              	  <h5 class="centered">{{username}}</h5></a>
                  <div class="row mt"> 
<div class="col-md-6 box0"><label>{{lang["gold"]}} : </label>  <img src="{{url('img/gold.png')}}" height="14px" width="14px" /> {{gold}} <br />
</div>
<div class="col-md-6 box0"><label>{{lang["currency"]}} : </label> <i class="fa fa-money"> {{currency}}</i> <br /></div>
  <div class="col-md-12 box0">
<label>{{lang["wellness"]}} : </label>
<div class="progressbar" style="width:100px;margin-bottom:5px;" data-perc="100"> 
<div class="bar" style="width:{{wellness}}%;"><b><span>{{wellness}}%</span></b></div>
	</div></div><div class="col-md-12 box0">
<label>{{lang["level"]}} : {{level}}</label>
<div class="progressbar" style="width:100px;margin-bottom:5px;" data-perc="100"> 
<div class="bar color2" style="width:<?php echo $exp/$exp_max*100; ?>%;"><b><span>{{exp}}/{{exp_max}}</span></b></div>
	</div></div>
    <div class="col-md-12 box0">
<label>{{lang["energy"]}} : <b></b></label>
<div class="progressbar" style="width:100px;margin-bottom:5px;" data-perc="100"> 
<div class="bar color3" style="width:<?=$energy;?>%;"><span>{{energy}}</span></div>
	</div>                
                </div> 
                </div>
                  <li class="mt">
                      <a href="{{url('homepage/index')}}">
                          <i class="fa fa-dashboard"></i>
                          <span>Anasayfa</span>
                      </a>
                  </li>

                  <li class="sub-menu dcjq-parent-li">
                      <a href="javascript:;" class="dcjq-parent">
                          <i class="fa fa-desktop"></i>
                          <span>Gündelikler</span>
                      <span class="dcjq-icon"></span></a>
                      <ul class="sub" style="display: none;">
                        <li><a href="{{url('citizen/work')}}"><i class="fa fa-wrench faa-wrench animated fa-2x"></i> <?=$lang["works"];?></a></li>
                        <li><a href="{{url('citizen/train')}}"><i class="fa fa-cog fa-2x fa-spin"></i> <?=$lang["train"];?></a></li>
                        <li><a href="{{url('citizen/brain')}}"><i class="fa fa-lightbulb-o fa-2x"></i> <?=$lang["brain_mission"];?></a></li>
                       <li><a href="#"><i class="icon-securityalt-shieldalt"></i> <?=$lang["police"];?></a></li>
                        
                      </ul>
                  </li>

                  <li class="sub-menu dcjq-parent-li">
                      <a href="javascript:;" class="dcjq-parent">
                          <i class="fa fa-cogs"></i>
                          <span>Yönetilebilirler</span>
                      <span class="dcjq-icon"></span></a>
                      <ul class="sub" style="display: none;">
             <li><a href="#"><i class="fa fa-group"></i> <?=$lang["gangs"];?></a></li>
                         <li><a href="{{url('company/index')}}"><i class="fa fa-building-o"></i> <?=$lang["companies"];?></a></li>
                         <li><a href="{{url('newspaper/index')}}"><i class="icon-news"></i> <?=$lang["newspapers"];?></a></li>
                         <li><a href="{{url('zone/index')}}"><i class="fa fa-flag-checkered"></i> <?=$lang["country"];?></a></li>
                      </ul>
                  </li>
                  <li class="sub-menu dcjq-parent-li">
                      <a href="javascript:;" class="dcjq-parent">
                          <i class="fa fa-calculator"></i>
                          <span>Market</span>
                      <span class="dcjq-icon"></span></a>
                      <ul class="sub" style="display: none;">             
             <li><a href="{{url('market/products')}}"><i class="fa fa-exclamation-triangle"></i> <?=$lang["product_market"];?></a></li>
             <li><a href="#"><i class="icon-exchange-currency"></i> <?=$lang["money_market"];?></a></li>
             <li><a href="{{url('market/companies')}}"><i class="fa fa-trello"></i> <?=$lang["selling_company"];?></a></li>
                      </ul>
                  </li>
                  <li class="sub-menu dcjq-parent-li">
                      <a href="javascript:;" class="dcjq-parent">
                          <i class="fa fa-book"></i>
                          <span>Ekstralar</span>
                      <span class="dcjq-icon"></span></a>
                      <ul class="sub" style="display: none;">             
             <li><a href="#"><i class="fa fa-exclamation-triangle"></i> <?=$lang["wanted"];?></a></li>
             <li><a href="#"><i class="fa fa-line-chart"></i> <?=$lang["stock_market"];?></a></li>
                      </ul>
                  </li>
                  

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
<div class="clearfix"></div>
<div style="margin-bottom: 3%;" class="container">

   {{ content() }}
    

   
</div>
 <div id="footer">
     <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="navbar-inner navbar-content-center">
   <p style="float: left; padding:1%; color:black;">&copy; <?=$lang["copyright"];?> 2014</p>
    <div class="onlineWidget">
	<div class="panel2"><img class="preloader" src="{{url('img/preloader.gif')}}" alt="Loading.." width="22" height="22" /></div>
	<div class="count"></div>
    <div class="arrow"></div></div></nav></div>
     </div>

