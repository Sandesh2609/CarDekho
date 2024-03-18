<%@page import="com.jspiders.carJSP.object.Car"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
* {
	padding: 0px;
	margin: 0px;
}



label {
    font-size:30px;
  display: block;
  margin-bottom: 5px;
  color: #333; ]
}

input[type="text"] {
  width: 20%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button[type="submit"] {
  padding: 10px 20px;
  background-color: #007bff; 
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button[type="submit"]:hover {
  background-color: #0056b3; 
}
.more-features {
  margin-top: 20px;
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
</head>
<body>
	<div align="center">
		<h2 style="color: green; margin: 50px auto 10px auto; font-size: 50px">Search Car</h2>
		<form action="search_car" method="post">
			<label id="lab1" for="">Search by:</label> <select name="searchOption">
				<option value="id" disabled="disabled" selected="selected">SELECT A searchBy option</option>
				<option value="id">Id</option>
				<option value="name">Name</option>
				<option value="brand">Brand</option>
				<option value="fuel">Fuel</option>
				<option value="color">Color</option>
			</select> <br> <br> <input type="text" name="serachvalue"> <br>
			<br> <input type="submit" name="SEARCH CAR">
		</form>
	</div>
	<div>
		<%!String message;%>
		<%
		message = (String) request.getAttribute("message");
		%>
		<%
		if (message != null) {
		%>
		<h4 align="center"  style="color: red; margin: 50px auto; font-size: 50px" ><%=message%>
		</h4>
		<%
		}
		%>
	</div>

	<%
	List<Car> cars = (List<Car>) request.getAttribute("cars");
	if (cars != null && cars.size() > 0) {
	%>
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
	}
	%>
	</div>
	
	<div class="more-features"> 
	 <a href="http://localhost:8080/carJSP/show_car">Show All Cars</a>
	 <a href="http://localhost:8080/carJSP/add_car.jsp">Add Car</a>
		<a href="http://localhost:8080/carJSP/delete_car.jsp">Delete Car</a>
		<a href="">Upadte Car</a>	
	</div>



</body>
</html>