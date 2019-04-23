<%@page import="com.IntelliTest.Database.AddTestCaseServletWeb"%>
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
<link rel="stylesheet" href="css/add_web_tc.css">
</head>
<body>
	<script type="text/javascript">
		//removing the new steps
		function removed(item) {
			var id = $(item).attr("id");
			var split_id = id.split("_");
			var deleteindex = split_id[1];
			// Remove <div> with id
			$("#step_" + deleteindex).remove();
		};
		function operation(item) {
			var id = $(item).attr("id");
			var optionvalue = document.getElementById(id).value;
			var split_id = id.split("_");
			var index = split_id[1];
			if (optionvalue == "NAVIGATE") {
				document.getElementById("tb1_" + index).placeholder = "Please enter the URL";
				document.getElementById("tb1_" + index).required="true";
				document.getElementById("dd1_" + index).style.display = "none";
				document.getElementById("st1_" + index).style.display = "none";
				document.getElementById("dd2_" + index).style.display = "none";
				document.getElementById("st2_" + index).style.display = "none";
			}
			if (optionvalue == "VALIDATE") {
				document.getElementById("dd1_" + index).style.display = "block";
				document.getElementById("dd1_" + index).required="true";
				document.getElementById("st1_" + index).style.display = "none";
				document.getElementById("dd2_" + index).style.display = "none";
				document.getElementById("st2_" + index).style.display = "none";
				document.getElementById("tb1_" + index).placeholder = "Locator of the element";
				document.getElementById("tb1_" + index).required="true";
			}
			if (optionvalue == "ENTER TEXT") {
				document.getElementById("dd1_" + index).style.display = "none";
				document.getElementById("st1_" + index).style.display = "block";
				document.getElementById("st1_" + index).required="true";
				document.getElementById("dd2_" + index).style.display = "none";
				document.getElementById("st2_" + index).style.display = "none";
				document.getElementById("tb1_" + index).placeholder = "Locator of the element";
				document.getElementById("tb1_" + index).required="true";
			}
			if (optionvalue == "MOUSE EVENTS") {
				document.getElementById("dd1_" + index).style.display = "none";
				document.getElementById("st1_" + index).style.display = "none";
				document.getElementById("dd2_" + index).style.display = "block";
				document.getElementById("dd2_" + index).required="true";
				document.getElementById("st2_" + index).style.display = "none";
			}
		};
		function mouse_event(item) {
			var id = $(item).attr("id");
			var optionvalue = document.getElementById(id).value;
			var split_id = id.split("_");
			var index = split_id[1];
			if (optionvalue == "click") {
				document.getElementById("dd1_" + index).style.display = "none";
				document.getElementById("st1_" + index).style.display = "none";
				document.getElementById("dd2_" + index).style.display = "block";
				document.getElementById("st2_" + index).style.display = "none";
				document.getElementById("tb1_" + index).placeholder = "Locator of the element to be clicked";
				document.getElementById("tb1_" + index).required="true";
			}
			if (optionvalue == "doubleclick") {
				document.getElementById("dd1_" + index).style.display = "none";
				document.getElementById("st1_" + index).style.display = "none";
				document.getElementById("dd2_" + index).style.display = "block";
				document.getElementById("st2_" + index).style.display = "none";
				document.getElementById("tb1_" + index).placeholder = "Locator of the element to be double clicked";
				document.getElementById("tb1_" + index).required="true";
			}
			if (optionvalue == "rightclick") {
				document.getElementById("dd1_" + index).style.display = "none";
				document.getElementById("st1_" + index).style.display = "none";
				document.getElementById("dd2_" + index).style.display = "block";
				document.getElementById("st2_" + index).style.display = "none";
				document.getElementById("tb1_" + index).placeholder = "Locator of the element to be right clicked";
				document.getElementById("tb1_" + index).required="true";
			}
			if (optionvalue == "draganddrop") {
				document.getElementById("dd1_" + index).style.display = "none";
				document.getElementById("st1_" + index).style.display = "none";
				document.getElementById("dd2_" + index).style.display = "block";
				document.getElementById("st2_" + index).style.display = "block";
				document.getElementById("st2_" + index).required="true";
				document.getElementById("tb1_" + index).placeholder = "Locator of the starting element";
				document.getElementById("tb1_" + index).required="true";
			}
			if (optionvalue == "hover") {
				document.getElementById("dd1_" + index).style.display = "none";
				document.getElementById("st1_" + index).style.display = "none";
				document.getElementById("dd2_" + index).style.display = "block";
				document.getElementById("st2_" + index).style.display = "block";
				document.getElementById("tb1_" + index).placeholder = "Locator of the element before hover";
				document.getElementById("tb1_" + index).required="true";
				document.getElementById("st2_" + index).placeholder = "Locator of the element after hover";
				document.getElementById("st2_" + index).required="true";
			}
		};
		function new_step() {
			var total_steps = $(".add_test_steps").length;
			var lastid = $(".add_test_steps:last").attr("id");
			var split_id = lastid.split("_");
			var nextindex = Number(split_id[1]) + 1;
			$(".add_test_steps:last")
					.after(
							"<div class='add_test_steps' id='step_"+nextindex+"'></div>");
			$("#step_" + nextindex)
					.append(
							"<div class='heading'><h1>Add Test Steps</h1></div><div class='new_ts'><div class='first'><select required class='keyword'><option value=''>Please select the Keyword</option><option value='GIVEN'>ENTRY CONDITION</option><option value='WHEN'>IF</option>  <option value='AND'>AND</option>  <option value='THEN'>DO</option></select><input required type='textbox' class='test_case_name' placeholder='Enter Description of Test Step'></div><div class='second'><input type='textbox' name='appType' class='test_case_name' placeholder='Enter Native/Hybrid' required><select required class='operation' id='operation_" + nextindex + "' onchange='operation(this);'><option value=''>Please select the Operation</option><option value='NAVIGATE'>NAVIGATE</option><option value='VALIDATE'>VALIDATE</option>  <option value='ENTER TEXT'>ENTER TEXT</option><option value='MOUSE EVENTS'>MOUSE EVENTS</option></select><select required class='validation_type' id='dd1_"+nextindex+"'><option value=''>Please select the Validation type</option><option value='isdisplayed'>IS DISPLAYED</option><option value='notdisplayed'>ISN'T DISPLAYED</option></select><select required class='mouse_type' id='dd2_" + nextindex
									+ "' onchange='mouse_event(this)'><option value=''>Please select the action</option><option value='click'>CLICK</option><option value='rightclick'>RIGHT CLICK</option><option value='doubleclick'>DOUBLE CLICK</option><option value='draganddrop'>DRAG AND DROP</option><option value='hover'>Hover</option></select><input required type='textbox' class='test_case_name' id='tb1_"+nextindex+"' placeholder='Enter the Locator'><input required type='textbox' class='test_case_send_keys_text' id='st1_"+nextindex+"' placeholder='Enter the input text'><input required type='textbox' class='test_case_send_keys_text' id='st2_"+nextindex+"' placeholder='Locator of destination element'></div></div><div><button class='next_step' onclick='new_step()' id='step_"
									+ nextindex
									+ "'>Add Next Step</button><button class='remove_step' id='stepbuttonremove_"
									+ nextindex
									+ "' onclick='removed(this);'>Remove Step</button></div>");
			document.getElementById("dd1_" + nextindex).style.display = "none";
			document.getElementById("st1_" + nextindex).style.display = "none";
			document.getElementById("st2_" + nextindex).style.display = "none";
			document.getElementById("dd2_" + nextindex).style.display = "none";
		};
	</script>
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
							class="badge badge-pill badge-warning"> <%
 	out.println(LeftPanelDatabase.getDashBoardCount());
 %>>
						</span>
					</a>
						<div class="sidebar-submenu">
							<ul>
								<li><a href="#">API Automation <span
										class="badge badge-pill badge-success"> <%
 	out.println(LeftPanelDatabase.getAPICount());
 %>
									</span>
								</a></li>
								<li><a href="#">Web Automation <span
										class="badge badge-pill badge-success"> <%
 	out.println(LeftPanelDatabase.getWebCount());
 %>
									</span></a></li>
								<li><a href="#">Mobile Automation <span
										class="badge badge-pill badge-success"> <%
 	out.println(LeftPanelDatabase.getMobileCount());
 %>
									</span></a></li>
							</ul>
						</div></li>
					<li class="sidebar-dropdown"><a href="#"> <i
							class="fa fa-cogs"></i> <span>API</span> <span
							class="badge badge-pill badge-danger"> <%
 	out.println(LeftPanelDatabase.getAPICount());
 %>
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
							class="badge badge-pill badge-danger"> <%
 	out.println(LeftPanelDatabase.getWebCount());
 %>
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
							class="badge badge-pill badge-danger"> <%
 	out.println(LeftPanelDatabase.getMobileCount());
 %>
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
							class="badge badge-pill badge-danger"> <%
 	out.println(LeftPanelDatabase.getBugCount());
 %>
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
		<main class="page-content"> <!-- sidebar-wrapper  -->
		<form method="post" action="./AddTestCaseServletWeb">
			<div class="add_tc">
				<button>Add Test Case</button>
			</div>
			<div class="add_test_case">
				<div class="heading">
					<h1>Add Test Case</h1>
				</div>
				<div class="new_tc">
					<input type="textbox" name="testCaseName" class="test_case_name"
						width="100%" placeholder="Enter Name of Test Case" required>
					<input type="textbox" name="testCaseDesc" class="test_case_name"
						width="100%" placeholder="Enter Description of Test Case" required>
				</div>
				<div></div>
			</div>
			<div class="add_test_steps" id="step_1">
				<div class='heading'>
					<h1>Add Test Steps</h1>
				</div>
				<div class='new_ts'>
					<div class='first'>
						<select required name="annotations" class='keyword'><option
								value=''>Please select the Keyword</option>
							<option value='Given'>ENTRY CONDITION</option>
							<option value='When'>IF</option>
							<option value='And'>AND</option>
							<option value='Then'>DO</option></select><input type='textbox'
							name="stepsDesc" class='test_case_name'
							placeholder='Enter Description of Test Step' required> <input
							type='textbox' name="appType" class='test_case_name'
							placeholder='Enter Native/Hybrid' required>

					</div>
					<div class='second'>
						<select name="operations" class='operation' id='operation_1'
							onchange='operation(this);'><option value=''>Please
								select the Operation</option>
							<option value='NAVIGATE'>NAVIGATE</option>
							<option value='VALIDATE'>VALIDATE</option>
							<option value='ENTER TEXT'>ENTER TEXT</option>
							<option value='MOUSE EVENTS'>MOUSE EVENTS</option></select><select
							name="validationType" class='validation_type' id='dd1_1'><option
								value=''>Please select the Validation type</option>
							<option value='isdisplayed'>IS DISPLAYED</option>
							<option value='notdisplayed'>ISN'T DISPLAYED</option></select><select
							name="mouseType" class='mouse_type' id='dd2_1'
							onchange='mouse_event(this)'><option value=''>Please
								select the action</option>
							<option value='click'>CLICK</option>
							<option value='draganddrop'>DRAG AND DROP</option>
						</select><input type='textbox' name="locator" class='test_case_name'
							id='tb1_1' placeholder='Enter the Locator'><input
							type='textbox' name="userText" class='test_case_send_keys_text'
							id='st1_1' placeholder='Enter the input text'><input
							type='textbox' name="locatorDestination"
							class='test_case_send_keys_text' id='st2_1'
							placeholder='Locator of destination element'>
					</div>
				</div>
				<div>
					<button class='next_step' id='step_1' type="button">Add
						Next Step</button>
				</div>
			</div>
			<div>
				<button type='submit' class='submit_tc' id='submit_tc'>SUBMIT</button>
			</div>
		</form>
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
	<script src="js/web_tc.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							document.getElementById("dd1_1").style.display = "none";
							document.getElementById("st1_1").style.display = "none";
							document.getElementById("st2_1").style.display = "none";
							document.getElementById("dd2_1").style.display = "none";
							$(".next_step")
									.click(
											function() {
												var total_steps = $(".add_test_steps").length;
												var lastid = $(
														".add_test_steps:last")
														.attr("id");
												var split_id = lastid
														.split("_");
												var nextindex = Number(split_id[1]) + 1;
												$(".add_test_steps:last")
														.after(
																"<div class='add_test_steps' id='step_"+nextindex+"'></div>");
												$("#step_" + nextindex)
														.append(
																"<div class='heading'><h1>Add Test Steps</h1></div><div class='new_ts'><div class='first'><select class='keyword'><option value=''>Please select the Keyword</option><option value='GIVEN'>ENTRY CONDITION</option><option value='WHEN'>IF</option>  <option value='AND'>AND</option>  <option value='THEN'>DO</option></select><input type='textbox' class='test_case_name' placeholder='Enter Description of Test Step'></div><div class='second'><select class='operation' id='operation_"
																		+ nextindex
																		+ "' onchange='operation(this);'><option value=''>Please select the Operation</option><option value='NAVIGATE'>NAVIGATE</option><option value='VALIDATE'>VALIDATE</option>  <option value='ENTER TEXT'>ENTER TEXT</option><option value='MOUSE EVENTS'>MOUSE EVENTS</option></select><select class='validation_type' id='dd1_"+nextindex+"'><option value=''>Please select the Validation type</option><option value='isdisplayed'>IS DISPLAYED</option><option value='notdisplayed'>ISN'T DISPLAYED</option></select><select class='mouse_type' id='dd2_"
																		+ nextindex
																		+ "' onchange='mouse_event(this)'><option value=''>Please select the action</option><option value='click'>CLICK</option><option value='rightclick'>RIGHT CLICK</option><option value='doubleclick'>DOUBLE CLICK</option><option value='draganddrop'>DRAG AND DROP</option><option value='hover'>Hover</option></select><input type='textbox' class='test_case_name' id='tb1_"+nextindex+"' placeholder='Enter the Locator'><input type='textbox' class='test_case_send_keys_text' id='st1_"+nextindex+"' placeholder='Enter the input text'><input type='textbox' class='test_case_send_keys_text' id='st2_"+nextindex+"' placeholder='Locator of destination element'></div></div><div><button class='next_step' onclick='new_step()' id='step_"
																		+ nextindex
																		+ "'>Add Next Step</button><button class='remove_step' id='stepbuttonremove_"
																		+ nextindex
																		+ "' onclick='removed(this);'>Remove Step</button></div>");
												document.getElementById("dd1_"
														+ nextindex).style.display = "none";
												document.getElementById("st1_"
														+ nextindex).style.display = "none";
												document.getElementById("st2_"
														+ nextindex).style.display = "none";
												document.getElementById("dd2_"
														+ nextindex).style.display = "none";
											});
						});
	</script>
</body>
</html>