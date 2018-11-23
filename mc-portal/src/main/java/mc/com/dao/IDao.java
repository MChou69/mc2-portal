package mc.com.dao;

import java.util.List;

public interface IDao<T> {
	List<T> findAll();
	T findById(int id);
	
	T add(T item);
	T update(T item);
	void delete(int id);
}
