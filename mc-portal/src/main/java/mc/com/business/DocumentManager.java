package mc.com.business;

import mc.com.beans.Document;
import mc.com.dao.GenericDao;

public class DocumentManager  extends GenericDao<Document>{

	public DocumentManager() {
		super(Document.class);
	}
}
