<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.File"%>
<%@ page import ="Run.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="http://www.amcharts.com/lib/3/pie.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="http://www.amcharts.com/lib/3/serial.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/patterns.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
#chartdiv7 {
	width: 100%;
	height: 178px;
	font-size: 11px;
}

#chartdiv8 {
	width: 100%;
	height: 178px;
	font-size: 11px;
}

#chartdiv6 {
	width: 100%;
	height: 178px;
	font-size: 11px;
}
</style>
<style>
#chartdiv {
	width: 100%;
	height: 500px;
	font-size: 11px;
}
</style>
<style>
#chartdiv5 {
	width: 100%;
	height: 400px;
}
</style>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />


<title>ProA_Process | Main</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- DATA TABLES -->
<link href="plugins/datatables/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<!-- Bootstrap 3.3.4 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- FontAwesome 4.3.0 -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons 2.0.0 -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css" />
<!-- iCheck -->
<link href="plugins/iCheck/flat/blue.css" rel="stylesheet"
	type="text/css" />
<!-- Morris chart -->
<link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Date Picker -->
<link href="plugins/datepicke
    r/datepicker3.css" rel="stylesheet"
	type="text/css" />
<!-- Daterange picker -->
<link href="plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />

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
								class="btn btn-flat" onclick="form.action='ProA_setProASession.jsp';" />
							<%
							ProA p = (ProA)session.getAttribute("ProA");
							
							if(session.getAttribute("filename")!=null)
							{
								//System.out.println("first   :"+p.getsome());
							}
							
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
                  <a href="ProA_OriginalTable.jsp"><i class="fa fa-circle-o"></i> Original Data <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="ProA_OriginalTable.jsp"><i class="fa fa-circle-o"></i> Data Table </a>
                    </li>
                  </ul>
                </li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Filter Data <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="ProA_FilterTable.jsp"><i class="fa fa-circle-o"></i> Data Table </a>
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
					Dashboard <small>Version 2.0</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row">
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
							
								<h3><%=p.getContantsSize() %></h3>
								<p>Contants</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>
									<%=p.getCaseSize() %>
								</h3>
								<p>Case</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3><%=p.getActivitySize() %></h3>
								<p>Activity</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3><%=p.getResourceSize() %></h3>
								<p>Resource</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">Monthly Recap Report</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<div class="btn-group">
										<button class="btn btn-box-tool dropdown-toggle"
											data-toggle="dropdown">
											<i class="fa fa-wrench"></i>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
										</ul>
									</div>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="row">
									<div class="col-md-12">
										<p class="text-center">
											<strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
										</p>
										<div class="chart">
											<!-- Sales Chart Canvas -->
											<canvas id="salesChart" style="height: 180px;"></canvas>
										</div>
										<!-- /.chart-responsive -->
									</div>
								</div>
								<!-- /.row -->
							</div>
							<!-- ./box-body -->
							<div class="box-footer">
								<div class="row">
									<div class="col-sm-4 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-green"><i
												class="fa fa-caret-up"></i> 17%</span>
											<h5 class="description-header">$35,210.43</h5>
											<span class="description-text">TOTAL REVENUE</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-4 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-yellow"><i
												class="fa fa-caret-left"></i> 0%</span>
											<h5 class="description-header">$10,390.90</h5>
											<span class="description-text">TOTAL COST</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-4 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-green"><i
												class="fa fa-caret-up"></i> 20%</span>
											<h5 class="description-header">$24,813.53</h5>
											<span class="description-text">TOTAL PROFIT</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<div class="col-md-8">
						<!-- MAP & BOX PANE -->
						<!-- /.box -->
						<div class="row">
							<div class="col-md-12">
								<!-- DIRECT CHAT -->
								<div class="box box-warning direct-chat direct-chat-warning">
									<div class="box-header with-border">
										<h3 class="box-title">Direct Chat</h3>
										<div class="box-tools pull-right">
											<button class="btn btn-box-tool" data-widget="collapse">
												<i class="fa fa-minus"></i>
											</button>
											<button class="btn btn-box-tool" data-toggle="tooltip"
												title="Contacts" data-widget="chat-pane-toggle">
												<i class="fa fa-comments"></i>
											</button>
											<button class="btn btn-box-tool" data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<!-- Conversations are loaded here -->
										<div class="direct-chat-messages">
										<p><%p.getActToActMap(); %>										 </p>
										 <p><%p.getsome(); %></p>

										</div>
										<!--/.direct-chat-messages-->

										<!-- /.direct-chat-pane -->
									</div>
									<!-- /.box-body -->
									<div class="box-footer">
										<form action="#" method="post">
											<div class="input-group">
												<input type="text" name="message"
													placeholder="Type Message ..." class="form-control">
												<span class="input-group-btn">
													<button type="button" class="btn btn-warning btn-flat">Send</button>
												</span>
											</div>
										</form>
									</div>
									<!-- /.box-footer-->
								</div>
								<!--/.direct-chat -->
							</div>
							<!-- /.col -->


							<!-- /.col -->
						</div>
						<!-- /.row -->

						<!-- TABLE: LATEST ORDERS -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Latest Orders</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>Order ID</th>
												<th>Item</th>
												<th>Status</th>
												<th>Popularity</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="pages/examples/invoice.html">OR9842</a></td>
												<td>Call of Duty IV</td>
												<td><span class="label label-success">Shipped</span></td>
												<td><div class="sparkbar" data-color="#00a65a"
														data-height="20">90,80,90,-70,61,-83,63</div></td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR1848</a></td>
												<td>Samsung Smart TV</td>
												<td><span class="label label-warning">Pending</span></td>
												<td><div class="sparkbar" data-color="#f39c12"
														data-height="20">90,80,-90,70,61,-83,68</div></td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR7429</a></td>
												<td>iPhone 6 Plus</td>
												<td><span class="label label-danger">Delivered</span></td>
												<td><div class="sparkbar" data-color="#f56954"
														data-height="20">90,-80,90,70,-61,83,63</div></td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR7429</a></td>
												<td>Samsung Smart TV</td>
												<td><span class="label label-info">Processing</span></td>
												<td><div class="sparkbar" data-color="#00c0ef"
														data-height="20">90,80,-90,70,-61,83,63</div></td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR1848</a></td>
												<td>Samsung Smart TV</td>
												<td><span class="label label-warning">Pending</span></td>
												<td><div class="sparkbar" data-color="#f39c12"
														data-height="20">90,80,-90,70,61,-83,68</div></td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR7429</a></td>
												<td>iPhone 6 Plus</td>
												<td><span class="label label-danger">Delivered</span></td>
												<td><div class="sparkbar" data-color="#f56954"
														data-height="20">90,-80,90,70,-61,83,63</div></td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR9842</a></td>
												<td>Call of Duty IV</td>
												<td><span class="label label-success">Shipped</span></td>
												<td><div class="sparkbar" data-color="#00a65a"
														data-height="20">90,80,90,-70,61,-83,63</div></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<a href="javascript::;"
									class="btn btn-sm btn-info btn-flat pull-left">Place New
									Order</a> <a href="javascript::;"
									class="btn btn-sm btn-default btn-flat pull-right">View All
									Orders</a>
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->

					<div class="col-md-4">
						<!-- Info Boxes Style 2 -->
						<div class="info-box bg-yellow">
							<span class="info-box-icon"><i
								class="ion ion-ios-pricetag-outline"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Inventory</span> <span
									class="info-box-number">5,200</span>
								<div class="progress">
									<div class="progress-bar" style="width: 50%"></div>
								</div>
								<span class="progress-description"> 50% Increase in 30
									Days </span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
						<div class="info-box bg-green">
							<span class="info-box-icon"><i
								class="ion ion-ios-heart-outline"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Mentions</span> <span
									class="info-box-number">92,050</span>
								<div class="progress">
									<div class="progress-bar" style="width: 20%"></div>
								</div>
								<span class="progress-description"> 20% Increase in 30
									Days </span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
						<div class="info-box bg-red">
							<span class="info-box-icon"><i
								class="ion ion-ios-cloud-download-outline"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Downloads</span> <span
									class="info-box-number">114,381</span>
								<div class="progress">
									<div class="progress-bar" style="width: 70%"></div>
								</div>
								<span class="progress-description"> 70% Increase in 30
									Days </span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
						<div class="info-box bg-aqua">
							<span class="info-box-icon"><i
								class="ion-ios-chatbubble-outline"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Direct Messages</span> <span
									class="info-box-number">163,921</span>
								<div class="progress">
									<div class="progress-bar" style="width: 40%"></div>
								</div>
								<span class="progress-description"> 40% Increase in 30
									Days </span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->

						<div class="box box-default">
							<div class="box-header with-border">
								<h3 class="box-title">Browser Usage</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="row">
									<div class="col-md-8">
										<div class="chart-responsive">
											<canvas id="pieChart" height="150"></canvas>
										</div>
										<!-- ./chart-responsive -->
									</div>
									<!-- /.col -->
									<div class="col-md-4">
										<ul class="chart-legend clearfix">
											<li><i class="fa fa-circle-o text-red"></i> Chrome</li>
											<li><i class="fa fa-circle-o text-green"></i> IE</li>
											<li><i class="fa fa-circle-o text-yellow"></i> FireFox</li>
											<li><i class="fa fa-circle-o text-aqua"></i> Safari</li>
											<li><i class="fa fa-circle-o text-light-blue"></i> Opera</li>
											<li><i class="fa fa-circle-o text-gray"></i> Navigator</li>
										</ul>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer no-padding">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#">United States of America <span
											class="pull-right text-red"><i
												class="fa fa-angle-down"></i> 12%</span></a></li>
									<li><a href="#">India <span
											class="pull-right text-green"><i
												class="fa fa-angle-up"></i> 4%</span></a></li>
									<li><a href="#">China <span
											class="pull-right text-yellow"><i
												class="fa fa-angle-left"></i> 0%</span></a></li>
								</ul>
							</div>
							<!-- /.footer -->
						</div>
						<!-- /.box -->

						<!-- PRODUCT LIST -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Recently Added Products</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<ul class="products-list product-list-in-box">
									<li class="item">
										<div class="product-img">
											<img src="dist/img/default-50x50.gif" alt="Product Image">
										</div>
										<div class="product-info">
											<a href="javascript::;" class="product-title">Samsung TV
												<span class="label label-warning pull-right">$1800</span>
											</a> <span class="product-description"> Samsung 32" 1080p
												60Hz LED Smart HDTV. </span>
										</div>
									</li>
									<!-- /.item -->
									<li class="item">
										<div class="product-img">
											<img src="dist/img/default-50x50.gif" alt="Product Image">
										</div>
										<div class="product-info">
											<a href="javascript::;" class="product-title">Bicycle <span
												class="label label-info pull-right">$700</span></a> <span
												class="product-description"> 26" Mongoose Dolomite
												Men's 7-speed, Navy Blue. </span>
										</div>
									</li>
									<!-- /.item -->
									<li class="item">
										<div class="product-img">
											<img src="dist/img/default-50x50.gif" alt="Product Image">
										</div>
										<div class="product-info">
											<a href="javascript::;" class="product-title">Xbox One <span
												class="label label-danger pull-right">$350</span></a> <span
												class="product-description"> Xbox One Console Bundle
												with Halo Master Chief Collection. </span>
										</div>
									</li>
									<!-- /.item -->
									<li class="item">
										<div class="product-img">
											<img src="dist/img/default-50x50.gif" alt="Product Image">
										</div>
										<div class="product-info">
											<a href="javascript::;" class="product-title">PlayStation
												4 <span class="label label-success pull-right">$399</span>
											</a> <span class="product-description"> PlayStation 4
												500GB Console (PS4) </span>
										</div>
									</li>
									<!-- /.item -->
								</ul>
							</div>
							<!-- /.box-body -->
							<div class="box-footer text-center">
								<a href="javascript::;" class="uppercase">View All Products</a>
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-user bg-yellow"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>
									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>
									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>
									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span
										class="label label-warning pull-right">50%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->

				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>
						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>
							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked>
							</label>
							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked>
							</label>
							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right">
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript::;" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.1.4 -->
	<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="plugins/chartjs/Chart.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dist/js/pages/dashboard2.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
</body>
</html>
