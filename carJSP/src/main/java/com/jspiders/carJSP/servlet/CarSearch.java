package com.jspiders.carJSP.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspiders.carJSP.CarJDBC;
import com.jspiders.carJSP.object.Car;

@WebServlet("/search_car")
public class CarSearch extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String searchOption = req.getParameter("searchOption");
		String searchValue = req.getParameter("serachvalue");
		List<Car> cars = new ArrayList<Car>();
		switch (searchOption) {
		case "id":
			cars = CarJDBC.searchCarById(searchValue);
			break;

		case "name":
			cars = CarJDBC.searchCarByName(searchValue);

			break;
		case "brand":
			cars = CarJDBC.searchCarByBrand(searchValue);

			break;

		case "fuel":
			cars = CarJDBC.searchCarByFuel(searchValue);

			break;

		case "color":
			cars = CarJDBC.searchCarByColor(searchValue);

			break;

		default:
			
			break;
		}
		
		if (cars.size()>0) {
			req.setAttribute("cars", cars);
		}else {
			req.setAttribute("message", "CAR NOT FOUND");
		}

	
	RequestDispatcher requestDispatcher = req.getRequestDispatcher("search_car.jsp");
	requestDispatcher.forward(req, resp);
	}
	
	

}
