package mc.com.tests;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import mc.com.beans.Category;
import mc.com.business.PostManager;
import mc.com.tools.HibernateUtil;

public class HibernateCrudTests {
	public final static Logger logger = Logger.getLogger(HibernateCrudTests.class);

	@Test
	public void test() {
		
		String file="C:\\Eclipse201809\\servers\\wildfly-14.0.1.Final\\standalone\\deployments\\mc-website.war\\views\\uploads\\post_22102018_114158.htm";
		String tags="android;java;jee;tests";
		
		try {
			new PostManager().create(1, "java-post", "post-description..", file, tags.split(";") );
		} catch (Exception e) {
			System.out.println(e);
		}
		
//		Category cat= new Category(0,"New Category!");
//		logger.info("****************************************************");
//		Boolean result = create(cat);
//		
//		logger.info("Category : "+cat+" ==> "+result);
//		logger.info("****************************************************");
	}
	public static Boolean create(Category cat) {
		Boolean result = true;
		Session session = null;
		Transaction transaction = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			session.save(cat);
			transaction.commit();
		} catch (Exception e) {
			result = false;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

}
