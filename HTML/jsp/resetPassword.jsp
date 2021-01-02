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
	String userLogin=request.getParameter("userLogin");
	String password=request.getParameter("newPassword");
	String confirmPassword=request.getParameter("confirmPassword");
	FileInputStream fis = new FileInputStream("C:/Apache/webapps/ADR/HTML/jsp/DBParameters.properties");
	Properties prop = new Properties();
	prop.load(fis);
	 userName= prop.getProperty("userName");
	 dbPassword= prop.getProperty("password");
	 url= prop.getProperty("url");
	
try {
	  Class.forName("com.mysql.jdbc.Driver"); 
	  java.sql.Connection con = DriverManager.getConnection(url,userName,dbPassword); 
	  String query = "update registeredUsers set password = ? ,confirmPassword=? where userLogin = ?";
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setString(1, password);
      preparedStmt.setString(2, confirmPassword);
	   preparedStmt.setString(3, userLogin);
      // execute the java preparedstatement
      int recordProcessed=preparedStmt.executeUpdate();
	  if(recordProcessed<1){
		response.sendRedirect("/ADR/HTML/ForgotPasswordFail.html");
	  }else{
		response.sendRedirect("/ADR/HTML/MemberLoginPasswordReset.html");
	  }  
}	 
 catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("/ADR/HTML/ForgotPasswordFail.html");
} 
%>
		