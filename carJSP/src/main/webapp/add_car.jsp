<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

* {
	padding: 0px;
	margin: 0px;
}
body {
  font-family: Arial, sans-serif;
}

h2 {
font-size:40px;
color:green;
  margin:100px auto 50px auto;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  color: #333; /* Same color for labels */
}

input[type="text"] {
  width: 100%;
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
		<h2>Enter Car Details</h2>
		<form action="add_car" method="post">
			<table >
				<tr>
					<td><label for="imp1">ID: </label></td>
					<td><input type="text" name="id" id="imp1" placeholder="enter car id"></td>
				</tr>
				<tr>
					<td><label for="imp2">Name: </label></td>
					<td><input type="text" name="name" id="imp2" placeholder="enter car name"></td>
				</tr>
				<tr>
					<td><label for="imp3">Brand: </label></td>
					<td><input type="text" name="brand" id="imp3" placeholder="enter car brand"></td>
				</tr>
				<tr>
					<td><label for="imp4">Fuel Type: </label></td>
					<td><input type="text" name="fuel" id="imp4" placeholder="enter fuel type"></td>
				</tr>
				<tr>
					<td><label for="imp5">Price: </label></td>
					<td><input type="text" name="price" id="imp5" placeholder="enter car price"></td>
				</tr>
				<tr>
					<td><label for="imp6">Color: </label></td>
					<td><input type="text" name="color" id="imp6" placeholder="enter car color"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="ADD CAR">
		</form>
	</div>

	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<div align="center">
		<h1 style="color: green;"><%=message%>
		</h1>
	</div>
	<%
	}
	%>
	
	<div class="more-features"> 
	 <a href="http://localhost:8080/carJSP/show_car">Show All Cars</a>
		<a href="http://localhost:8080/carJSP/delete_car.jsp">Delete Car</a>
		<a href="http://localhost:8080/carJSP/update_car.jsp">Upadte Car</a>	
		<a href="http://localhost:8080/carJSP/search_car.jsp">Search Car</a>	
	</div>
	



</body>
</html>