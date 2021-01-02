<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.sql.*,java.util.*"%>
	<%
	String userName=null;
	String dbPassword = null;
	String url=null;
	String path=System.getProperty("user.dir");
	String patientName=request.getParameter("patientName");
	String gender=request.getParameter("gender");
	String age=request.getParameter("age");
	String contactNumber=request.getParameter("contactNumber");
	String emailAddress=request.getParameter("emailAddress");
	String medicine=request.getParameter("medicine");
	String dose=request.getParameter("dose");
	String doseQuantity=request.getParameter("doseQuantity");
	String problemOccuredDate=request.getParameter("problemOccuredDate");
	String symptomesObserved=request.getParameter("symptomesObserved");
	String majorAffect=request.getParameter("majorAffect");
	String userLogin=null;
	FileInputStream fis = new FileInputStream("C:/Apache/webapps/ADR/HTML/jsp/DBParameters.properties");
	Properties prop = new Properties();
	prop.load(fis);
	 userName= prop.getProperty("userName");
	 dbPassword= prop.getProperty("password");
	 url= prop.getProperty("url");
	
try {
		if(null!=request.getParameter("userLogin")){
		userLogin=request.getParameter("userLogin");
		}else
		{
		userLogin="guest";
		}

	 Class.forName("com.mysql.jdbc.Driver"); 
	 java.sql.Connection con = DriverManager.getConnection(url,userName,dbPassword); 
	 Statement st= con.createStatement();
	 int i=st.executeUpdate("insert into patientADRs(patientName,gender,age,contactNumber,emailAddress,medicine,dose,doseQuantity,problemOccuredDate,symptomesObserved,majorAffect,userLogin) values('"+patientName+"','"+gender+"','"+age+"','"+contactNumber+"','"+emailAddress+"','"+medicine+"','"+dose+"','"+doseQuantity+"','"+problemOccuredDate+"','"+symptomesObserved+"','"+majorAffect+"','"+userLogin+"')");
	  response.sendRedirect("/ADR/HTML/ADRHomeRecordSubmited.html");
}	 
 catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("/ADR/HTML/PatientFormError.html");
} 
%>
		