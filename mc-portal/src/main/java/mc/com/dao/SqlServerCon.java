package mc.com.dao;

public class SqlServerCon {

	
	public SqlServerCon() {
		String cs="jdbc:sqlserver://mc-admin-server.database.windows.net:1433;database=mc-admin-bd-sql;user=mc@mc-admin-server;password={your_password_here};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
		
	}
}
