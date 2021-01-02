<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
	<%
	String userName=null;
	String dbPassword = null;
	String url=null;
	String path=System.getProperty("user.dir");
	String nameDoctor=request.getParameter("nameDoctor");
	String contactDoctor=request.getParameter("contactDoctor");
	String emailAddress=request.getParameter("emailAddress");
	String occupation=request.getParameter("occupation");
	String medicineBydrprescription=request.getParameter("medicineBydrprescription");
	String doseQuantity=request.getParameter("doseQuantity");
	String doseType=request.getParameter("doseType");
	String therapyStart=request.getParameter("therapyStart");
	String therapyEnd=request.getParameter("therapyEnd");
	String dateProblemoccu=request.getParameter("dateProblemoccu");
	String majorIssue=request.getParameter("majorIssue");
	String majorProblem=request.getParameter("majorProblem");
	String dateEvent=request.getParameter("dateEvent");
	String describrEvent=request.getParameter("describrEvent");
	String relevantTests=request.getParameter("relevantTests");
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
	 int i=st.executeUpdate("insert into doctoradrs(nameDoctor,contactDoctor,emailAddress,occupation,medicine,doseQuantity,doseType,therapyStart,therapyEnd,dateProblemoccu,majorIssue,majorProblem,dateEvent,describrEvent,relevantTests,userLogin) values('"+nameDoctor+"','"+contactDoctor+"','"+emailAddress+"','"+occupation+"','"+medicineBydrprescription+"','"+doseQuantity+"','"+doseType+"','"+therapyStart+"','"+therapyEnd+"','"+dateProblemoccu+"','"+majorIssue+"','"+majorProblem+"','"+dateEvent+"','"+describrEvent+"','"+relevantTests+"','"+userLogin+"')");
	  response.sendRedirect("profileADRRaised.jsp");
}	 
 catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("reportADRError.jsp");
} 
%>
		