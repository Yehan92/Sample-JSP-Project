<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Car Sale Home Page</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="WEB-INF/pages/header.jsp" %>
		
		<h1>Brand List</h1>
		<a href='brand.jsp' class="btn btn-success glyphicon glyphicon-plus"></a>
		<br/><br/>
		<table class="table table-striped">
			<tr>
				<th> ID </th>
				<th> NAME </th>
				<th> OPERATIONS</th>
			</tr>
			
			<%
			String sql = "SELECT * FROM brand";
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/dbcarsale";
			Connection con = DriverManager.getConnection(url, "root","0147");
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String id = rs.getString("id");
				String name = rs.getString("name");
				out.print("<tr>");
				out.print("<td> "+id+" </td>");
				out.print("<td> "+name+" </td>");
				out.print("<td> <a href='' class='btn'> DELETE </a> </td>");
				out.print("</tr>");
			}
			%>
			
		</table>
		
		<%@include file="WEB-INF/pages/footer.jsp" %>
	</div>
</body>
</html>