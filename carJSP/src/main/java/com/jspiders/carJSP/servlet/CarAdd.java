package com.jspiders.carJSP.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspiders.carJSP.CarJDBC;

@WebServlet("/add_car")
public class CarAdd extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id")); 
		String name= req.getParameter("name");
		String brand= req.getParameter("brand");
		String fuel= req.getParameter("fuel");
		double price = Double.parseDouble(req.getParameter("price")); 
		String color= req.getParameter("color");
		resp.setContentType("text/html");
		int res= CarJDBC.addCar(id, name, brand, fuel, price, color);
		  
		if (res==1){
			req.setAttribute("message", "Car Added");
		}
		else {
			req.setAttribute("message", "Car not Added");
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("add_car.jsp");
		dispatcher.forward(req, resp);


	}
}
