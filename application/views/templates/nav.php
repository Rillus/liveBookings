			<nav class="navbar">
			  <div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="brand" href="#">Navigation</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<?php 
								$navigation = array (
									"New booking" => "add/node/18",
									"View all diners" => "view/15",
									"View diner status" => "view/16"
								);
								foreach ($navigation as $name => $url){
									$urlSegments = explode('/', $url);
									if (!isset($urlSegments[1])){
										$urlSegments[1] = "";
									} ?>
									<li <?php 
									if (($this->uri->segment(1) == $urlSegments[0])&&($this->uri->segment(2) == $urlSegments[1])){
										echo 'class="active"';
									} ?>>
										<a href="<?php echo site_url($url); ?>"><?php echo $name ?></a>
									</li>
									<?php
								}
							?>
						</ul>
					</div>
				</div>
			  </div>
			</nav>