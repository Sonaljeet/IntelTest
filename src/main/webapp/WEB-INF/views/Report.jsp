<%@page import="com.IntelliTest.Database.ReportDatabase"%>
<%@page import="com.IntelliTest.Database.LeftPanelDatabase"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
<meta charset="UTF-8">
<title>IntelliTest</title>


<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css'>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.1/css/all.css'>

<link rel="stylesheet" href="css/report.css">

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
					<span class="user-name"> <strong>Harsh</strong> CEO
					</span> <span class="user-role">Administrator</span> <span
						class="user-status"> <i class="fa fa-circle"></i> <span>Online</span>
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
		<div class="btn">
			<button class="button">
				<span class="submit">Generate Report</span> <span class="loading"><i
					class="fa fa-refresh"></i></span> <span class="check"><i
					class="fa fa-check"></i></span>
			</button>
		</div>
		<div class="container-fluid">
			<%int totalTestCase = ReportDatabase.getTestCaseCount();
			if(totalTestCase>0){
			List<String> testID = new ArrayList<String>();
			testID= ReportDatabase.getTestCaseID();
			for(int i=0;i<totalTestCase;i++){%>
			<div class="test_cases">
				<div class="test_case_heading"><%out.println(ReportDatabase.getTCName(testID.get(i)));%></div>
				<div class="test_case_details">
					<div class="test_case_left">
						<div>
							<i class="fa fa-bolt"
								style="color: #25e425; padding-right: 2%; padding-left: 2%;"></i><strong>Total
								Number of Steps: </strong>
							<div style="padding-left: 10%;"><%out.println(ReportDatabase.getNumberOfTestSteps(testID.get(i)));%></div>
						</div>
						<div>
							<i class="fa fa-calendar"
								style="color: #8383dcbf; padding-right: 2%; padding-left: 2%;"></i><strong>Date
								of Last Run: </strong>
							<div style="padding-left: 10%;"><%out.println(ReportDatabase.getLastRunDate(testID.get(i)));%></div>
						</div>
					</div>
					<div class="test_case_right">
						<div>
							<div>
								<i class="fa fa-circle fa-xs"
									style="color: #24b724ab; padding-right: 4%; padding-left: 4%;"></i><strong
									style="letter-spacing: 0.05vw">PASSED: </strong><%out.println(ReportDatabase.getPassCount(testID.get(i)));%>
							</div>
							<div>
								<i class="fa fa-circle fa-xs"
									style="color: #a42828ad; padding-right: 4%; padding-left: 4%;"></i><strong
									style="letter-spacing: 0.05vw">FAILED: </strong><%out.println(ReportDatabase.getFailCount(testID.get(i)));%>
							</div>
							<div>
								<i class="fa fa-circle fa-xs"
									style="color: #808080a1; padding-right: 4%; padding-left: 4%;"></i><strong
									style="letter-spacing: 0.05vw">SKIPPED: </strong><%out.println(ReportDatabase.getSkipCount(testID.get(i)));%>
							</div>
						</div>
					</div>
				</div>
				<div class="test_class_description">
					<div>Description</div>
					<p><%out.println(ReportDatabase.getDescription(testID.get(i)));%></p>
				</div>
				<div class="test_case_footer">
					<div>
						<strong>ID: </strong><%out.println(testID.get(i));%>
					</div>
					<button>Select</button>
				</div>
			</div>
			<%} 
			}else{%>
			<div class="test_cases">
				<div class="test_case_heading">Test Case Heading</div>
				<div class="test_case_details">
					<div class="test_case_left">
						<div>
							<i class="fa fa-bolt"
								style="color: #25e425; padding-right: 2%; padding-left: 2%;"></i><strong>Total
								Number of Steps: </strong>
							<div style="padding-left: 10%;">0</div>
						</div>
						<div>
							<i class="fa fa-calendar"
								style="color: #8383dcbf; padding-right: 2%; padding-left: 2%;"></i><strong>Date
								of Last Run: </strong>
							<div style="padding-left: 10%;">NA</div>
						</div>
					</div>
					<div class="test_case_right">
						<div>
							<div>
								<i class="fa fa-circle fa-xs"
									style="color: #24b724ab; padding-right: 4%; padding-left: 4%;"></i><strong
									style="letter-spacing: 0.05vw">PASSED: </strong>0
							</div>
							<div>
								<i class="fa fa-circle fa-xs"
									style="color: #a42828ad; padding-right: 4%; padding-left: 4%;"></i><strong
									style="letter-spacing: 0.05vw">FAILED: </strong>0
							</div>
							<div>
								<i class="fa fa-circle fa-xs"
									style="color: #808080a1; padding-right: 4%; padding-left: 4%;"></i><strong
									style="letter-spacing: 0.05vw">SKIPPED: </strong>0
							</div>
						</div>
					</div>
				</div>
				<div class="test_class_description">
					<div>Description</div>
					<p>No Test Cases exists. Please add test case.</p>
				</div>
				<div class="test_case_footer">
					<div>
						<strong>ID: </strong>NA
					</div>
					<button>Select</button>
				</div>
				<%}%>
			
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="js/report.js"></script>




</body>

</html>
