package mc.com.tests;

import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;

public class JdbcSqlServerTests {

	@Test
	public void test() {
		String connectionUrl = "jdbc:sqlserver://mcdbserver2018.database.windows.net:1433;database=mcDB;user=MC;"
				+ "password=8cWX+<4d;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
		
		//jdbc:sqlserver://<server>:<port>;databaseName=AdventureWorks;user=<user>;password=<password>";
		try (Connection con = DriverManager.getConnection(connectionUrl);  	Statement stmt = con.createStatement();) {
			
			assertNotNull(con);
			
			String SQL = "SELECT * FROM Users";
			ResultSet rs = stmt.executeQuery(SQL);
			while (rs.next()) 
				System.out.println(rs.getObject(2));
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
