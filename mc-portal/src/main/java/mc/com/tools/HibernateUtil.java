package mc.com.tools;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
	private static final String CURRENT_DB = "MYSQL";
	
	private static final String MYSQL_DB_PROPERTIES = "hibernate.properties";
	private static final String MSSQL_DB_PROPERTIES = "hibernate-mss.properties";
		
	private static StandardServiceRegistry registry;
	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {
		
		if (sessionFactory == null) {
			try {
				registry = new StandardServiceRegistryBuilder()
						.configure()
						.loadProperties(CURRENT_DB.equals("MYSQL")?MYSQL_DB_PROPERTIES:MSSQL_DB_PROPERTIES)
						.build();

				Metadata metadata = new MetadataSources(registry).getMetadataBuilder().build();
				sessionFactory = metadata.getSessionFactoryBuilder().build();
			} catch (Exception e) {
				e.printStackTrace();
				if (registry != null) {
					StandardServiceRegistryBuilder.destroy(registry);
				}
			}
		}
		return sessionFactory;
	}
	public static void shutdown() {
		if (registry != null) {
			StandardServiceRegistryBuilder.destroy(registry);
		}
	}	
	public static String getInfo() {
		if(getSessionFactory()==null)
			return "No Connection!";
		
		String[] parts =  getSessionFactory().getProperties().get("hibernate.dialect").toString().split("\\.");
		return parts[parts.length-1]+" : "+getSessionFactory().getProperties().get("hibernate.connection.url").toString();
	}
	
}
