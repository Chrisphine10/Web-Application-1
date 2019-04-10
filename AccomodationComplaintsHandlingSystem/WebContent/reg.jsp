<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<%@ page import ="java.sql.*" %>
	<%@ page import ="javax.sql.*" %>
	<%
	
	String fname=request.getParameter("fname"); 
	String lname=request.getParameter("lname");
	String uname=request.getParameter("uname"); 
	String pwd=request.getParameter("pwd"); 
	String email=request.getParameter("email");
	

	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/accommodation_complaints_handling_system",
	"root","1234"); 
	
	Statement st= con.createStatement(); 
	ResultSet rs; 
	
	PreparedStatement ps;
	String query = "INSERT INTO login_register (u_fname, u_lname, u_uname, u_pass, u_email) VALUES(?,?,?,?,?)";
	
		ps = con.prepareStatement(query);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, uname);
		ps.setString(4, pwd);
		ps.setString(5, email);
		
		if(ps.executeUpdate()>0) {
			out.println("New User Add");
		}
		else
		{
			out.println("error");
		}
	
	%>
</body>
</html>