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

div table {
	background-color: rgb(176, 197, 164);
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
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

span table {
	margin-left: 45%
}
input[type="text"] {
  width: 90%%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
.more-features {
  margin-top: 20px;
}

.more-features{
      
      margin: 20px auto;
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
	<%
	@SuppressWarnings("unchecked")
	List<Car> cars = CarJDBC.showCars();
	if (cars != null && cars.size() > 0) {
	%>
	<h1 align="center"
		style="color: green; margin: 20px auto; font-size: 50px">Available
		Cars</h1>
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
	</div>
	<%
	} else {
	%>
	<div align="center">
		<h3 style="color: red;">Car details unavailable</h3>
	</div>

	<%
	}
	%>

	<span align="center">
		<form action="delete_car" method="post">
			<table>
				<tr>
					<td><label for="imp1">ID: </label></td>
					<td><input type="text" name="id" id="imp1"
						placeholder="enter car id for delete car"></td>
				</tr>
			</table>
			<br style=""> <input type="submit" value="DELETE">
		</form>
	</span>
	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<div align="center"> <h1 style="color: red;"><%= message%></h13>
	</div>
	<%
	}
	%>
	<div class="more-features"> 
	 <a href="http://localhost:8080/carJSP/show_car">Show All Cars</a>
	  <a href="http://localhost:8080/carJSP/add_car.jsp">Add Car</a>
		<a href="http://localhost:8080/carJSP/update_car.jsp">Upadte Car</a>	
		<a href="http://localhost:8080/carJSP/search_car.jsp">Search Car</a>	
	</div>
	


</body>
</html>