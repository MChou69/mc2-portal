package mc.com;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.JsonObject;

import mc.com.beans.Category;
import mc.com.beans.Post;
import mc.com.business.CategoryManager;
import mc.com.business.PostManager;
import mc.com.tools.HibernateUtil;
import mc.com.tools.Tools;

@WebServlet({  "/main" })
@MultipartConfig
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SHARED_FOLDER = "views/shared/";
	private static final String VIEW_FOLDER = "views/";
	private static final String UPLOAD_FOLDER = "views/uploads/";

	private static Logger logger=Logger.getLogger(MainServlet.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		if(request.getParameter("admin")!=null) {
			admin();
		}

		String page = getPageFromRoute(request);

		if(!ViewExists(page)){		
			request.setAttribute("error", "404");
			request.setAttribute("message", "Page Not Found!");			
		}

		display(page,request,response);

	}	
	private void admin() {
		try {
			Tools.restoreFiles(getServletContext().getRealPath(UPLOAD_FOLDER));
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	private String getPageFromRoute(HttpServletRequest request) {
		String page="";
		if(request.getParameter("category")!=null) {
			page  = VIEW_FOLDER+request.getParameter("category");
			page += (request.getParameter("page")!=null)?"/"+request.getParameter("page"):"/index";
		}else {
			page = (request.getParameter("page")!=null)?VIEW_FOLDER+request.getParameter("page"):VIEW_FOLDER+"main";
		}		
		return page+".jsp";
	}
	private boolean ViewExists(String page) {
		String fullPath = this.getServletContext().getRealPath(page);
		try {
			File fview=new File(fullPath);
			//	log.log(Level.INFO, "File (View) :"+fview.exists()+" "+fview.getAbsolutePath());
			//	log.log(Level.INFO, page+ " fullPath : "+fullPath);	
			return fview.exists();
		} catch (Exception e) {			
			logger.error("Err :"+e.getMessage());
		}

		return false;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if(ajax) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/async");
			dispatcher.forward(request,response);
			return;
		}

		if(request.getParameter("post")!=null) {
			blogPostCases(request, response);
		}
		else {
			logger.info("Servlet (Main) ==> POST = ???");
		}
	}

	private void blogPostCases(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getParameter("id")!=null)
			postUpdate(request,response);
		else
			postCreate(request,response);
	}
	private void postUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JsonObject json = new JsonObject();

		logger.info("Servlet (Main) ==> POST Update..");

		int id=Integer.parseInt(request.getParameter("id"));
		int category=Integer.parseInt(request.getParameter("category"));
		String title=request.getParameter("title");
		String description=request.getParameter("desc");
		String tags=request.getParameter("tags");
		String html=request.getParameter("post");

		logger.info(id+' '+title+" | "+category+" | "+description+" | "+tags);

		//String fileName="post_"+ formater.format(new Date())+".htm";
		String fullPath;
		try {
			Post post = new PostManager().findById(id);
			if(post!=null) {
				String fileName = post.getFileName();

				//..en local..(copie)..
				String path=Tools.uploadPath(); 				
				fullPath = Tools.updateFile(path+fileName, html);

				//logger.info("==============> Post File - path (local) : "+fullPath);				
				fullPath = getServletContext().getRealPath(UPLOAD_FOLDER+fileName);
				fullPath = Tools.updateFile(fullPath, html);

				//update post
				Category category_item = new CategoryManager().findById(category);

				post.setTitle(title);
				post.setCategory(category_item);
				post.setDescription(description);
				post.setUpdated(new Date());

				new PostManager().update(post,tags.split(";"));

				json.addProperty("message", "Post Updated!");
			}else {
				json.addProperty("message", "Post Update - Error : no post!");
			}

		} catch (Exception e) {
			logger.info("File Update - Error : "+e);
			json.addProperty("message", "Post Update - Error : "+e.getMessage());
		}		

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json.toString());		
	}
	private void postCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("Servlet (Main) ==> POST Create..");

		String title=request.getParameter("title");
		int category=Integer.parseInt(request.getParameter("category"));

		String description=request.getParameter("desc");
		String tags=request.getParameter("tags");
		String html=request.getParameter("post");

		logger.info(title+" | "+category+" | "+description+" | "+tags);
		String fullPath;
		JsonObject json = new JsonObject();
		try {

			SimpleDateFormat formater = new SimpleDateFormat("ddMMyyyy_HHmmss");
			String fileName="post_"+ formater.format(new Date())+".htm";

			//..en local..(copie)..
			String path=Tools.uploadPath(); 				
			fullPath = Tools.createFile(path+fileName, html);
			//logger.info("==============> Post File - path (local) : "+fullPath);

			fullPath = getServletContext().getRealPath(UPLOAD_FOLDER+fileName);
			fullPath = Tools.createFile(fullPath, html);

			//logger.info("==============> Post File - path (remote)  : "+fullPath);

			boolean result = new PostManager().create(category, title, description, fileName, tags.split(";") );
			json.addProperty("message", "Post Created!");

		} catch (Exception e) {
			logger.info("File creation - Error : "+e);
			json.addProperty("message", "Post creation - Error : "+e.getMessage());
		}		

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json.toString());		
	}
	private void display(String viewName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		request.setAttribute("title", "title..");

		viewName = viewName.replace("views/", "");
		request.setAttribute("page", viewName);	

		logger.info("viewName : "+ viewName);

		blogCases(viewName, request);

		String[] arr=viewName.split("/");
		String pageName="";
		if(arr.length>1) {
			pageName=viewName.split("/")[1].replace(".jsp","");
			pageName = pageName.substring(0, 1).toUpperCase()+""+pageName.substring(1).toLowerCase();	
			request.setAttribute("pageName", pageName);
		}

		logger.info("viewName / pageName : "+ viewName +" / "+ pageName);
		if("About".equals(pageName)) {
			String connection_infos=HibernateUtil.getInfo();
			//logger.info("Servlet (Main) ==> Connection Infos : "+connection_infos);
			request.setAttribute("info", connection_infos);
		}

		String view_to_display=SHARED_FOLDER+"layout.jsp";	
		request.getRequestDispatcher(view_to_display).forward(request, response);		
	}

	private void blogCases(String viewName, HttpServletRequest request) {

		if(viewName.equals("blog/list1.jsp")) {
			List<Post> posts = new PostManager().list();		
			request.setAttribute("posts", posts);
		}
		else if(viewName.equals("blog/create.jsp")) {		
			List<Category> categories = new CategoryManager().findAll();
			request.setAttribute("categories", categories);		
			logger.info("categories: "+ Arrays.toString(categories.toArray()));

		}
		else if(viewName.equals("blog/update.jsp")) {		
			if(request.getParameter("id")!=null) {
				int id= Integer.parseInt(request.getParameter("id"));
				Post post = new PostManager().findById(id);								
				request.setAttribute("post", post);

				List<Category> categories = new CategoryManager().findAll();
				request.setAttribute("categories", categories);		

				String path="../uploads/"; 	//Tools.uploadPath(); 	
				request.setAttribute("post_url", path+post.getFileName());
			}	
		}
		else if(viewName.equals("blog/post.jsp")) {			
			if(request.getParameter("id")!=null) {
				int id= Integer.parseInt(request.getParameter("id"));
				Post post = new PostManager().findById(id);
				String path="../uploads/"; 	//Tools.uploadPath(); 	

				request.setAttribute("post", post);
				request.setAttribute("post_url", path+post.getFileName());
			}		
		}
		else {

		}
	}
}
