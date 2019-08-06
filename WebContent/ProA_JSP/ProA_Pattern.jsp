<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.util.*" %>
        <%@ page import ="java.io.File" %>
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
	height		: 500px;
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
								class="btn btn-flat" onclick="form.action='ProA_setZero.jsp';" />
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
            Pattern Analysis
            <small></small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="MPAS_Main.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
            <li>MPAS_Analysis</li>
            <li class ="active"><a href="MPAS_Timeline.jsp">Pattern Analysis</a></li>
         
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-12">
              <!-- AREA CHART -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Detail Pattern Information</h3>
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
                  <!--/////////////////////////////  -->
                  Input the Pattern Number that you want to Check Detail ! 
		<form method="post" action ="MPAS_Pattern.jsp">
			<input type="text" name = "casname"/>
			<input type="submit" name ="Submit" value ="Submit" />
		</form>
                  <%
//jbean.setPattern();
//jbean.PatternDo();
String casname2 = request.getParameter("casname");
if(casname2!=null){
ArrayList<Float> actdiff = new ArrayList<Float>();
ArrayList<String> act = new ArrayList<String>();
ArrayList<String> cas = new ArrayList<String>();

StringBuffer data3 = new StringBuffer();
actdiff = null;//jbean.getpatterndiff();
act = null;//jbean.getProcessAct();
cas = null;//jbean.getProcesscas();

String caseid = cas.get(0); 
float totime = 0;
for(int i=0;i<cas.size();i++){

	if(cas.get(i).equals(casname2)){
		
		
		float diff = actdiff.get(i);
			totime +=diff;
data3.append("{").append('"').append("Activity").append('"').append(":").append('"').append(act.get(i)).append('"').append(",")
.append('"').append("Processing Time").append('"').append(":").append(actdiff.get(i)).append(",")
.append('"').append("Total Process Time").append('"').append(":").append(String.valueOf(totime)).append("}").append(",");
}
	
	
}
data3.deleteCharAt(data3.lastIndexOf(","));
data3.deleteCharAt(data3.lastIndexOf("}"));

data3.append(",").append('"').append("dashLengthColumn").append('"').append(":").append(5).append(",")
.append('"').append("alpha").append('"').append(":").append(0.2).append(",")
.append('"').append("additional").append('"').append(":").append('"').append("(projection)").append('"').append("}");


%>
<script>
var chart = AmCharts.makeChart("chartdiv3", {
	  "type": "serial",
	  "addClassNames": true,
	  "theme": "light",
	  "path": "http://www.amcharts.com/lib/3/",
	  "autoMargins": false,
	  "marginLeft": 30,
	  "marginRight": 8,
	  "marginTop": 10,
	  "marginBottom": 26,
	  "balloon": {
	    "adjustBorderColor": false,
	    "horizontalPadding": 10,
	    "verticalPadding": 8,
	    "color": "#ffffff"
	  },

	  "dataProvider": [<%=data3%>],
	  "valueAxes": [{
	    "axisAlpha": 0,
	    "position": "left"
	  }],
	  "startDuration": 1,
	  "graphs": [{
	    "alphaField": "alpha",
	    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
	    "fillAlphas": 1,
	    "title": "Processing Time",
	    "type": "column",
	    "valueField": "Processing Time",
	    "dashLengthField": "dashLengthColumn"
	  }, {
	    "id": "graph2",
	    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
	    "bullet": "round",
	    "lineThickness": 3,
	    "bulletSize": 7,
	    "bulletBorderAlpha": 1,
	    "bulletColor": "#FFFFFF",
	    "useLineColorForBulletBorder": true,
	    "bulletBorderThickness": 3,
	    "fillAlphas": 0,
	    "lineAlpha": 1,
	    "title": "Total Process Time",
	    "valueField": "Total Process Time"
	  }],
	  "categoryField": "Activity",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "axisAlpha": 0,
	    "tickLength": 0
	  },
	  "export": {
	    "enabled": true
	  }
	});
	</script>
<div id="chartdiv3"></div>
<%} else{%>

<br><br><br><br><br><br><br><br><br><br><br><br><br>
<%} %>
                  <!--/////////////////////////////  -->
                </div><!-- /.box-body -->
              </div><!-- /.box -->
<!-- 
              DONUT CHART
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">Pattern's Total Processing Time</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                 	
                  
                     
                </div>/.box-body
              </div>/.box
 -->
            </div><!-- /.col (LEFT) -->
            <div class="row">
            <div class="col-md-12">
              <!-- LINE CHART -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Pattern's Total Processing Time</h3>
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
                  <!-- ///////////////////////////-->
                  
                                    <%


ArrayList<String> Pattern = new ArrayList<String>();
ArrayList<String> Patterntime = new ArrayList<String>();
StringBuffer data = new StringBuffer();
Pattern=null;//jbean.getPattern();
Patterntime=null;//jbean.getpatterntime();
/* {"name": "John","points": 35654}, {"name": "Damon","points": 65456},
   {"name": "Mark","points": 13654,"color": "#DAF0FD"} */
for(int i=0;i<Pattern.size();i++){
	data.append("{").append('"').append("name").append('"').append(":").append('"').append(Pattern.get(i).substring(0, 8)).append('"').append(",")
	.append('"').append("points").append('"').append(":").append(Patterntime.get(i)).append("}").append(",");
	}
	data.deleteCharAt(data.lastIndexOf(","));
	
%>
               <script>						
var chart = AmCharts.makeChart("chartdiv",
		{
		    "type": "serial",
			"theme": "light",
		    "path": "http://www.amcharts.com/lib/3/",
		    "dataProvider": [
		                     <%=data%>
		                     ],
		    "valueAxes": [{
		        "maximum": 2000000,
		        "minimum": 0,
		        "axisAlpha": 0,
		        "dashLength": 4,
		        "position": "left"
		    }],
		    "startDuration": 1,
		    "graphs": [{
		        "balloonText": "<span style='font-size:13px;'>[[category]]: <b>[[value]]</b></span>",
		        "bulletOffset": 16,
		        "bulletSize": 34,
		        "colorField": "color",
		        "cornerRadiusTop": 8,
		        "customBulletField": "bullet",
		        "fillAlphas": 0.8,
		        "lineAlpha": 0,
		        "type": "column",
		        "valueField": "points"
		    }],
		    "marginTop": 0,
		    "marginRight": 0,
		    "marginLeft": 0,
		    "marginBottom": 0,
		    "autoMargins": false,
		    "categoryField": "name",
		    "categoryAxis": {
		        "axisAlpha": 0,
		        "gridAlpha": 0,
		        "inside": true,
		        "tickLength": 0
		    },
		    "export": {
		    	"enabled": true
		     }
		});
		</script>   
                  <div id="chartdiv"></div>	
                  
                   <!-- ///////////////////////////-->
                   
                </div><!-- /.box-body -->
              </div><!-- /.box -->

              <!-- BAR CHART -->
              <div class="col-md-12">
              <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Pattern's Quantity</h3>
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
                  <!--//////////////////////////  -->
                  
                  <%


ArrayList<String> Pattern2 = new ArrayList<String>();
StringBuffer data2 = new StringBuffer();
Pattern2=null;//jbean.getPattern();
/* {"name": "John","points": 35654}, {"name": "Damon","points": 65456},
   {"name": "Mark","points": 13654,"color": "#DAF0FD"} */
for(int i=0;i<Pattern2.size();i++){
	data2.append("{").append('"').append("name").append('"').append(":").append('"').append(Pattern2.get(i).substring(0, 8)).append('"').append(",")
	.append('"').append("points").append('"').append(":").append(1).append("}").append(",");
	}
	data2.deleteCharAt(data2.lastIndexOf(","));

%>
<script>
var chart = AmCharts.makeChart( "chartdiv2", {
	  "type": "pie",
	  "theme": "light",
	  "path": "http://www.amcharts.com/lib/3/",
	  "legend": {
	    "markerType": "circle",
	    "position": "right",
	    "marginRight": 80,
	    "autoMargins": false
	  },
	  "dataProvider": [
	                   <%=data2%>
	                   ],
	  "valueField": "points",
	  "titleField": "name",
	  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
	  "export": {
	    "enabled": true
	  }
	} );
	
	
	
	
</script>
<div id="chartdiv2"></div>
<%
                  %>
                  </div>
                  <!--///////////////////////////  -->
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
