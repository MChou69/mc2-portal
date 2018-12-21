package mc.com.business;

import java.util.List;

import org.apache.log4j.Logger;

import mc.com.beans.Category;
import mc.com.beans.Post;
import mc.com.beans.PostTag;
import mc.com.beans.Tag;
import mc.com.dao.GenericDao;

public class PostManager extends GenericDao<Post>{
	public final static Logger logger = Logger.getLogger(PostManager.class);
	
	public PostManager() {
		super(Post.class);
	}
	public List<Post> list(){
		List<Post> posts = this.findAll();
		posts.sort((p1,p2) -> p2.getUpdated().compareTo(p1.getUpdated()));
		return posts;
	}
	public boolean create(int category_id, String title, String description, String file, String[] tags) {	
		boolean result=true;
		logger.info("******************************************************");
		logger.info("******************** CREATE POST *********************");
		logger.info("******************************************************");

		try {

			Category category = new CategoryManager().findById(category_id);	
			Post post = this.add(new Post(category, title, description, file));
			logger.info("Post (New) : "+post);

			PostTagManager ptm = new PostTagManager();
			TagManager tm = new TagManager();
			
			for (String name : tags) {
				Tag tag=tm.getByName(name);

				if(tag==null && !name.equals("")) 
					tag = tm.add(new Tag(0, name));	

				ptm.add(new PostTag(0, post, tag));
			}

		} catch (Exception e) {				
			result = false;		
			System.out.println("PostManager - Create ==> Error :"+e);
		} 		
		logger.info("******************************************************");
		logger.info("******************************************************");
		return result;

	}
	public Post update(Post post, String[] tags) {
		PostTagManager ptm = new PostTagManager();
		TagManager tm = new TagManager();
		
		for (String name : tags) {
			Tag tag=tm.getByName(name);
			if(tag==null) 
				tag = tm.add(new Tag(0, name));	

			ptm.add(new PostTag(0, post, tag));
		}

		return this.update(post);
	}
}
