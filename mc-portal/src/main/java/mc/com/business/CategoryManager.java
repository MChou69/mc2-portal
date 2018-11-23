package mc.com.business;

import mc.com.beans.Category;
import mc.com.dao.GenericDao;

public class CategoryManager  extends GenericDao<Category>{

	public CategoryManager() {
		super(Category.class);
	}
//	private static CategoryDao  dao= new CategoryDao();
//	public List<Category> list(){
//		return dao.findAll();
//	}
//	public Category get(int id){
//		Category category = dao.findById(id);
//		return category;
//	}
}
