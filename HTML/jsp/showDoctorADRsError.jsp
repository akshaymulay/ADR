	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ page import="java.io.FileNotFoundException" %>
	<%@ page import="java.io.IOException" %>
	<%@ page import="java.util.Properties" %>
	<%@ page import="java.io.FileInputStream" %>
	<%@ page import ="java.sql.*" %>
	<%@ page import ="javax.sql.*" %>
	<%@page import="java.sql.*,java.util.*"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
		<head>
				<meta charset="utf-8" />
		<title>Doctor Raised ADRs</title>
				<meta name="Description" content="" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />
				<!-- Fonts -->
				<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css' />
				<link href='http://fonts.googleapis.com/css?family=Dosis:400,700' rel='stylesheet' type='text/css' />
				<!-- Bootsrap -->
				<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
				<!-- Font awesome -->
				<link rel="stylesheet" href="../assets/css/font-awesome.min.css" />
				<!-- Owl carousel -->
				<link rel="stylesheet" href="../assets/css/owl.carousel.css" />
				<!-- Template main Css -->
				<link rel="stylesheet" href="../assets/css/style.css" />
				<!-- Modernizr -->
				<link rel="icon" type="png" sizes="16x16" href="../assets/images/favicon-16x16.png">
				<script src="../assets/js/modernizr-2.6.2.min.js"></script>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<style type="text/css">
			.style1 {color: #FFFFFF}
			</style>
		</head>
		<body>
		<header class="main-header">
				<nav class="navbar navbar-static-top" >
					<div class="navbar-top" >
					  <div class="container" >
						  <div class="row">
							<div class="col-sm-6 col-xs-12" >
								<ul class="list-unstyled list-inline header-contact" >
									<li> <i class="fa fa-phone"></i> <a href="tel:">+91 839-098-3057 </a> </li>
									 <li> <i class="fa fa-envelope"></i> <a href="mailto:ADRAdmin.gov.in">ADRAdmin.gov.in</a> </li>
							   </ul> <!-- /.header-contact  -->
							</div>
						  </div>
					  </div>
					</div>
					<div class="navbar-main" align="right">
							<div class="navbar-header" align="left">
							<div id="navbar" class="navbar-collapse collapse pull-right">
						  <img src="../assets/images/adr-logo.JPG" alt="ADR System" width="263" height="62" align="left" />
						  </div>
						  </div>
					  <div class="container">
						<div id="navbar" class="navbar-collapse collapse pull-right">
						  <ul class="nav navbar-nav">
						  <li><a href="adminProfile.jsp">Home</a></li>
							<li><a class="is-active" href="showRegisteredUsers.jsp">Show Registered Users</a></li>
							<li class="has-child"><a href="#">Show ADR Raised By</a>
							  <ul class="submenu">
							 <li class="submenu-item page-description"><a href="showDoctorADRs.jsp">Doctor/Nurse </a></li>
								 <li class="submenu-item"><a href="showPharmacistADRs.jsp">Pharmacist</a></li>
								  <li class="submenu-item"><a href="showPatientADRs.jsp">Patient</a></li>
							  </ul>
							</li>
							<li><a href="showGrphs.jsp">Show Analytics</a></li>
							<li><a href="logout.jsp">Logout</a></li>
						  </ul>
						</div> <!-- /#navbar -->
					  </div> <!-- /.container -->
					</div> <!-- /.navbar-main -->
				</nav> 
		</header> <!-- /. main-header -->
		<div class="btn-danger" align="center"><font size=4px>Error Occurred...Please try again..!</font></div>
		<h1>Welcome <%= session.getAttribute("userLogin")%></h1>
		<div align="center">
		  <!-- /. main-header -->
		  <span class="btn-success page-description">ADRs Raised By Doctors</span>
	    </div>
		<div align="center">
		<table class="table" border="2">
		<tr>
		<th class="btn-info">Sr No</th>
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
		<th class="btn-info" colspan=2>Describe Event</th>
		<th class="btn-info">Relevant Tests Performed</th>
		<th class="btn-info">Action</th>
		</tr>
		<%
		String userName=null;
		String dbPassword = null;
		String url=null;
		String path=System.getProperty("user.dir");
		String userLogin=request.getParameter("userLogin");
		String password=request.getParameter("password");
		ResultSet resultSet = null;
		FileInputStream fis = new FileInputStream("C:/Apache/webapps/ADR/HTML/jsp/DBParameters.properties");
		Properties prop = new Properties();
		prop.load(fis);
		 userName= prop.getProperty("userName");
		 dbPassword= prop.getProperty("password");
		 url= prop.getProperty("url");
		 try {
		 Class.forName("com.mysql.jdbc.Driver"); 
		 java.sql.Connection con = DriverManager.getConnection(url,userName,dbPassword); 
		 Statement statement = con.createStatement();
		 String sql = "select adrid,nameDoctor,contactDoctor,emailAddress,occupation,medicine,doseQuantity,doseType,therapyStart,therapyEnd,dateProblemoccu,majorIssue,majorProblem,describrEvent,relevantTests,userLogin from doctorADRs";
		 resultSet = statement.executeQuery(sql);
		 while(resultSet.next()){ %>
		 <tr>
		 <TD class="list-group-item-success"> <%= resultSet.getString(1) %></td>
         <TD class="list-group-item-success"> <%= resultSet.getString(2) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(3) %></TD>
         <TD class="list-group-item-success"> <%= resultSet.getString(4) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(5) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(6) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(7)+resultSet.getString(8) %></td>
		 <TD class="list-group-item-success"> <%= resultSet.getString(9) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(10) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(11) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(12) %></TD>
		 <TD class="list-group-item-success" colspan=2> <%= resultSet.getString(13) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(14) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(15) %></TD>
		 		 <%
		 if(!resultSet.getString(16).equals("guest")){%>
			 		 <TD class="btn-warning"> <a href="sendReplay.jsp?userLogin=<%=resultSet.getString(16)%>,<%=resultSet.getString(1)%>,<%=resultSet.getString(6)%>"> Send Replay
		 </a>
		 <%}
		 else{%>
			 <TD class="list-group-item-warning"> Submitted by Guest User
		 <%}
		}
		 }catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("showDoctorADRsError.jsp");
	} 	 
		 %>
							 </TD>
		 		 </tr>
		  </table>
	    </div>
				<div class="footer-bottom">
							<a href="ADRHome.html"><span class="style1">ADRSystem @ copyrights 2019</span></a>			
				</div>
			</footer><!-- main-footer -->
		</body>
		</html>