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
	String pharmacistName=request.getParameter("pharmacistName");
	String pharmacistContact=request.getParameter("pharmacistContact");
	String pharmacistEmail=request.getParameter("pharmacistEmail");
	String medicine=request.getParameter("medicine");
	String productManufacture=request.getParameter("productManufacture");
	String manufacturingDate=request.getParameter("manufacturingDate");
	String expirationDate=request.getParameter("expirationDate");
	String noPrescription=request.getParameter("noPrescription");
	String dateFirst=request.getParameter("dateFirst");
	String dateStopped=request.getParameter("dateStopped");
	String personpDetails=request.getParameter("personpDetails");
	String anotherProduct=request.getParameter("anotherProduct");
	String problemOccured=request.getParameter("problemOccured");
	String reactionBycustomer=request.getParameter("reactionBycustomer");
	String sideEffect=request.getParameter("sideEffect");
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
	 int i=st.executeUpdate("insert into pharmacistADRs(pharmacistName,pharmacistContact,pharmacistEmail,medicine,productManufacture,manufacturingDate,expirationDate,noPrescription,dateFirst,dateStopped,personpDetails,anotherProduct,problemOccured,reactionBycustomer,sideEffect,userLogin) values('"+pharmacistName+"','"+pharmacistContact+"','"+pharmacistEmail+"','"+medicine+"','"+productManufacture+"','"+manufacturingDate+"','"+expirationDate+"','"+noPrescription+"','"+dateFirst+"','"+dateStopped+"','"+personpDetails+"','"+anotherProduct+"','"+problemOccured+"','"+reactionBycustomer+"','"+sideEffect+"','"+userLogin+"')");
	  response.sendRedirect("reportADRError.jsp");
}	 
 catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("/ADR/HTML/PharmacistFormError.html");
} 
%>
		