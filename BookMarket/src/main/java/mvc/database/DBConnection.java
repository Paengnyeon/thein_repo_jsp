package mvc.database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DBConnection {
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException  {		

		Connection conn = null;		

		String url = "jdbc:postgresql://localhost:5432/postgres";
		String user = "postgres";
		String password = "1234";

		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection(url, user, password);		
		
		return conn;
	}
}