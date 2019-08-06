<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import ="java.io.File" %>
<!DOCTYPE html>
<html>
  <head>
  <script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="http://www.amcharts.com/lib/3/gauge.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="http://www.amcharts.com/lib/3/pie.js"></script>

  <style>
#chartdiv {
	width	: 100%;
	height	: 400px;
	font-size : 13px;
}				
#chartdiv2 {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}																										
</style>
    <meta charset="UTF-8">
    <title>Utilization Analysis</title>
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
			<a href="ProA_Main.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>ProA-</b>Home</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>ProA_</b>Home</span>
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
										HUFS_IME - Web Developer <small>JSP Class_Project</small>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<div>User By IME Students</div>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">

									<div class="pull-right">
										<a href="ProA_Login.jsp" class="btn btn-default btn-flat">Sign
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
						<img src="dist/img/hufs.jpg" class="img-circle" alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>HUFS_IME</p>
					</div>
				</div>

				<!-- search form -->
				<form method="post" class="sidebar-form">
					<div class="input-group">
						<span> <input type="file" name="file" class="btn btn-flat"
							placeholder="Search..." />
							<button type='submit' name='search' value="submit"
								class="btn btn-flat" onclick="form.action='ProA_setZero.jsp';" >
							<%
								///////////////////////////////file name/////////////////////////////////
							%> <i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>

				<!-- /.search form -->


				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">ProA_Menu</li>
					<li class="active treeview"><a href="ProA_Main.jsp"> <i
							class="fa fa-dashboard"></i> <span>ProA_Home</span>
					</a></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>ProA_Analysis</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="ProA_AnalysisData.jsp">
							<i	class="fa fa-circle-o"></i> Analysis Data </a></li>
							<li><a href="ProA_Timeline.jsp"><i
									class="fa fa-circle-o"></i> TimeLine Analysis</a></li>
							<li><a href="ProA_Utilization.jsp"><i
									class="fa fa-circle-o"></i> Utilization Analysis</a></li>
							<li><a href="ProA_Pattern.jsp"><i class="fa fa-circle-o"></i>
									Pattern Analysis</a></li>
							<li><a href="ProA_Sequence.jsp"><i
									class="fa fa-circle-o"></i> Sequence Analaysis</a></li>
						</ul></li>
						
					 <li class="treeview">
             		 <a href="#">
                <i class="fa fa-pie-chart"></i> <span>Data</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Original Data <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="#"><i class="fa fa-circle-o"></i> Data Table </a>
                    </li>
                  </ul>
                </li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Filter Data <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="#"><i class="fa fa-circle-o"></i> Data Table </a>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
					
					<li><a href="ProA_calendar.jsp"> <i class="fa fa-calendar"></i>
							<span>ProA_Calendar</span>
					</a></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Utilization Analysis
            <small></small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="MPAS_Main.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
            <li>MPAS_Analysis</li>
            <li class ="active"><a href="MPAS_Timeline.jsp">Utilization</a></li>
         
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-6">
              <!-- AREA CHART -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Detail Utilization Information</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                         <li><a href="MPAS_setNumOne.jsp">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="MPAS_setNumTwo.jsp">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                
                <!-- /////////////////////////////////////////// -->
                  Input the Activity that you want to Check Detail ! 
		<form method="post" action ="MPAS_Utilization.jsp">
			<input type="text" name = "actname"/>
			<input type="submit" name ="Submit" value ="Submit" />
		</form>
		<!-- Start of New Item Description -->
		<%
	String actname = request.getParameter("actname");
		float worktime = 0;
		float totaltime =0;
		float utilization =0;
	if(actname!=null){
	StringBuffer data3 = new StringBuffer();
	StringBuffer data = new StringBuffer();
	
	data3.append('[').append("'Activity'").append(',')
	.append("'Value'").append(']');
	data3.append(',').append('[').append("'").append(actname).append("'").append(',').append(utilization).append(']');
	//System.out.println(data3);
	
		data.append("[").append("'").append("Task").append("'").append(",").append("'").append("Spent Time").append("'").append("]").append(",")
		.append("[").append("'").append("WorkTime").append("'").append(",").append("").append("]").append(",")
		.append("[").append("'").append("TotalTime").append("'").append(",").append("").append("]");
		
	%>
        
        <div id="chartdiv"></div>	  
        
       <script type="text/javascript">     
        var gaugeChart = AmCharts.makeChart( "chartdiv", {
		  "type": "gauge",
		  "theme": "light",
		  "path": "http://www.amcharts.com/lib/3/",
		  "axes": [ {
		    "axisThickness": 1,
		    "axisAlpha": 0.2,
		    "tickAlpha": 0.2,
		    "valueInterval": 20,
		    "bands": [ {
		      "color": "#84b761",
		      "endValue": 20,
		      "startValue": 0
		    }, {
		      "color": "#fdd400",
		      "endValue": 50,
		      "startValue": 20
		    }, {
		      "color": "#cc4748",
		      "endValue": 70,
		      "innerRadius": "95%",
		      "startValue": 20
		    } ],
		    "bottomText": "0 km/h",
		    "bottomTextYOffset": -20,
		    "endValue": 100
		  } ],
		  "arrows": [ {} ],
		  "export": {
		    "enabled": true
		  }
		} );

		setInterval( randomValue, 1000 );

		// set random value
		function randomValue() {
		  var value = <%=utilization*100%>;
		  if ( gaugeChart ) {
		    if ( gaugeChart.arrows ) {
		      if ( gaugeChart.arrows[ 0 ] ) {
		        if ( gaugeChart.arrows[ 0 ].setValue ) {
		          gaugeChart.arrows[ 0 ].setValue( value );
		          gaugeChart.axes[ 0 ].setBottomText( value + " %" );
		        }
		      }
		    }
		  }
		}
		<%
		data3.delete(0, data3.length());
		data.delete(0, data.length());
		}%>
</script>
                <!-- /////////////////////////////////////////// -->
                </div><!-- /.box-body -->
              </div><!-- /.box -->

              <!-- DONUT CHART -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">System's Recommendation</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                         <li><a href="MPAS_setNumOne.jsp">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="MPAS_setNumTwo.jsp">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                
               <%if(actname!=null){ %>
                <h3 class="box-title"><%=actname%>'s Utilization rate is <%=utilization*100%>%</h3>
                
                <%
                if(utilization*100>45){%>
                <strong><h1>-> <%=actname%> Activity has High probability <BR>  to be BottleNeck Operation.</h1></strong>	
                <%}
                else if(utilization*100>20){%>
  			    <strong><h1>-> <%=actname%> Activity has Some probability <BR>  to be BottleNeck Operation.</h1></strong>	
                 <%}
                else{%>
				<strong><h1>-> <%=actname%> Activity has Low probability <BR>  to be BottleNeck Operation.</h1></strong>	
                 <%}%>
                 <%}
                 else{%>
                 <br><br>
                 <%} %>
		               
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            </div><!-- /.col (LEFT) -->
            <div class="col-md-6">
              <!-- LINE CHART -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Detail Time Information</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                       <li><a href="MPAS_setNumOne.jsp">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="MPAS_setNumTwo.jsp">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                  
	    <script>
	    var chart = AmCharts.makeChart( "chartdiv2", {
	    	  "type": "pie",
	    	  "theme": "light",
	    	  "path":"http://www.amcharts.com/lib/3/",
	    	  "dataProvider": [ {
	    	    "title": "WorkTime",
	    	    "value": <%=worktime%>
	    	  }, {
	    	    "title": "TotalTime",
	    	    "value": <%=totaltime%>
	    	  } ],
	    	  "titleField": "title",
	    	  "valueField": "value",
	    	  "labelRadius": 5,

	    	  "radius": "42%",
	    	  "innerRadius": "60%",
	    	  "labelText": "[[title]]",
	    	  "export": {
	    	    "enabled": true
	    	  }
	    	} );
	    </script> 
	    <%if(actname!=null){ %>
	    <h3 class="box-title"><%=actname%>'s WorkTime  :<%=worktime%> Seconds</h3>
        <h3 class="box-title"><%=actname%>'s TotalTime :<%=totaltime%> Seconds</h3><br><br>
	    
	    <div id="chartdiv2"></div><%} %>	<br><br>										 
                 
                </div><!-- /.box-body -->
              </div><!-- /.box -->

              

            </div><!-- /.col (RIGHT) -->
          </div><!-- /.row -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
 
      
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