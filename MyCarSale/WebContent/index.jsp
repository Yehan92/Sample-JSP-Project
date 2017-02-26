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


<script>
function carload(limit1,limit2) {
	alert(limit1);
  var xhttp;
  if (window.XMLHttpRequest) {
    // code for modern browsers
    xhttp = new XMLHttpRequest();
    } else {
    // code for IE6, IE5
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	 //document.getElementById("demo").innerHTML = this.responseText;
    	 
    	 //alert(this.responseText);
    	 cars=JSON.parse(this.responseText);
    	 var car_panels=document.getElementsByName("carPanels");
    	 alert(car_panels);
    	 for (i=1;i<=3;i++)
    	    {
				alert(car_panels[i-1].getElementsByClassName('title')[0]);
    	        car_panels[i-1].getElementsByClassName('title')[0].innerHTML = cars[i-1].title;
    	        car_panels[i-1].getElementsByClassName('dis')[0].innerHTML = cars[i-1].dis;
    	        car_panels[i-1].getElementsByClassName('price')[0].innerHTML = cars[i-1].price;
    	      
    	    }
    }
  };
  alert("carload?limit1="+limit1 + "& limit2="+limit2);
  xhttp.open("GET", "carload?limit1="+limit1 + "&limit2="+limit2, true);
  xhttp.send();
}
</script>
</head>
<body>
	<div class="container">
		<%@include file="WEB-INF/pages/header.jsp" %>
		
		<%
		
		int count=0;
		int pgcount=0;
		String sql = "SELECT * FROM car limit 3";
		String sql2 = "select count(*) as c from car";
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/carsale";
		Connection con = DriverManager.getConnection(url, "root","123,");
		PreparedStatement ps = con.prepareStatement(sql);
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ResultSet rs2 = ps2.executeQuery();
		ResultSet rs = ps.executeQuery();
		
		if(rs2.next()){
			count = Integer.parseInt(rs2.getString("c")) ;
		}
		
		if(count%3!=0){
			pgcount=(count/3)+1;
		}else{
			pgcount=count/3;
		}
		int i=0;
		int div=1;
		while(rs.next()){
			String id = rs.getString("id");
			String title = rs.getString("title");
			String description = rs.getString("description");
			String price = rs.getString("price");
			String photo = rs.getString("photo");
			i++;
			%>
			
			<div class="jumbotron">
				<div class="row">
					<div class="col-md-4">
						<img src='images/default.png' class="img img-responsive img-thumbnail"/>
					</div>
					<div class="col-md-8" name="carPanels" >
						<h1 class="title"> <%=title %></h1>
						<p class="dis"> <%=description %></p>
						<kbd class="price" ><%=price %></kbd>
						<hr/>
						<a href="car_view.jsp?id=<%=id %>" class="btn btn-success"> MORE</a>
						
						

						
					</div>
				</div>
			</div>
			
		<%
		div++;
		}
		%>
		
		<div class="row" align="center" style="background-color: blue;">

		<%
		 
		for(int j=1;j<=pgcount;j++){
			%>
			
			<ul class="pagination">
			 <li><a onclick="carload(<%=j*3%>,<%=(j-1)*3%>)"><%=j %></a></li>
			 
			</ul>
			
			<% 
		}
		
		%>
		</div>
		
		
		<%@include file="WEB-INF/pages/footer.jsp" %>
	</div>
</body>
</html>