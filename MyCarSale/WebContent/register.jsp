<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="WEB-INF/pages/header.jsp" %>
		
		<h1> Registration Page </h1>
		<form action="register_action" method="post">		
			<fieldset>
				<legend>Member Details</legend>
				<label>Name</label>
				<input type="text" name="name" class="form-control"> 
				
				<label>Email</label>
				<input type="email" name="email" class="form-control"> 
				
				<label>Phone</label>
				<input type="tel" name="tp" class="form-control"> 
				
				<label>Password</label>
				<input type="password" name="password" class="form-control"> 
				
				<label>Confirm</label>
				<input type="password" name="confirm" class="form-control"> 
				
				<input type="reset" value="Reset" class="btn btn-warning">
				<input type="submit" value="Post" class="btn btn-success">
				 
			</fieldset>
		</form>
		<%@include file="WEB-INF/pages/footer.jsp" %>
	</div>
</body>
</html>