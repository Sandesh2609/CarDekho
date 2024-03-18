package com.jspiders.carJSP.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspiders.carJSP.CarJDBC;

@WebServlet("/update_car")
public class CarUpdate extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int carId = Integer.parseInt(req.getParameter("carId"));
		String property = req.getParameter("property");
		String newValue = req.getParameter("newValue");
		int res = 0;

		switch (property) {

		case "name":
			res = CarJDBC.updateName(carId,  newValue);

			break;
		case "brand":
			res = CarJDBC.updateBrand(carId,  newValue);
			break;

		case "fuel":
			res = CarJDBC.updateFuel(carId,  newValue);

			break;

		case "color":
			res = CarJDBC.updateColor(carId,  newValue);

			break;
			
		case "price":
			res = CarJDBC.updatePrice(carId, newValue);

			break;

		default:

			break;
		}
		
		if(res ==1) {
			req.setAttribute("message", "Car Details updateed");
		}else {
			req.setAttribute("message", "Car Details not updateed");
			
		}
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("update_car.jsp");
		requestDispatcher.forward(req, resp);

	}

}
