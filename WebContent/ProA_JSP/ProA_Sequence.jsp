<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import ="java.io.File" %>
       <%@ page import ="java.util.*" %>
       <%@ page import ="java.text.*" %>
    <%@ page import ="Run.*" %>

     
<!DOCTYPE html>
<html>
  <head>
<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="http://www.amcharts.com/lib/3/serial.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>

<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="http://www.amcharts.com/lib/3/serial.js"></script>
<script src="http://www.amcharts.com/lib/3/pie.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/dark.js"></script>

<style>
#chartdiv {
	width	: 100%;
	height	: 300px;
}
#chartdiv2 {
	width	: 100%;
	height	: 300px;
	font-size	: 11px;
}					
#chartdiv3 {
	width		: 100%;
	height		: 300px;
	font-size	: 11px;
}			
</style>
    <meta charset="UTF-8">
    <title>Pattern Analysis</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	<!-- iCheck -->
    <link href="plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="skin-blue sidebar-mini">
    <div class="wrapper">

     <header class="main-header">
			<!-- Logo -->
			<a href="ProAs_Main.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>ProAs-</b>Home</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>ProAs_</b>Home</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">

					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="dist/img/hufs.jpg" class="user-image" alt="User Image" />
								<span class="hidden-xs">HUFS_IME</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img src="dist/img/hufs.jpg"
									class="img-circle" alt="User Image" />
									<p>
										HUFS_IME - I am E <small>DataMining_Project</small>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<div>User By IME Students</div>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">

									<div class="pull-right">
										<a href="ProAs_Start.jsp" class="btn btn-default btn-flat">Sign
											out</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
					</ul>
				</div>
			</nav>
		</header>


		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="dist/img/IamE.jpg" />
					</div>
				
				</div>

	


				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">ProAs_Menu</li>
					<li><a href="ProAs_Main.jsp"><i class="fa fa-dashboard"></i> <span>ProAs_Home</span></a></li>
					<li><a href="ProAs_BasicAnalysis.jsp"><i class="fa fa-book"></i> <span>Basic Analysis</span></a></li>
					<li><a href="ProAs_Timeline.jsp"><i class="fa fa-book"></i> <span>TimeLine Analysis</span></a></li>
					<li><a href="ProAs_Utilization.jsp"><i class="fa fa-book"></i> <span>Utilization Analysis</span></a></li>
					<li><a href="ProAs_Pattern.jsp"><i class="fa fa-book"></i> <span>Pattern Analysis</span></a></li>
					<li><a href="ProAs_Sequence.jsp"><i class="fa fa-book"></i> <span>Log Replay</span></a></li>
					 <li class="treeview">
             		 <a href="#">
                <i class="fa fa-pie-chart"></i> <span>Data Type</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li>
                  <a href="ProAs_OriginalTable.jsp"><i class="fa fa-circle-o"></i> Original Data <i class="fa fa-angle-left pull-right"></i></a>
                  <a href="ProAs_OriginalTable.jsp"><i class="fa fa-circle-o"></i> LogReplay Data </a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="ProAs_OriginalTable.jsp"><i class="fa fa-circle-o"></i> Data Table </a>
                    </li>
                  </ul>
                </li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Filter Data <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="ProAs_FilterTable.jsp"><i class="fa fa-circle-o"></i> Data Table </a>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Log Replay
            <small></small>
          </h1>
          
          
          
           File name : <%=session.getAttribute("filename") %>
           
        
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="./realTest/dagre-d3.js"></script>

<style>

  body {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serf;
    background: #999;
  }


  @-webkit-keyframes flash {
    0%, 50%, 100% {
      opacity: 1;
    }

    25%, 75% {
      opacity: 0.2;
    }
  }

  @keyframes flash {
    0%, 50%, 100% {
      opacity: 1;
    }

    25%, 75% {
      opacity: 0.2;
    }
  }

  .warn {
    -webkit-animation-duration: 5s;
    animation-duration: 5s;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
    -webkit-animation-iteration-count: 1;
    animation-iteration-count: 1;
  }

  .live.map {
    width: 100%;
    height: 100%;
  }

  svg {
    width: 100%;
    height: 100%;
    overflow: hidden;
  }

  .live.map text {
    font-weight: 300;
    font-size: 14px;
  }

  .live.map .node rect {
    stroke-width: 1.5px;
    stroke: #bbb;
    fill: #666;
  }

  .live.map .status {
    height: 100%;
    width: 15px;
    display: block;
    float: left;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    margin-right: 4px;
  }

  .live.map .running .status {
    background-color: #7f7;
  }

  .live.map .running.warn .status {
    background-color: #ffed68;
  }

  .live.map .stopped .status {
    background-color: #f77;
  }

  .live.map .warn .queue {
    color: #f77;
  }

  .warn {
    -webkit-animation-name: flash;
    animation-name: flash;
  }

  .live.map .consumers {
    margin-right: 2px;
  }

  .live.map .consumers,
  .live.map .name {
    margin-top: 4px;
  }

  .live.map .consumers:after {
    content: "x";
  }

  .live.map .queue {
    display: block;
    float: left;
    width: 130px;
    height: 20px;
    font-size: 12px;
    margin-top: 2px;
  }

  .live.map .node g div {
    width: 200px;
    height: 40px;
    color: #fff;
  }

  .live.map .node g div span.consumers {
    display: inline-block;
    width: 20px;
  }

  .live.map .edgeLabel text {
    width: 50px;
    fill: #000;
  }

  .live.map .edgePath path {
    stroke: #000;
    stroke-width: 1.5px;
    fill: #999;
  }
</style>



<!-- ending -->




</HEAD> 
<BODY> 







<!--  starting again -->

<div class="live map">
  <svg><g/></svg>
</div>

<script>

  var workers = 
	 /*  {"Achieve order":{"inputQueue":"Receive payment","inputThroughput":1,"count":1,"consumers":2},"Check Stock Availabi":{"inputQueue":"Check Stock Availabi","inputThroughput":8,"count":8,"consumers":2},"Get shipment address":{"inputQueue":"Receive payment","inputThroughput":1,"count":3,"consumers":2},"Retrieve product fro":{"inputQueue":"Retrieve product fro","inputThroughput":7,"count":7,"consumers":2},"Confirm order":{"inputQueue":"Confirm order","inputThroughput":2,"count":3,"consumers":2},"Receive payment":{"inputQueue":"Receive payment","inputThroughput":1,"count":3,"consumers":2},"Request raw material":{"inputQueue":"Request raw material","inputThroughput":1,"count":1,"consumers":2},"Check raw materials ":{"inputQueue":"Check Stock Availabi","inputThroughput":9,"count":9,"consumers":2},"Emit invoice":{"inputQueue":"Confirm order","inputThroughput":2,"count":3,"consumers":2},"Ship product":{"inputQueue":"Get shipment address","inputThroughput":1,"count":2,"consumers":2},"Obtain raw materials":{"inputQueue":"Request raw material","inputThroughput":1,"count":1,"consumers":2}}
   */
    
   {
    "identifier": {
      "consumers": 2,
      "count": 20
    },
    "lost-and-found": {
      "consumers": 1,
      "count": 1,
      "inputQueue": ["identifier"],
      "inputThroughput": [50]
    },
    "monitor": {
      "consumers": 1,
      "count": 0,
      "inputQueue": ["identifier"],
      "inputThroughput": [50]
    },
    "meta-enricher": {
      "consumers": 4,
      "count": 9900,
      "inputQueue": ["identifier"],
      "inputThroughput": [50]
    },
    "geo-enricher": {
      "consumers": 2,
      "count": 1,
      "inputQueue": ["meta-enricher","identifier"],
      "inputThroughput": [50,25]
    },
    
        "elasticsearch-writer": {
      "consumers": 0,
      "count": 9900,
      "inputQueue": ["geo-enricher"],
      "inputThroughput": [50]
    }
  }; 

  // Set up zoom support
  var svg = d3.select("svg"),
      inner = svg.select("g"),
      zoom = d3.behavior.zoom().on("zoom", function() {
        inner.attr("transform", "translate(" + d3.event.translate + ")" +
                                    "scale(" + d3.event.scale + ")");
      });
  svg.call(zoom);

  var render = new dagreD3.render();

  // Left-to-right layout
  var g = new dagreD3.graphlib.Graph();
  g.setGraph({
    nodesep: 70,
    ranksep: 50,
    rankdir: "LR",
    marginx: 20,
    marginy: 20
  });

  function draw(isUpdate) {
	  console.log(workers);
    for (var id in workers) {
      console.log(id); 	
      var worker = workers[id];
      var className = worker.consumers ? "running" : "stopped";
      if (worker.count > 10000) {
        className += " warn";
      }
      var html = "<div>";
      html += "<span class=status></span>";
      html += "<span class=consumers>"+worker.consumers+"</span>";
      html += "<span class=name>"+id+"</span>";
      html += "<span class=queue><span class=counter>"+worker.count+"</span></span>";
      html += "</div>";
      g.setNode(id, {
        labelType: "html",
        label: html,
        rx: 5,
        ry: 5,
        padding: 0,
        class: className
      });
      if (worker.inputQueue) {
    	  for(i=0;i<worker.inputQueue.length;i++){
      			g.setEdge(worker.inputQueue[i], id, {
         		 label: worker.inputThroughput[i] ,
          		width: 50
        		});
           } 
      }
      /* if (worker.inputQueue) {
        g.setEdge(worker.inputQueue, id, {
          label: worker.inputThroughput + "/s",
          width: 50
        });
      } */
    }

    inner.call(render, g);

    // Zoom and scale to fit
    var zoomScale = zoom.scale();
    var graphWidth = g.graph().width + 50;
    var graphHeight = g.graph().height + 40;
    var width = parseInt(svg.style("width").replace(/px/, ""));
    var height = parseInt(svg.style("height").replace(/px/, ""));
    zoomScale = Math.min(width / graphWidth, height / graphHeight);
    var translate = [(width/2) - ((graphWidth*zoomScale)/2), (height/2) - ((graphHeight*zoomScale)/2)];
    zoom.translate(translate);
    zoom.scale(zoomScale);
    zoom.event(isUpdate ? svg.transition().duration(500) : d3.select("svg"));
  }

  // Do some mock queue status updates
  /* setInterval(function() {
    var stoppedWorker1Count = workers["elasticsearch-writer"].count;
    var stoppedWorker2Count = workers["meta-enricher"].count;
    for (var id in workers) {
      workers[id].count = Math.ceil(Math.random() * 3);
      if (workers[id].inputThroughput) workers[id].inputThroughput = Math.ceil(Math.random() * 250);
    }
    workers["elasticsearch-writer"].count = stoppedWorker1Count + Math.ceil(Math.random() * 100);
    workers["meta-enricher"].count = stoppedWorker2Count + Math.ceil(Math.random() * 100);
    draw(true);
  }, 1000);

  // Do a mock change of worker configuration
  setInterval(function() {
    workers["elasticsearch-monitor"] = {
      "consumers": 0,
      "count": 0,
      "inputQueue": "elasticsearch-writer",
      "inputThroughput": 50
    }
  }, 5000); */

  draw();
</script>
        
           
          <ol class="breadcrumb">
            <li><a href="ProAs_Main.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
            <li>ProAs_Analysis</li>
            <li class ="active"><a href="ProAs_Timeline.jsp">Log Replay</a></li>
         
          </ol>
        </section>

        <!-- Main content -->
      
 
      
      <!-- Control Sidebar -->      
      <aside class="control-sidebar control-sidebar-dark">                
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class='control-sidebar-menu'>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-user bg-yellow"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                    <p>New phone +1(800)555-1234</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                    <p>nora@example.com</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-file-code-o bg-green"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                    <p>Execution time 5 seconds</p>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3> 
            <ul class='control-sidebar-menu'>
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Custom Template Design
                    <span class="label label-danger pull-right">70%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Update Resume
                    <span class="label label-success pull-right">95%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Laravel Integration
                    <span class="label label-waring pull-right">50%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Back End Framework
                    <span class="label label-primary pull-right">68%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                  </div>                                    
                </a>
              </li>               
            </ul><!-- /.control-sidebar-menu -->         

          </div><!-- /.tab-pane -->
          <!-- Stats tab content -->
          <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
          <!-- Settings tab content -->
          <div class="tab-pane" id="control-sidebar-settings-tab">            
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Report panel usage
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Some information about this general settings option
                </p>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Allow mail redirect
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Other sets of options are available
                </p>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Expose author name in posts
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Allow the user to show his name in blog posts
                </p>
              </div><!-- /.form-group -->

              <h3 class="control-sidebar-heading">Chat Settings</h3>

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Show me as online
                  <input type="checkbox" class="pull-right" checked />
                </label>                
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Turn off notifications
                  <input type="checkbox" class="pull-right" />
                </label>                
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Delete chat history
                  <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                </label>                
              </div><!-- /.form-group -->
            </form>
          </div><!-- /.tab-pane -->
        </div>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
    <!-- page script -->

  </body>
</html>
