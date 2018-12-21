package mc.com.business;

import mc.com.beans.Todo;
import mc.com.dao.GenericDao;

public class TodoManager  extends GenericDao<Todo>{

	public TodoManager() {
		super(Todo.class);
	}
}
