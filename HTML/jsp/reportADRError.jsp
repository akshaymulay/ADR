
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
		<%= session.getAttribute("userLogin")%></h1>
	<%
		String loggedInuser=(String)session.getAttribute("userLogin");
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
		 String sql = "select registerAs from registeredusers where userLogin='"+loggedInuser+"'";
		 resultSet = statement.executeQuery(sql);
		 while(resultSet.next()){ 
				if(resultSet.getString(1).equals("Patient")){
				%>
				 <div class="header">
		<h3>Patient Form</h3>
	  </div>
	<form method="post" action="savePatientFormRegistered.jsp"
		id="registartionForm">
		<div class="input-group">
			<input type="text" name="userLogin" value=<%= session.getAttribute("userLogin")%>
				hidden>
		</div>
		<div class="input-group">
			<input type="text" name="patientName" placeholder="Enter Name"
				required>
		</div>
		<label>Gender</label>
		</br>
		<input type="radio" name="gender" value="male" checked>Male
		</br>
		<input type="radio" name="gender" value="female">Female
		</br>
		<input type="radio" name="gender" value="other">Other
		<div class="input-group">
			<input type="text" name="age" placeholder="Age(Years)"
				pattern="[0-9]{2}" required>
		</div>
		<div class="input-group">
			<input type="tel" name="contactNumber" placeholder="e.g 8390983057"
				pattern="[0-9]{10}" required>
		</div>
		<div class="input-group">
			<input type="email" name="emailAddress" placeholder="Email Address"
				required>
		</div>
		<div class="input-group">
			<input type="text" name="medicine" placeholder="Medicine Name"
				required>
		</div>
		<div class="input-group">
			<input type="text" name="dose" placeholder="Dose" required>
		</div>
		<select name="doseQuantity" style="padding: 8px; padding-top: -10%;">
			<option value="doseQuantity">Select dose as</option>
			<option value="mg">mg</option>
			<option value="mcg">mcg</option>
			<option value="gm">gm</option>
			<option value="ml">ml</option>
		</select>
		<div class="input-group">
			Date the problem occurred<input type="date" name="problemOccuredDate"
				placeholder="Date" required>
		</div>
		<div class="input-group">
			<label>Suspected Reaction</label>
		</div>
		<textarea name="symptomesObserved" rows="4" cols="40"
			onfocus="this.value=''" id="SR">Enter more details</textarea>

		<div class="input-group">
			<label>Did any of the following happen?</label>
		</div>
		<div class="input-group">
			<select name="majorAffect">
				<option value="Hospitalization - admitted or stayed longer">
					Hospitalization - admitted or stayed longer</option>
				<option value="Disability or health problem">Disability or
					health problem</option>
				<option value="Birth defect">Birth defect</option>
				<option value="Life-threatening">Life-threatening</option>
				<option value="Not taken Proper dose">Not taken Proper dose</option>
				<option value="Allergy">Allergy</option>
			</select>
		</div>
		<div class="input-group">
			<input type="submit" value="Submit" class="btn"
				style="margin-left: 60px;">
		</div>
	</form>
	<%}
				if(resultSet.getString(1).equals("Pharmacist")){%>
				 <div class="header">
		  <h3>Pharmacist Form</h3>
	  </div>
	  <form method="post" action="savePharmacistFormRegistered.jsp.jsp" id="registartionForm">
			<div class="input-group">
			<input type="text" name="userLogin" value=<%= session.getAttribute("userLogin")%>
				hidden>
		</div>
		 <div class="input-group">
				<input type="text" name="pharmacistName" placeholder="Enter Pharmacist Name" required>
				</div>
				<div class="input-group">
				<input type="tel" name="pharmacistContact" placeholder="e.g 8390983057" pattern="[0-9]{10}"required>
				</div>
				<div class="input-group">
				<input type="email" name="pharmacistEmail" placeholder="Enter email" required>
				</div>
				<div class="input-group">
				<label>Name of the product as it appears on the box, bottle, or package</label>
				<input type="text" name="product" placeholder="Product Name" required>
				</div>
				<div class="input-group">
				<label>Name of the company that Manufacture the product </label>
				<input type="text" name="productManufacture" placeholder="Manufacture Name" required>
				</div>	
				<label>Manufacturing date of the product-: </label>
				<div class="input-group">
				<input type="date" name="manufacturingDate" placeholder="manufacturing date" required>
				</div>	
				<label>Expiration Date of the product -:</label>
				<div class="input-group">
				<input type="date" name="expirationDate" required>
				</div>	
  <label>Is the Product purchasable without a doctor's prescription?</label></br>
    <input type="radio" name="noPrescription" value="yes">Yes</br>
  <input type="radio" name="noPrescription" value="no">No</br>
				 <div class="input-group">
				 <label>Date the person first started taking or using the product</label>
			<input type="date" name="dateFirst" required>
			 <label>Date the person stopped taking or using the product</label>
			<input type="date" name="dateStopped" required>
			</div>
			<label>Why was the person using the product? </label>
			<textarea name="personpDetails" placeholder="Enter details here.." rows="4" cols="40" onfocus="this.value=''">Enter details here.</textarea>
			<label>Did the problem return if the another person started taking or using the product again?</label></br>
    <input type="radio" name="anotherProduct" value="yes" checked>Yes</br>
  <input type="radio" name="anotherProduct" value="no">No</br>
			
<div class="input-group">
			Date the problem occurred<input type="date" name="problemOccured" placeholder="Date" required>
			</div>
			<div class="input-group">
			<label>Suspected Reaction Observed By Customer</label>
			<textarea name="reactionBycustomer" placeholder="Enter details here.." rows="4" cols="40" onfocus="this.value=''">Enter details here.</textarea>
			</div>			
			<div class="input-group">
			<label>Did any of the following happen?</label>
			</div>
		<div class="input-group">
			<select name="sideEffect">
			<option value="Hospitalization - admitted or stayed longer"> Hospitalization - admitted or stayed longer</option>
			<option value="Disability or health problem"> Disability or health problem</option>
			<option value="Birth defect"> Birth defect</option>
			<option value="Life-threatening"> Life-threatening</option>
			<option value="Not taken Proper dose"> Not taken Proper dose</option>
			<option value="Allergy">Allergy</option>
			</select>	
			</div>
				
			 <div class="input-group">
			<input type="submit" value="Submit" class="btn" style="margin-left:60px;">
		  </div>
			</form>
				<%}
				if(resultSet.getString(1).equals("Doctor")){%>	
				<div class="header">
		<h3>Doctor/Nurse Form</h3>
	  </div>
	  <form method="post" action="saveDoctorFormRegistered.jsp" id="registartionForm">
	  <div class="input-group">
				<input type="text" name="userLogin" value=<%= session.getAttribute("userLogin")%>  hidden>
				</div>
		 <div class="input-group">
				<input type="text" name="nameDoctor" placeholder="Name" required>
				</div>
				<div class="input-group">
				<input type="tel" name="contactDoctor" placeholder="e.g 8390983057" pattern="[0-9]{10}"required>
				</div>
				<div class="input-group">
				<input type="email" name="emailAddress" placeholder="Email Address" required>
				</div>
				 Occupation
     <select name="occupation">
     <option value="Doctor">Doctor</option>
    <option value="Nurse">Nurse</option>
  </select>
				 <div class="input-group">
			<input type="text" name="medicineBydrprescription" placeholder="Medicine Name" required>
			</div>
			<div class="input-group">
			<input type="text" name="doseQuantity" placeholder="Dose" required>
			</div>
			<select name="doseType" style="padding:8px;padding-top:-10%;">
			 <option >Select dose as</option>
  <option value="mg">mg</option>
  <option value="mcg">mcg</option>
  <option value="gm">gm</option>
  <option value="ml">ml</option>
</select>
<div class="input-group">
			Therapy Start Date<input type="date" name="therapyStart" placeholder="Date" required>
			</div>
			<div class="input-group">
			Therapy End Date<input type="date" name="therapyEnd" placeholder="Date" required>
			</div>
<div class="input-group">
			Date the problem occurred<input type="date" name="dateProblemoccu" placeholder="Date" required>
			</div>
			<div class="input-group">
			<label>Did any of the following happen?</label>
			</div>
			<div class="input-group">
			<select name="majorIssue">
			<option value="Hospitalization - admitted or stayed longer"> Hospitalization - admitted or stayed longer</option>
			<option value="Disability or health problem"> Disability or health problem</option>
			<option value="Birth defect"> Birth defect</option>
			<option value="Life-threatening"> Life-threatening</option>
			<option value="Not taken Proper dose"> Not taken Proper dose</option>
			<option value="Allergy">Allergy</option>
			</select>	
			</div>
			<div class="input-group">
			<label>Adverse Event, Product Problem:?</label>
			</div>
			<div class="input-group">
			<select name="majorProblem">
			<option value="Product Use Error?r">Product Use Error?</option>
			<option value="Product Problem (e.g., defects/malfunctions)"> Product Problem?</option>
			<option value="Problem with Different Manufacturer of Same Medicine?">Different Medicine of Same Company?</option>
			<option value="Life-threatening">Life-threatening</option>
			<option value="Not taken Proper dose">Not taken Proper dose</option>
			<option value="Allergy">Allergy</option>
			</select>	
			</div>
<div class="input-group">
			 Date Of Event<input type="date" name="dateEvent" value="de" />
			</div>
			<div class="input-group">
			<label>Describe Event, Problem, or Product Use Error:</label>
			<textarea name="describrEvent" rows="4" cols="40" onfocus="this.value=''">Enter details here...</textarea>
				</div>
			<div class="input-group">
			<label>Relevant Tests/Laboratory Data, Including Dates:</label>
			<textarea name="relevantTests" rows="4" cols="40" onfocus="this.value=''">Enter details here...</textarea>
			</div>
			 	 <div class="input-group">
			<input type="submit" value="Submit" class="btn" style="margin-left:60px;">
		  </div>
			</form>
				<%}
			}
		 }catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("Profile.jsp");
	} 	 
		 %>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<div class="footer-bottom">
		<a href="ADRHome.html"><span class="style1">ADRSystem @
				copyrights 2019</span></a>
	</div>
	</footer>
	<!-- main-footer -->
</body>
</html>