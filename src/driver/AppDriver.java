package driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;

public class AppDriver {
	
	public Connection getConnection() {
		String dbURL = "jdbc:mysql://dbmsprojectdb.cwlqif3r7sle.us-east-2.rds.amazonaws.com/CSProject";
		Connection dbConnection = null;
		try {
			dbConnection = DriverManager.getConnection(dbURL,"admin","dio12345");
		} catch (SQLException s){
			s.printStackTrace();
		}
		return dbConnection;
	}
	
	public void newUser(String firstname, String lastname, String email, String username, String password) throws SQLException {
		Connection dbConnection = getConnection();
		PreparedStatement sendSQL = dbConnection.prepareStatement("INSERT INTO credentials VALUES (?,?,?,?,?);");
		sendSQL.setString(1, firstname);
		sendSQL.setString(2, lastname);
		sendSQL.setString(3, email);
		sendSQL.setString(4, username);
		sendSQL.setString(5, password);
		sendSQL.execute();
		sendSQL.close();
		dbConnection.close();
	}
}
