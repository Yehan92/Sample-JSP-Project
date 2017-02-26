<div class="jumbotron" style="background-image: url(images/header.jpg); ">
	
	<h1>My Car Sales</h1>
	<p> Drive Your Dream Car</p>
	<hr/>
	
	<%
		Object log = session.getAttribute("login");
		
		
		if(log!=null){
			
			String name = (String) session.getAttribute("name");
			String post = (String) session.getAttribute("post");
			
			//Logged Users
			out.print("Welcome Mr. "+name);
			out.print("<a href='logout_action' class='btn btn-success'>Logout</a>");
			
			if(post.equals("a")){
				//If Admin
				out.print("<a href='brand_list.jsp' class='btn btn-success'>Brand List</a>");
				out.print("<a href='model_list.jsp' class='btn btn-success'>Model List</a>");
			}else if(post.equals("m")){
				//If Member
				out.print("<a href='my_adds.jsp' class='btn btn-success'>My Adds</a>");
			}
			
		}else{
			//Not Logged Users
			%>
			<a href='login.jsp' class='btn btn-success'>Login</a>
			<a href='register.jsp' class="btn btn-success">Register</a>
			<%
		}
	%>
	
	
	
	
	<a href='car.jsp' class="btn btn-warning pull-right">POST YOUR CAR</a>
	
</div>