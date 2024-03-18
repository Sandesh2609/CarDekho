<%@page import="java.util.List"%>
<%@page import="com.jspiders.carJSP.CarJDBC"%>
<%@page import="com.jspiders.carJSP.object.Car"%>
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

* {
	padding: 0px;
	margin: 0px;
}



label {
    font-size:20px;
  display: block;
  margin-bottom: 2px;
  color: #333; ]
}

input[type="text"] {
  width: 15%;
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
</style>
<body>
<%
@SuppressWarnings("unchecked")
List<Car> cars = CarJDBC.showCars() ;
if (cars != null && cars.size() > 0) {
	%>
	<h1 align="center" style="color: green; font-size: 50px">Available Cars</h1>
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
	
	<div align="center">
	<h2 style="color: green; margin: -20px auto 20px auto;" >Update Car</h2>
    <form action="update_car" method="post">
        <label for="carId">Car ID:</label>
        <input type="text" id="carId" name="carId"><br><br>
        
        <label for="property">Property to Update:</label>
        <select id="property" name="property">
        <option value="id" disabled="disabled" selected="selected">SELECT Property for updatation</option>
            <option value="name">Name</option>
             <option value="brand">Brand</option>
            <option value="fuel">Fuel</option>
            <option value="price">Price</option>
            <option value="color">Color</option>
           
        </select><br>
        
        <label for="newValue">New Value:</label>
        <input type="text" id="newValue" name="newValue"><br><br>
       
        <input type="submit" value="Update">
    </form>
    </div>
    <%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<div align="center"> <h1 style="color: red;"><%= message%></h13>
	</div>
	<%
	}
	%>
    
    

</body>
</html>