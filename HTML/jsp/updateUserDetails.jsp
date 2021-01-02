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
	String firstName=request.getParameter("firstName");
	String lastName=request.getParameter("lastName");
	String contactNumber=request.getParameter("contactNumber");
	String emailAddress=request.getParameter("emailAddress");
	String userLogin=request.getParameter("userLogin");
	FileInputStream fis = new FileInputStream("C:/Apache/webapps/ADR/HTML/jsp/DBParameters.properties");
	Properties prop = new Properties();
	prop.load(fis);
	 userName= prop.getProperty("userName");
	 dbPassword= prop.getProperty("password");
	 url= prop.getProperty("url");
try {
	  Class.forName("com.mysql.jdbc.Driver"); 
	  java.sql.Connection con = DriverManager.getConnection(url,userName,dbPassword); 
	  String query = "update registeredUsers set firstName=?,lastName=?,contactNumber=?,emailAddress=? where userLogin = ?";
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setString(1, firstName);
      preparedStmt.setString(2, lastName);
	  preparedStmt.setString(3, contactNumber);
	  preparedStmt.setString(4, emailAddress);
	  preparedStmt.setString(5, userLogin);
      int recordProcessed=preparedStmt.executeUpdate();
	  if(recordProcessed<1){
		response.sendRedirect("updateProfileError.jsp");
	  }else{
		response.sendRedirect("updateProfileSuccess.jsp");
	  }  
	}	 
 catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("updateProfileError.jsp");
} 
	%>