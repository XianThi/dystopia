 {{stylesheet_link('css/main.css')}}
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="{{url('index/index')}}"><i class="fa fa-bolt"></i></a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="{{url('contact/index')}}">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    {{ content() }}