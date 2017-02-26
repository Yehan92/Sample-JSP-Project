<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="WEB-INF/pages/header.jsp" %>
		
		<h1> Login Page </h1>
		<form action="login_action" method="post">		
			<fieldset>
				
				<label>Email</label>
				<input type="email" name="email" class="form-control"> 
				
				<label>Password</label>
				<input type="password" name="password" class="form-control"> 
				
				<input type="reset" value="Reset" class="btn btn-warning">
				<input type="submit" value="Login" class="btn btn-success">
				 
			</fieldset>
		</form>
		
		<%@include file="WEB-INF/pages/footer.jsp" %>
	</div>
</body>
</html>