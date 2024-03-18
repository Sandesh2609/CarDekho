package com.jspiders.carJSP.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspiders.carJSP.CarJDBC;
import com.jspiders.carJSP.object.Car;

@WebServlet("/show_car")
public class CarShow extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Car> cars = CarJDBC.showCars();
		req.setAttribute("cars", cars);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("show_car.jsp");
		requestDispatcher.forward(req, resp);
	}

}
