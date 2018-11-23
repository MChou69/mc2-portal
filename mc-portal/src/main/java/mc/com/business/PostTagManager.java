package mc.com.business;

import mc.com.beans.PostTag;
import mc.com.dao.GenericDao;

public class PostTagManager  extends GenericDao<PostTag>{

	public PostTagManager() {
		super(PostTag.class);
	}
}
