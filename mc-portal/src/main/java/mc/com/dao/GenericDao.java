package mc.com.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import mc.com.tools.HibernateUtil;

public class GenericDao<T> implements IDao<T> {
	static Session session = HibernateUtil.getSessionFactory().openSession();

	Class<T> entityClass;
	public GenericDao(Class<T> entityClass) {
		this.entityClass=entityClass;
	}
	public List<T> findAll() {
		CriteriaQuery<T> criteria = session.getCriteriaBuilder().createQuery(this.entityClass);	
		criteria.select(criteria.from(this.entityClass));	
		List<T> items= session.createQuery(criteria).getResultList();

		return items;
	}

	public T findById(int id) {
		return session.get(this.entityClass, id);
	}

	public T add(T item) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.getTransaction();
		tx.begin();
		Serializable id = session.save(item);
		tx.commit();
		session.close();
		
		System.out.println("Dao (Generic) - Add "+this.entityClass.getName()+" ==>  Item : "+item);
		System.out.println("Dao (Generic) - Add "+this.entityClass.getName()+" ==>  ID : "+id);
		return item;
	}

	public T update(T item) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.getTransaction();
		tx.begin();
		session.merge(item);
		tx.commit();
		session.close();
		
//		Transaction transObj = null;
//		Session sessionObj = null;
//		try {
//			sessionObj = HibernateUtil.getSessionFactory().openSession();
//			transObj = sessionObj.beginTransaction();
//
//			sessionObj.merge(item);
//
//			transObj.commit();
//		} catch (HibernateException exObj) {
//			if(transObj!=null){
//				transObj.rollback();
//			}
//			exObj.printStackTrace(); 
//		} finally {
//			sessionObj.close(); 
//		}

		return item;
	}

	public void delete(int id) {
		T item=findById(id);
		if(item==null)
			return;
		
		Session session = HibernateUtil.getSession();
		Transaction tx = session.getTransaction();
		tx.begin();
		session.delete(item);
		tx.commit();
		session.close();
		
//
//
//		Transaction transObj = null;
//		Session sessionObj = null;
//		try {
//			sessionObj = HibernateUtil.getSessionFactory().openSession();
//			transObj = sessionObj.beginTransaction();
//
//			session.delete(item);
//
//			transObj.commit();
//		} catch (HibernateException exObj) {
//			if(transObj!=null){
//				transObj.rollback();
//			}
//			exObj.printStackTrace(); 
//		} finally {
//			sessionObj.close(); 
//		}

	}

	//protected abstract void SetIdentityInsertOn(String OnOff);
}
