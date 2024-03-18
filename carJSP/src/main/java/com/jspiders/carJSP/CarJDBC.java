package com.jspiders.carJSP;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspiders.carJSP.object.Car;

public class CarJDBC {

	private static Driver driver;
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static ResultSet resultSet;
	private static String query;

	private static void openConnection() throws SQLException {

		driver = new com.mysql.cj.jdbc.Driver();
		DriverManager.registerDriver(driver);
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/weja4", "root", "root");
	}

	private static void closeConnection() throws SQLException {
		if (connection != null) {
			connection.close();
		}
		if (preparedStatement != null) {
			preparedStatement.close();
		}
		if (resultSet != null) {
			resultSet.close();

		}
		DriverManager.deregisterDriver(driver);
	}

//..................................................................................................................	

	public static int addCar(int id, String name, String brand, String fuel, double price, String color) {
		int res = 0;
		try {
			openConnection();

			query = "INSERT INTO carjsp VALUES(?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, brand);
			preparedStatement.setString(4, fuel);
			preparedStatement.setDouble(5, price);
			preparedStatement.setString(6, color);

			res = preparedStatement.executeUpdate();
			System.out.println(res + " row[s] affected");
			closeConnection();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;

	}

//	..........................................................................................................

	public static List<Car> showCars() {

		List<Car> cars = new ArrayList<>();

		try {
			openConnection();
			query = "SELECT * FROM carjsp";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setFuel(resultSet.getString(4));
				car.setPrice(resultSet.getDouble(5));
				car.setColor(resultSet.getString(6));
				cars.add(car);
			}

			closeConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cars;
	}

//	.............................................................................................................

	public static int deletecar(int id) {

		int res = 0;
		try {
			openConnection();
			query = "DELETE FROM carjsp WHERE id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			res = preparedStatement.executeUpdate();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

//	................................................................................................

	public static List<Car> searchCarById(String searchValue) {
		List<Car> cars = new ArrayList<>();

		int id = Integer.parseInt(searchValue);
		try {
			openConnection();
			query = "SELECT * FROM carjsp WHERE id= ? ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setFuel(resultSet.getString(4));
				car.setPrice(resultSet.getDouble(5));
				car.setColor(resultSet.getString(6));
				cars.add(car);
			}

			closeConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cars;
	}
//	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public static List<Car> searchCarByName(String searchValue) {
		List<Car> cars = new ArrayList<>();
		String name = searchValue;
		try {
			openConnection();
			query = "SELECT * FROM carjsp WHERE  NAME= ? ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, name);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setFuel(resultSet.getString(4));
				car.setPrice(resultSet.getDouble(5));
				car.setColor(resultSet.getString(6));
				cars.add(car);
			}

			closeConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cars;

	}
//	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public static List<Car> searchCarByFuel(String searchValue) {
		List<Car> cars = new ArrayList<>();
		String fuel = searchValue;
		try {
			openConnection();
			query = "SELECT * FROM carjsp WHERE  FUEL= ? ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, fuel);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setFuel(resultSet.getString(4));
				car.setPrice(resultSet.getDouble(5));
				car.setColor(resultSet.getString(6));
				cars.add(car);
			}

			closeConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cars;

	}
//	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public static List<Car> searchCarByColor(String searchValue) {
		List<Car> cars = new ArrayList<>();
		String color = searchValue;
		try {
			openConnection();
			query = "SELECT * FROM carjsp WHERE  COLOR= ? ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, color);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setFuel(resultSet.getString(4));
				car.setPrice(resultSet.getDouble(5));
				car.setColor(resultSet.getString(6));
				cars.add(car);
			}

			closeConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cars;

	}
//	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	public static List<Car> searchCarByBrand(String searchValue) {
		List<Car> cars = new ArrayList<>();
		String brand = searchValue;
		try {
			openConnection();
			query = "SELECT * FROM carjsp WHERE  BRAND = ? ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, brand);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setFuel(resultSet.getString(4));
				car.setPrice(resultSet.getDouble(5));
				car.setColor(resultSet.getString(6));
				cars.add(car);
			}

			closeConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cars;
	}

//	------------------------------------------------------------------------------------------------------------

	public static int updateName(int carId,  String newValue) {
		int res = 0;

		try {
			openConnection();
			query = "UPDATE carjsp set NAME =? WHERE ID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, newValue);
			preparedStatement.setInt(2, carId);
			res = preparedStatement.executeUpdate();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;

	}

	public static int updateBrand(int carId,  String newValue) {
		int res = 0;

		try {
			openConnection();
			query = "UPDATE carjsp set BRAND =? WHERE ID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, newValue);
			preparedStatement.setInt(2, carId);
			res = preparedStatement.executeUpdate();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;

	}

	public static int updateFuel(int carId,  String newValue) {
		int res = 0;

		try {
			openConnection();
			query = "UPDATE carjsp set FUEL =? WHERE ID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, newValue);
			preparedStatement.setInt(2, carId);
			res = preparedStatement.executeUpdate();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;

	}

	public static int updateColor(int carId,  String newValue) {

		int res = 0;

		try {
			openConnection();
			query = "UPDATE carjsp set COLOR = ? WHERE ID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, newValue);
			preparedStatement.setInt(2, carId);
			res = preparedStatement.executeUpdate();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;

	}

	public static int updatePrice(int carId, String newValue) {

		int res = 0;

		try {
			openConnection();
			query = "UPDATE carjsp set price =? WHERE IDs = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, newValue);
			preparedStatement.setInt(2, carId);
			res = preparedStatement.executeUpdate();
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;

	}

}
