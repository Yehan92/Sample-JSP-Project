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
<title>Model Page</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="WEB-INF/pages/header.jsp" %>
		
		<h1> Add New Model </h1>
		<form action="model_action" method="post">		
			<fieldset>
				<label>Brand</label>
				<select class="form-control" name='brand'>
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
					%>
					<option value='<%=id %>'> <%=name %> </option>
					
					<%
					}
					%>
				</select>
				
				<label>Name</label>
				<input type="text" name="name" class="form-control"> 
				
				<br/>
				<br/>
				<input type="reset" value="Reset" class="btn btn-warning">
				<input type="submit" value="Save" class="btn btn-success">
				 
			</fieldset>
		</form>
		<%@include file="WEB-INF/pages/footer.jsp" %>
	</div>
</body>
</html>