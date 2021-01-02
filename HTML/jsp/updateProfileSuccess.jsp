		<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
		<head>
				<meta charset="utf-8" />
		<title>My Profile</title>
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
							<li><a class="is-active" href="updateProfile.jsp">Update Profile</a></li>
							<li><a href="showADRRaisedByMe.jsp">ADR raised by me</a></li>
							<li><a href="inbox.jsp">Inbox</a></li>
							<li><a href="logout.jsp">Logout</a></li>
						  </ul>
						</div> <!-- /#navbar -->
					  </div> <!-- /.container -->
					</div> <!-- /.navbar-main -->
				</nav> 
		</header> <!-- /. main-header -->
	<div class="btn-success" align="center"><font size=4px>Profile updated Successfully..!</font></div>
		<h1>Welcome <%= session.getAttribute("userLogin")%></h1>
								  <div class="header">
				<h3>Update Profile</h3>
			  </div>
		<form method="post" action="updateUserDetails.jsp" id="registartionForm">
						<div class="input-group">
						<input type="text" name="userLogin" value=<%= session.getAttribute("userLogin")%> readonly>
						</div>
						<div class="input-group">
						<input type="text" name="firstName" placeholder="First Name" required>
						</div>
						<div class="input-group">
						<input type="text" name="lastName" placeholder="Last Name" required>
						</div>
						<div class="input-group">
						<input type="text" name="contactNumber" placeholder="e.g 8390983057" pattern="[0-9]{10}" required>
						</div>
						<div class="input-group">
						<input type="email" name="emailAddress" placeholder="Email Address" required>
						</div>
					 <div class="input-group">
					<center><input id="submit" type="submit" value="Update Details" class="btn"></center>
					</div>
					  </div>
					</form>		
			  <p>&nbsp;</p>
			  <p>&nbsp;</p>
			  <p>&nbsp;</p>
			  <p>&nbsp;</p>
				<div class="footer-bottom">
							<a href="ADRHome.html"><span class="style1">ADRSystem @ copyrights 2019</span></a>			
				</div>
			</footer><!-- main-footer -->
		</body>
		</html>