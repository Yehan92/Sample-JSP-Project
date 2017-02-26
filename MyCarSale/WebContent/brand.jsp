<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brand Page</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%@include file="WEB-INF/pages/header.jsp" %>
		
		<h1> Add New Brand </h1>
		<form action="brand_action" method="post">		
			<fieldset>
				
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