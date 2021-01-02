<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
	String userName=null;
	String dbPassword = null;
	String url=null;
	String path=System.getProperty("user.dir");
	String userLogin=request.getParameter("userLogin");
	String adrid=request.getParameter("adrid");
	String medicine=request.getParameter("medicine");
	String replay=request.getParameter("replay");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String replayDate = sdf.format(new Date());
	FileInputStream fis = new FileInputStream("C:/Apache/webapps/ADR/HTML/jsp/DBParameters.properties");
	Properties prop = new Properties();
	prop.load(fis);
	userName= prop.getProperty("userName");
	dbPassword= prop.getProperty("password");
	url= prop.getProperty("url");
	
try {
	 Class.forName("com.mysql.jdbc.Driver"); 
	 java.sql.Connection con = DriverManager.getConnection(url,userName,dbPassword); 
	 Statement st= con.createStatement();
	 int i=st.executeUpdate("insert into communication(userLogin,adrid,medicine,msg,replayDate) values('"+userLogin+"','"+adrid+"','"+medicine+"','"+replay+"','"+replayDate+"')");
	 response.sendRedirect("adminProfileReplaySent.jsp");
}	 
 catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("showPatientADRsError.jsp");
} 
%>