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
	String registerAs=request.getParameter("registerAs");
	String firstName=request.getParameter("firstName");
	String lastName=request.getParameter("lastName");
	String contactNumber=request.getParameter("contactNumber");
	String emailAddress=request.getParameter("emailAddress");
	String userLogin=request.getParameter("userLogin");
	String password=request.getParameter("password");
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
	Statement selectStatement = con.createStatement();
	String sql = "select * from registeredUsers where userLogin='"+userLogin+"'";
	 ResultSet resultSet = selectStatement.executeQuery(sql);
	 if(resultSet.next()==false){
				Statement updateStatement= con.createStatement();
				int i=updateStatement.executeUpdate("insert into registeredUsers(registerAs,firstName,lastName,contactNumber,emailAddress,userLogin,password,confirmPassword) values('"+registerAs+"','"+firstName+"','"+lastName+"','"+contactNumber+"','"+emailAddress+"','"+userLogin+"','"+password+"','"+confirmPassword+"')");
				response.sendRedirect("/ADR/HTML/RegisteredMemberLogin.html");	
		 }else{
				response.sendRedirect("/ADR/HTML/UserAlreadyExistRegister.html");
		 }
}	 
 catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("/ADR/HTML/RegisterUserError.html");
} 
%>
		