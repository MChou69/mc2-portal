package mc.com.business;

import java.util.List;

import mc.com.beans.Tag;
import mc.com.dao.GenericDao;

public class TagManager  extends GenericDao<Tag>{

	public TagManager() {
		super(Tag.class);
	}
	public boolean exits(String name) {
		List<Tag> tags = findAll();
		for (Tag tag : tags) 
			if(tag.getName().equals(name))
				return true;

		return false;
	}

	public Tag getByName(String name) {
		List<Tag> tags = findAll();
		
		for (Tag tag : tags) 
			if(tag.getName().equals(name))
				return tag;
		
		return null;
	}
	
}

