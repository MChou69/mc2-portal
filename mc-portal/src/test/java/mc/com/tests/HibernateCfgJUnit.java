package mc.com.tests;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import mc.com.tools.HibernateUtil;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class HibernateCfgJUnit {
	public final static Logger logger = Logger.getLogger(HibernateCrudTests.class);

//	@Test
//	public void Test1Connection() {
//		logger.info("******************************************************");
//		logger.info("************* JUnit Test : Connection ****************");
//		logger.info("******************************************************");
//		SessionFactory sessionFactory= HibernateUtil.getSessionFactory();	
//		assertNotNull(sessionFactory);
//		logger.info("Session Factory : "+sessionFactory);
//		if(sessionFactory!=null) {
//			Session session = sessionFactory.openSession();
//			assertNotNull(session);		
//			logger.info("Session Hibernate : "+session);
//		}
//	}

	@Test
	public void Test2Session() {
		logger.info("******************************************************");
		logger.info("***************** JUnit Test : CRUD ******************");
		logger.info("******************************************************");

		try {
			SessionFactory sessionFactory= HibernateUtil.getSessionFactory();
			logger.info("SessionFactory : "+ sessionFactory);
//			Session session = HibernateUtil.getSession();		
//			logger.info("Session : "+ session);
//			logger.info("session.isConnected() : "+session.isConnected());
		} catch (Exception e) {
			logger.info("Exception : "+ e.getMessage());
		}
		
		//		Todo todo = new Todo("hibernate test!",2);
		//		
		//		Transaction tx = session.getTransaction();
		//		tx.begin();
		//		Serializable id = session.save(todo);
		//		tx.commit();
		//		
		//		session.close();
		//		logger.info("todo : "+id+" ==> "+todo);
		
		logger.info("******************************************************");
		
		//		SessionFactory sessionFactory= HibernateUtil.getSessionFactory();	
		//		Session session = sessionFactory.openSession();	
		//		
		//
		//		CriteriaQuery<Post> criteriaQuery = session.getCriteriaBuilder().createQuery(Post.class);
		//        criteriaQuery.from(Post.class);
		//        List<Post> items = session.createQuery(criteriaQuery).getResultList();
		//        
		//		items.forEach((item) -> System.out.println(item));

		//		IDao dao1= new CategoryDao();
		//		IDao dao2= new PostDao();
		//
		//		//		Categories cat= new Categories(0,"Java/Jee");
		//		//		Categories new_cat=(Categories) dao1.add(cat);
		//		
		//		dao1.findAll().forEach(
		//				(item)-> logger.info(item)
		//		);
		//
		//		Category new_cat= (Category) dao1.findById(2);
		//		
		//		logger.info("******************************************************");
		//		//Post post= new Post(new_cat, "Maven Create archetype", "desc..", "post_20181019_143012.htm");
		//		//dao2.add(post);
		//
		//		dao2.findAll().forEach(
		//				(item)-> logger.info(item)
		//				);
		//		logger.info("******************************************************");
		//

		//		dao2.findAll().forEach(
		//				(item)-> logger.info(item)
		//		);
		//		
		/*		SessionFactory sessionFactory= HibernateUtil.getSessionFactory();	
		Session session = sessionFactory.openSession();	

		//Insert
		User u= new User("MC2");


		//Update
		u.setName("XXXXXX");
		session.getTransaction().begin();
		session.merge(u);
		session.getTransaction().commit();

		//Select
//		Criteria criteria =  session.createCriteria(User.class);				
//		List<User> users =  criteria.list();		

		CriteriaQuery<User> criteria = session.getCriteriaBuilder().createQuery(User.class);	
		criteria.select(criteria.from(User.class));	
		List<User> users= session.createQuery(criteria).getResultList();

		for (User user : users) {
			logger.info(user);
		}
		logger.info("******************************************************");

		//Delete
		session.getTransaction().begin();
		session.delete(u);
		session.getTransaction().commit();

		//Select
		users = session.createQuery(criteria).getResultList();
		for (User user : users) {
			logger.info(user);
		}
		 */
	}
	@Test
	public void Test3Session() {
//		logger.info("******************************************************");
//		Session session = HibernateUtil.getSession();
//		Todo todo2 = new Todo("hibernate test2!",1);
//		
//		Transaction tx = session.getTransaction();
//		tx.begin();
//		Serializable id = session.save(todo2);
//		tx.commit();
//		session.close();
//		logger.info("todo 2 : "+id+" ==> "+todo2);
		
//		logger.info("******************************************************");
	}
}
