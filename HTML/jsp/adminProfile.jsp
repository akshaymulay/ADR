		<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
		<head>
				<meta charset="utf-8" />
		<title>Administrator Profile</title>
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
						  <a href="./ADRHome.html"><img src="../assets/images/adr-logo.JPG" alt="ADR System" width="263" height="62" align="left" /></a>
						  </div>
						  </div>
					  <div class="container">
					 	<div id="navbar" class="navbar-collapse collapse pull-right">
						  <ul class="nav navbar-nav">
						  <li><a class="is-active" href="#">Home</a></li>
							<li><a href="showRegisteredUsers.jsp">Show Registered Users</a></li>
							<li class="has-child"><a href="#">Show ADR Raised By</a>
							  <ul class="submenu">
							 <li class="submenu-item page-description"><a href="showDoctorADRs.jsp">Doctor/Nurse </a></li>
								 <li class="submenu-item"><a href="showPharmacistADRs.jsp">Pharmacist</a></li>
								  <li class="submenu-item"><a href="showPatientADRs.jsp">Patient</a></li>
							  </ul>
							  <li><a href="showGrphs.jsp">Show Analytics</a></li>
							</li>
							<li><a href="logout.jsp">Logout</a></li>
						  </ul>
						</div> <!-- /#navbar -->
					  </div> <!-- /.container -->
					</div> <!-- /.navbar-main -->
				</nav> 
		</header> <!-- /. main-header -->
		<img height=210 width=300 src="../assets/images/CDSCO.png" align="center"> 
		<b><font color="black">Central Drugs Standard Control Organization|
Directorate General of Health Services |
Ministry of Health & Family Welfare |
Government of India</font></b>
		<h2>Welcome <%= session.getAttribute("userLogin")%></h2>
			  <p class="alert">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>The Central Drugs Standard Control Organisation(CDSCO) under Directorate General of Health Services,Ministry of Health & Family Welfare,Government of India is the National Regulatory Authority (NRA) of India. Its headquarter is located at FDA Bhawan, Kotla Road, New Delhi 110002 and also has six zonal offices,four sub zonal offices,thirteen Port offices and seven laboratories spread across the country.</br></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Drugs & Cosmetics Act,1940 and rules 1945 have entrusted various responsibilities to central & state regulators for regulation of drugs & cosmetics.It envisages uniform implementation of the provisions of the Act & Rules made there under for ensuring the safety, rights and well being of the patients by regulating the drugs and cosmetics. CDSCO is constantly thriving upon to bring out transparency, accountability and uniformity in its services in order to ensure safety, efficacy and quality of the medical product manufactured, imported and distributed in the country.</br></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Under the Drugs and Cosmetics Act, CDSCO is responsible for approval of New Drugs, Conduct of Clinical Trials, laying down the standards for Drugs, control over the quality of imported Drugs in the country and coordination of the activities of State Drug Control Organizations by providing expert advice with a view of bring about the uniformity in the enforcement of the Drugs and Cosmetics Act.</br></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Further CDSCO along with state regulators, is jointly responsible for grant of licenses of certain specialized categories of critical Drugs such as blood and blood products, I. V. Fluids, Vaccine and Sera.</b></p>
				<div class="footer-bottom">
							<a href="../ADRHome.html"><span class="style1">ADRSystem @ copyrights 2019</span></a>			
				</div>
			</footer><!-- main-footer -->
		</body>
		</html>