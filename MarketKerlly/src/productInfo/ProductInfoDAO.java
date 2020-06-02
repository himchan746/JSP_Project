package productInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ProductInfoDAO {
	private Connection con;
	public ProductInfoDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ajh","1234");
		} catch (ClassNotFoundException e) {
			System.out.println("driver not found");
		} catch (SQLException e) {
			System.out.println("connection failed");
		}
		
	}
}
