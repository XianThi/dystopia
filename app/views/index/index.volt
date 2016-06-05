<div id="hello">
	    <div class="container">
	    	<div class="row">
	    		<div class="col-lg-8 col-lg-offset-2 centered">
                  <h1><?=$lang->_("welcome_to");?> Dystopia!</h1>
    <h2><?=$lang->_("index_text");?></h2>
    <h2>{{ link_to('session/register', lang["register_now"], 'class': 'btn btn-primary btn-large btn-success') }} <?=$lang->_("or");?>
    {{ link_to('session/index', lang["login"], 'class': 'btn btn-primary btn-large btn-success') }}</h2>
	    		</div><!-- /col-lg-8 -->
	    	</div><!-- /row -->
	    </div> <!-- /container -->
	</div><!-- /hello -->  
    <div id="green">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 centered">
					<img src="{{url('img/world.png')}}" alt="">
				</div>
				
				<div class="col-lg-7 centered">
					<h3><?=$lang["what_do"];?></h3>
					<p><?=$lang["mission"];?></p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row centered mt grid">
			<h3><?=$lang["ideologies"];?></h3>
			<div class="mt"></div>
			<div class="col-lg-4">
				<a href="#"><img src="{{url('img/01.jpg')}}" alt=""></a>
			</div>
			<div class="col-lg-4">
				<a href="#"><img src="{{url('img/02.jpg')}}" alt=""></a>
			</div>
			<div class="col-lg-4">
				<a href="#"><img src="{{url('img/03.jpg')}}" alt=""></a>
			</div>
		</div>
		
		<div class="row centered mt grid">
			<div class="mt"></div>		
			<div class="col-lg-4">
				<a href="#"><img src="{{url('img/04.jpg')}}" alt=""></a>
			</div>
			<div class="col-lg-4">
				<a href="#"><img src="{{url('img/05.jpg')}}" alt=""></a>
			</div>
			<div class="col-lg-4">
				<a href="#"><img src="{{url('img/06.jpg')}}" alt=""></a>
			</div>
		</div>
		
		<div class="row mt centered">
			<div class="col-lg-7 col-lg-offset-1 mt">
					<p class="lead"><?=$lang["proposal_ideology"];?></p>
			</div>
			
			<div class="col-lg-3 mt">
				<p><button type="button" class="btn btn-theme btn-lg"><?=$lang["proposal"];?>!</button></p>
			</div>
		</div>
	</div>


	<div id="skills">
		<div class="container">
			<div class="row centered">
				<h3><?=$lang["developing"];?></h3>
				<div class="col-lg-3 mt">
					<canvas id="design" height="130" width="130"></canvas>
					<p><?=$lang["design"];?></p>
					<br>
					<script>
						var doughnutData = [
								{
									value: 60,
									color:"#74cfae"
								},
								{
									value : 40,
									color : "#3c3c3c"
								}
							];
							var myDoughnut = new Chart(document.getElementById("design").getContext("2d")).Doughnut(doughnutData);
					</script>
				</div>
				<div class="col-lg-3 mt">
					<canvas id="coding" height="130" width="130"></canvas>
					<p><?=$lang["coding"];?></p>
					<br>
					<script>
						var doughnutData = [
								{
									value: 60,
									color:"#74cfae"
								},
								{
									value : 40,
									color : "#3c3c3c"
								}
							];
							var myDoughnut = new Chart(document.getElementById("coding").getContext("2d")).Doughnut(doughnutData);
					</script>
				</div>
				<div class="col-lg-3 mt">
					<canvas id="modules" height="130" width="130"></canvas>
					<p><?=$lang["modules"];?></p>
					<br>
					<script>
						var doughnutData = [
								{
									value: 40,
									color:"#74cfae"
								},
								{
									value : 60,
									color : "#3c3c3c"
								}
							];
							var myDoughnut = new Chart(document.getElementById("modules").getContext("2d")).Doughnut(doughnutData);
					</script>
				</div>
				<div class="col-lg-3 mt">
					<canvas id="optimization" height="130" width="130"></canvas>
					<p><?=$lang["optimization"];?></p>
					<br>
					<script>
						var doughnutData = [
								{
									value: 10,
									color:"#74cfae"
								},
								{
									value : 90,
									color : "#3c3c3c"
								}
							];
							var myDoughnut = new Chart(document.getElementById("optimization").getContext("2d")).Doughnut(doughnutData);
					</script>
				</div>
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /skills -->
	
	<section id="contact"></section>
	<div id="social">
		<div class="container">
			<div class="row centered">
            <h3><?=$lang["follow_us"];?></h3>
				<div class="col-lg-8 col-lg-offset-2">
					<div class="col-md-3">
						<a href="#"><i class="fa fa-facebook"></i></a>
					</div>
					<div class="col-md-3">
						<a href="#"><i class="fa fa-dribbble"></i></a>
					</div>
					<div class="col-md-3">
						<a href="#"><i class="fa fa-twitter"></i></a>
					</div>
					<div class="col-md-3">
						<a href="#"><i class="fa fa-envelope"></i></a>
					</div>
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /social -->


	<div id="f">
		<div class="container">
			<div class="row">
				<p> Writing by XianThi | 2014</p>
			</div>
		</div>
	</div>

