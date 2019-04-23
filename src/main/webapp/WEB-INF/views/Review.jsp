<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.IntelliTest.Database.ReportDatabase"%>
<%@page import="com.IntelliTest.Database.LeftPanelDatabase"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<title>IntelliTest</title>


<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css'>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.0.13/css/all.css'>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<div class="page-wrapper chiller-theme toggled">
		<a id="show-sidebar" class="btn btn-sm btn-dark" href="#"> <i
			class="fas fa-bars"></i>
		</a>
		<nav id="sidebar" class="sidebar-wrapper">
		<div class="sidebar-content">
			<div class="sidebar-brand">
				<a href="#">IntelliTest</a>
				<div id="close-sidebar">
					<i class="fas fa-times"></i>
				</div>
			</div>
			<div class="sidebar-header">
				<div class="user-pic">
					<img class="img-responsive img-rounded"
						src="http://www.sohocapitalmedan.com/images/sohocapitalmedan_06news/1501578764_user.jpg"
						alt="User picture">
				</div>
				<div class="user-info">
					<span class="user-name"> <strong>Harsh</strong>CEO
					</span> <span class="user-role">Administrator</span> <span
						class="user-status"> <i class="fa fa-circle"></i> <span>Busy</span>
					</span>
				</div>
			</div>
			<!-- sidebar-search  -->
			<div class="sidebar-menu">
				<ul>
					<li class="header-menu"><span>General</span></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-tachometer-alt"></i> <span>Dashboard</span> <span
							class="badge badge-pill badge-warning"> <%out.println(LeftPanelDatabase.getDashBoardCount());%>>
						</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">API Automation <span
										class="badge badge-pill badge-success"> <%out.println(LeftPanelDatabase.getAPICount());%>
									</span>
								</a></li>
								<li><a href="#">Web Automation <span
										class="badge badge-pill badge-success"> <%out.println(LeftPanelDatabase.getWebCount());%>
									</span></a></li>
								<li><a href="#">Mobile Automation <span
										class="badge badge-pill badge-success"> <%out.println(LeftPanelDatabase.getMobileCount());%>
									</span></a></li>
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-cogs"></i> <span>API</span> <span
							class="badge badge-pill badge-danger"> <%out.println(LeftPanelDatabase.getAPICount());%>
						</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">Add Test Case </a></li>
								<li><a href="#">Update Test Case</a></li>
								<li><a href="#">Delete Test Case</a></li>
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-desktop"></i> <span>Web</span> <span
							class="badge badge-pill badge-danger"> <%out.println(LeftPanelDatabase.getWebCount());%>
						</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">Add Test Case </a></li>
								<li><a href="#">Update Test Case</a></li>
								<li><a href="#">Delete Test Case</a></li>
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-mobile"></i> <span>Mobile</span> <span
							class="badge badge-pill badge-danger"> <%out.println(LeftPanelDatabase.getMobileCount());%>
						</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">Add Test Case </a></li>
								<li><a href="#">Update Test Case</a></li>
								<li><a href="#">Delete Test Case</a></li>
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-bug"></i> <span>Bugs</span> <span
							class="badge badge-pill badge-danger"> <%out.println(LeftPanelDatabase.getBugCount());%>
						</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">File Bug </a></li>
								<li><a href="#">Update Bug</a></li>
								<li><a href="#">Delete Bug</a></li>
							</ul>
						</div></li>
					<li class="header-menu"><span>Others</span></li>
					<li><a href="#"> <i class="fa fa-book"></i> <span>Reports</span>
							<span class="badge badge-pill badge-primary">Beta</span>
					</a></li>
					<li><a href="#"> <i class="fa fa-calendar"></i> <span>Review</span>
					</a></li>
				</ul>
			</div>
			<!-- sidebar-menu  -->
		</div>
		<!-- sidebar-content  -->
		<div class="sidebar-footer">
			<a href="#"> <i class="fa fa-bell"></i> <span
				class="badge badge-pill badge-warning notification">3</span>
			</a> <a href="#"> <i class="fa fa-envelope"></i> <span
				class="badge badge-pill badge-success notification">7</span>
			</a> <a href="#"> <i class="fa fa-cog"></i> <span class="badge-sonar"></span>
			</a> <a href="#"> <i class="fa fa-power-off"></i>
			</a>
		</div>
		</nav>
		<!-- sidebar-wrapper  -->
		<main class="page-content">
		<div class="container-tc">
		<%int totalTC = ReportDatabase.getTestCaseCount();
		if(totalTC>0){
		for(int i=0;i<totalTC;i++){%>
			<div class="login">
				<header class="login-header">
				<span class="text">TEST CASE NAME</span>
				<span class="tc_id">TC_<strong>20814</strong></span> <span
					class="tc_description"> Description </span></header>
				<form class="login-form">
					<button class="login-btn" type="submit">VIEW STEPS</button>
					<button class="login-btn" type="submit">APPROVE WITH
						UPDATES</button>
					<button class="login-btn" type="submit">APPROVE</button>
					<button class="login-btn" type="submit">DISSAPROVE</button>
				</form>
			</div>
			<%}
			}else{%>
			<div class="login">
				<header class="login-header">
				<span class="text">TEST CASE NAME</span>
				<span class="tc_id">NA</span> <span
					class="tc_description">No Test Case added.</span></header>
			</div>
			<%} %>			
		</div>
		</main>
		<!-- page-content" -->
	</div>
	<!-- page-wrapper -->
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.js'></script>


	<script src="js/index.js"></script>
</body>
</html>
