
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.Properties"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head>
<meta charset="utf-8" />
<title>ADR Raised by Me</title>
<meta name="Description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Dosis:400,700'
	rel='stylesheet' type='text/css' />
<!-- Bootsrap -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
<!-- Font awesome -->
<link rel="stylesheet" href="../assets/css/font-awesome.min.css" />
<!-- Owl carousel -->
<link rel="stylesheet" href="../assets/css/owl.carousel.css" />
<!-- Template main Css -->
<link rel="stylesheet" href="../assets/css/style.css" />
<!-- Modernizr -->
<link rel="icon" type="png" sizes="16x16"
	href="../assets/images/favicon-16x16.png">
<script src="../assets/js/modernizr-2.6.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
.style1 {
	color: #FFFFFF
}
</style>
</head>
<body bgcolor="#115c9b">
	<header class="main-header"> <nav
		class="navbar navbar-static-top">
	<div class="navbar-top">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-xs-12">
					<ul class="list-unstyled list-inline header-contact">
						<li><i class="fa fa-phone"></i> <a href="tel:">+91
								839-098-3057 </a></li>
						<li><i class="fa fa-envelope"></i> <a
							href="mailto:ADRAdmin.gov.in">ADRAdmin.gov.in</a></li>
					</ul>
					<!-- /.header-contact  -->
				</div>
			</div>
		</div>
	</div>
	<div class="navbar-main" align="right">
		<div class="navbar-header" align="left">
			<div id="navbar" class="navbar-collapse collapse pull-right">
				<a href="./ADRHome.html"><img
					src="../assets/images/adr-logo.JPG" alt="ADR System" width="263"
					height="62" align="left" /></a>
			</div>
		</div>
		<div class="container">
			<div id="navbar" class="navbar-collapse collapse pull-right">
				<ul class="nav navbar-nav">
					<li><a href="profile.jsp">Home</a></li>
					<li><a href="updateProfile.jsp">Update Profile</a></li>
					<li><a href="reportADR.jsp">Report ADR</a></li>
					<li><a class="is-active" href="showADRRaisedByMe.jsp">ADR
							raised by me</a></li>
					<li><a href="inbox.jsp">Inbox</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
			<!-- /#navbar -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.navbar-main --> </nav> </header>
	<!-- /. main-header -->
	<div class="btn-danger" align="center"><font size=4px>Error Occurred...Please try again..!</font></div>
	<h1>
		Welcome
		<%=session.getAttribute("userLogin")%></h1>
	<div>
		<table class="table" border="2">
			<%
				String loggedInUser = (String) session.getAttribute("userLogin");
				String userName = null;
				String dbPassword = null;
				String url = null;
				String path = System.getProperty("user.dir");
				String userLogin = request.getParameter("userLogin");
				String password = request.getParameter("password");
				java.sql.Connection con = null;
				ResultSet resultSet = null;
				FileInputStream fis = new FileInputStream("C:/Apache/webapps/ADR/HTML/jsp/DBParameters.properties");
				Properties prop = new Properties();
				prop.load(fis);
				userName = prop.getProperty("userName");
				dbPassword = prop.getProperty("password");
				url = prop.getProperty("url");
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection(url, userName, dbPassword);
					Statement statement = con.createStatement();
					String sql = "select registerAs from registeredUsers where userLogin='" + loggedInUser + "'";
					resultSet = statement.executeQuery(sql);
					while (resultSet.next()) {
						if (resultSet.getString(1).equals("Patient")) {
			%>
			<tr>
				<th class="btn-info">Patient Name</th>
				<th class="btn-info">Gender</th>
				<th class="btn-info">Age</th>
				<th class="btn-info">Contact Number</th>
				<th class="btn-info">Email Address</th>
				<th class="btn-info">Medicine Name</th>
				<th class="btn-info">Dose Value</th>
				<th class="btn-info">Dose Quantity</th>
				<th class="btn-info">Event Occurred Date</th>
				<th class="btn-info">Symptoms Observed</th>
				<th class="btn-info">Major Affect</th>
			</tr>
			<%
				Statement patientStatement = con.createStatement();
							String patientSql = "select patientName,gender,age,contactNumber,emailAddress,medicine,dose,doseQuantity,problemOccuredDate,symptomesObserved,majorAffect from patientADRs where userLogin='"
									+ loggedInUser + "'";
							ResultSet patientResultSet = patientStatement.executeQuery(patientSql);
							if (patientResultSet.next() == false) {
							%>
			<div class="btn-danger" align="center">
				<font size=4px>No Any ADR Raised..!</font>
			</div>
			<%
								}else{
								patientResultSet.previous();
								while (patientResultSet.next()) {
			%>
			<tr>
				<TD class="list-group-item-success"><%=patientResultSet.getString(1)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(2)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(3)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(4)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(5)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(6)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(7)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(8)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(9)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(10)%></TD>
				<TD class="list-group-item-success"><%=patientResultSet.getString(11)%></TD>
				<%
					}
					}
							}if (resultSet.getString(1).equals("Pharmacist")) {
				%>
				<tr>
					<th class="btn-info">Pharmacist Name</th>
					<th class="btn-info">Pharmacist Contact No</th>
					<th class="btn-info">Label On Product</th>
					<th class="btn-info">Product Manufacturing Company</th>
					<th class="btn-info">Manufacturing Date</th>
					<th class="btn-info">Expiration Date</th>
					<th class="btn-info">Product Without Dr Prescription</th>
					<th class="btn-info">Details By Patient</th>
					<th class="btn-info">Problem With Another Product Of Same
						Company</th>
					<th class="btn-info">Date of Problem Occurred</th>
					<th class="btn-info" colspan=2>Reaction Observed</th>
					<th class="btn-info">Side Effects</th>
				</tr>
				<%
					Statement pharmaStatement = con.createStatement();
								String pharmaSql = "select pharmacistName,pharmacistContact ,medicine ,productManufacture ,manufacturingDate ,expirationDate ,noPrescription ,personpDetails,anotherProduct,problemOccured,reactionBycustomer,sideEffect from pharmacistADRs where userLogin='"
										+ loggedInUser + "'";
								ResultSet pharmaResultSet = pharmaStatement.executeQuery(pharmaSql);
								if (pharmaResultSet.next() == false) {
							%>
				<div class="btn-danger" align="center">
					<font size=4px>No Any ADR Raised..!</font>
				</div>
				<%
								}else{
								pharmaResultSet.previous();
								while (pharmaResultSet.next()) {
				%>
				<tr>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(1)%></td>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(2)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(3)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(4)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(5)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(6)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(7)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(8)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(9)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(10)%></TD>
					<TD class="list-group-item-success"><%=pharmaResultSet.getString(11)%></TD>
					<TD class="list-group-item-success" colspan=2><%=pharmaResultSet.getString(12)%></TD>
					<%
						}
						}
						}if (resultSet.getString(1).equals("Doctor")) {
					%>
					<tr>
						<th class="btn-info">Doctor Name</th>
						<th class="btn-info">Doctor Contact No</th>
						<th class="btn-info">Email Address</th>
						<th class="btn-info">Occupation</th>
						<th class="btn-info">Prescribed Medicine</th>
						<th class="btn-info">Dose</th>
						<th class="btn-info">Date on which Therapy Start</th>
						<th class="btn-info">Date on which Therapy End</th>
						<th class="btn-info">Date of Problem Occurred</th>
						<th class="btn-info">Major Issue</th>
						<th class="btn-info">Major Problem</th>
						<th class="btn-info">Describe Event</th>
						<th class="btn-info">Relevant Tests Performed</th>
					</tr>
					<%
						Statement doctorStatement = con.createStatement();
									String doctorSql = "select nameDoctor,contactDoctor,emailAddress,occupation,medicine,doseQuantity,doseType,therapyStart,therapyEnd,dateProblemoccu,majorIssue,majorProblem,describrEvent,relevantTests from doctorADRs where userLogin='"
											+ loggedInUser + "'";
									ResultSet doctorResultSet = doctorStatement.executeQuery(doctorSql);
									if (doctorResultSet.next() == false) {
							%>
					<div class="btn-danger" align="center">
						<font size=4px>No Any ADR Raised..!</font>
					</div>
					<%
								}else{
								doctorResultSet.previous();
									while (doctorResultSet.next()) {
					%>
					<tr>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(1)%></td>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(2)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(3)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(4)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(5)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(6)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(7) + doctorResultSet.getString(8)%></td>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(9)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(10)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(11)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(12)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(13)%></TD>
						<TD class="list-group-item-success"><%=doctorResultSet.getString(14)%></TD>
						<%
							}
												}
								}
								}
							} catch (Exception e) {
								e.printStackTrace();
								response.sendRedirect("showADRRaisedByMeError.jsp");
							}finally{
								con.close();
							}
						%>
					</tr>
		</table>
	</div>
	<div class="footer-bottom">
		<a href="ADRHome.html"><span class="style1">ADRSystem @
				copyrights 2019</span></a>
	</div>
	</footer>
	<!-- main-footer -->
</body>
</html>
</html>