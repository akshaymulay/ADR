	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ page import="java.io.FileNotFoundException" %>
	<%@ page import="java.io.IOException" %>
	<%@ page import="java.util.Properties" %>
	<%@ page import="java.io.FileInputStream" %>
	<%@ page import ="java.sql.*" %>
	<%@page import="java.sql.*,java.util.*"%>
	<%@ page import ="javax.sql.*" %>
	<%@ page import="java.io.FileInputStream" %>
	<%@ page import="java.io.File" %>
		<%
		String userName=null;
		String dbPassword = null;
		String url=null;
		String userLogin=request.getParameter("userLogin");
		String password=request.getParameter("password");
		ResultSet resultSet = null;
		FileInputStream fis = new FileInputStream("C:/Apache/webapps/ADR/HTML/jsp/DBParameters.properties");
		Properties prop = new Properties();
		prop.load(fis);
		 userName= prop.getProperty("userName");
		 dbPassword= prop.getProperty("password");
		 String adminUsername=prop.getProperty("adminUsername");
		 String adminPassword=prop.getProperty("adminPassword");
		 url= prop.getProperty("url");
		 if(userLogin.equals(adminUsername)){
		 	if(password.equals(adminPassword)){
					session.setAttribute("userLogin",userLogin);
					response.sendRedirect("adminProfile.jsp");
			}else{
				response.sendRedirect("/ADR/HTML/InvalidDCGIPassword.html");
			}
		 }else{
		try {
		 Class.forName("com.mysql.jdbc.Driver"); 
		 java.sql.Connection con = DriverManager.getConnection(url,userName,dbPassword); 
		 Statement statement = con.createStatement();
		 String sql = "select password from registeredUsers where userLogin='"+userLogin+"'";
		 resultSet = statement.executeQuery(sql);
		 if(resultSet.next()==false){
			response.sendRedirect("/ADR/HTML/InvalidUserLogin.html");
		 }else{
			if(resultSet.getString(1).equals(password)){
						session.setAttribute("userLogin",userLogin);
						response.sendRedirect("profile.jsp");
			}else{
			response.sendRedirect("/ADR/HTML/InvalidPassword.html");
			}
		}
	}catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("/ADR/HTML/InvalidPassword.html");
	} 
	}
	%>