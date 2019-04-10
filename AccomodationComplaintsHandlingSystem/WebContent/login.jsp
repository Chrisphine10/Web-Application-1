<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%
String uname=request.getParameter("uname"); 
String pwd=request.getParameter("pwd");

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/accommodation_complaints_handling_system",
		"root","1234"); 

Statement st= con.createStatement();
PreparedStatement ps;
ResultSet rs;

String query = "SELECT * FROM login_register WHERE u_uname =? AND u_pass =?"; 

	try {
ps = con.prepareStatement(query);
ps.setString(1, uname);
ps.setString(2, pwd);

rs =ps.executeQuery();

if(rs.next()) {
	response.sendRedirect("home.html");
}	

else{
	String someMessage = "Invalid Username or Password";
	out.println("<script type='text/javascript'>");
	out.println("alert(" + "'" + someMessage + "'" + ");</script>");
	out.println("</head><body></body></html>");
	response.sendRedirect("login.html");
}
	}
catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>