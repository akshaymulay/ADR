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
		<title>Inbox</title>
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
		<body bgcolor="#115c9b">
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
						  <a href="./ADRHome.html"><img src="../assets/images/adr-logo.JPG" alt="ADR System" width="263" height="62" align="left" /></a>
						  </div>
						  </div>
					  <div class="container">
						<div id="navbar" class="navbar-collapse collapse pull-right">
						  <ul class="nav navbar-nav">
							<li><a href="profile.jsp">Home</a></li>
							<li><a href="updateProfile.jsp">Update Profile</a></li>
							<li><a href="reportADR.jsp">Report ADR</a></li>
							<li><a href="showADRRaisedByMe.jsp">ADR raised by me</a></li>
							<li><a class="is-active" href="inbox.jsp">Inbox</a></li>
							<li><a href="logout.jsp">Logout</a></li>
						  </ul>
						</div> <!-- /#navbar -->
					  </div> <!-- /.container -->
					</div> <!-- /.navbar-main -->
				</nav> 
		</header> <!-- /. main-header -->
		<h1>Welcome <%= session.getAttribute("userLogin")%></h1>
		<div align="center">
		  <!-- /. main-header -->
		  <span class="btn-success page-description">Replay from DCGI</span>
	    </div>
		<div align="center">
		<table class="table"  border="2">
		<tr>
		<th class="btn-info">Medicine</th>
		<th class="btn-info">DCGI's Message</th>
		<th class="btn-info">Replay Date</th>
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
		 String sql = "select medicine,msg,replayDate from communication where userLogin ='"+ session.getAttribute("userLogin")+"'";
		 resultSet = statement.executeQuery(sql);
		 while(resultSet.next()){ %>
		 <tr>
		 <TD class="list-group-item-success"> <%= resultSet.getString(1) %></td>
         <TD class="list-group-item-success"> <%= resultSet.getString(2) %></TD>
		 <TD class="list-group-item-success"> <%= resultSet.getString(3) %></TD>
		 </tr>
		<% }
		 }catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("profile.jsp");
	} 	 
		 %>
		  </table>
				<div class="footer-bottom">
							<a href="ADRHome.html"><span class="style1">ADRSystem @ copyrights 2019</span></a>			
				</div>
			</footer><!-- main-footer -->
		</body>
		</html>