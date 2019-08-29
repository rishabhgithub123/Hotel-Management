

import java.sql.*;

public class DBconnection {

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_management", "root", "rishabhsql");
		return c;

	}

}
