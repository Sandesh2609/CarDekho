<%@page import="com.jspiders.carJSP.CarJDBC"%>
<%@page import="com.jspiders.carJSP.object.Car"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

* {
	padding: 0px;
	margin: 0px;
}


table {
background-color: rgb(176, 197, 164);
  border-collapse: collapse;
  width: 80%;
  margin: 50px auto;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}

.more-features {
  margin-top: 20px;
}

.more-features{
      margin: 50px auto;
      margin-left:35%;
      display: inline-block;
}
.more-features a {


  padding: 5px 10px;
  margin-bottom: 5px;
  color: #333;
  text-decoration: none;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.more-features a:hover {
  background-color: #eee;
}

	</style>

<body>
<div id="parent">

<%
@SuppressWarnings("unchecked")
List<Car> cars = CarJDBC.showCars() ;
if (cars != null && cars.size() > 0) {
	%>
	<h1 align="center" style="color: green; margin: 50px auto; font-size: 50px">Available Cars</h1>
	<div align="center">
		<table border="1px solid">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>BRAND</th>
				<th>FUEL</th>
				<th>PRICE</th>
				<th>COLOR</th>
			</tr>
			<%
			for (Car car : cars) {
			%>
			<tr>
				<td><%=car.getId()%></td>
				<td><%=car.getName()%></td>
				<td><%=car.getBrand()%></td>
				<td><%=car.getFuel()%></td>
				<td><%=car.getPrice()%></td>
				<td><%=car.getColor()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div><%
	} else {
	%>
	<div align="center">
		<h3   style="color: red;">Car details unavailable</h3>
	</div>

	<%
	}
	%>
	<div class="more-features"> 
	 <a href="http://localhost:8080/carJSP/add_car.jsp">Add Car</a>
		<a href="http://localhost:8080/carJSP/delete_car.jsp">Delete Car</a>
		<a href="http://localhost:8080/carJSP/update_car.jsp">Update Car</a>	
		<a href="http://localhost:8080/carJSP/search_car.jsp">Search Car</a>
	</div>
	
	</div>
	


</body>
</html>