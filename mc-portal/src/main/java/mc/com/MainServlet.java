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
	public static final String UPLOAD_FOLDER = "views/uploads/";

	private static byte theme = 0;
	
	private static Logger logger=Logger.getLogger(MainServlet.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		checkConnect(request);
		
		boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		logger.info("*******************************************************");
		logger.info("doGet.."+ajax);
		logger.info("*******************************************************");
		
		boolean isAdminMode=adminMode(request,response);	
		if(!isAdminMode) {
			String page = getPageFromRoute(request);
			if(!ViewExists(page)){		
				request.setAttribute("error", "404");
				request.setAttribute("message", "Page Not Found!");			
			}
						
			display(page,request,response, isAdminMode);
		}
	}
	private void checkConnect(HttpServletRequest request) {
		boolean checkConnection=HibernateUtil.checkConnection();
		request.setAttribute("checkConnection", checkConnection);
	}	
	private boolean adminMode(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("admin")==null) 
			return false;
				
		
		//Admin Mode..	
		if(request.getParameter("action")!=null) {		
			logger.info("Admin Mode..action : "+request.getParameter("action"));			
			if(request.getParameter("action").equals("restore"))
				try {		
					Tools.restoreFiles(getServletContext().getRealPath(UPLOAD_FOLDER));

					redirectToRoot(response);
				} catch (Exception e) {
					
				}
		}else {
			String page=request.getParameter("page");
			logger.info("Admin Mode => Page :"+page);
			
			display(page, request, response, true);
		}
		return true;
	}
	private void redirectToRoot(HttpServletResponse response) throws IOException {
		response.sendRedirect("./");
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
			
//			logger.info( "File (View) :"+fview.exists()+" "+fview.getAbsolutePath());
//			logger.info( page+ " fullPath : "+fullPath);	
			
			return fview.exists();
		} catch (Exception e) {			
			logger.error("Err :"+e.getMessage());
		}

		return false;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean ajax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		logger.info("*******************************************************");
		logger.info("doPost.."+ajax);
		logger.info("*******************************************************");
		
		if(ajax) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/async");
			dispatcher.forward(request,response);
			return;
		}

//		if(request.getParameter("post")!=null) {
//			blogPostCases(request, response);
//		}
//		else {
		logger.info("Servlet (Main) ==> POST = ???");
//		}
	}


	private void display(String viewName, HttpServletRequest request, HttpServletResponse response, boolean isAdminMode) throws ServletException, IOException {	
	
		request.setAttribute("title", "MC-Portal.");	
		String page="",pageName="", category="";
		
		if(isAdminMode) {
			pageName=viewName;
		
			viewName="admin/"+viewName+".jsp";
			if(!ViewExists(VIEW_FOLDER+viewName)){		
				viewName="admin/index.jsp";
			}
			request.setAttribute("pageName", pageName);
			request.setAttribute("page", viewName);			
		}
		else {
			viewName = viewName.replace("views/", "");
			request.setAttribute("page", viewName);	
			
					
			String[] arr=viewName.split("/");			
			if(arr.length>1) {
				pageName=viewName.split("/")[1].replace(".jsp","");
				pageName = pageName.substring(0, 1).toUpperCase()+""+pageName.substring(1).toLowerCase();	
				request.setAttribute("pageName", pageName);
			}		
			
			category=request.getParameter("category");
			if(category!=null) {		
				switch (category) {
					case "blog":
						blogProcess(pageName.toLowerCase(), request);
						break;
					default:
						break;
				}
			}
			
			if("About".equals(pageName)) {
				String connection_infos=HibernateUtil.getInfo();
				request.setAttribute("info", connection_infos);
			}
		}
		logger.info("category / viewName / pageName : "+category+" / " + viewName +" / "+ pageName);
		
		if(viewName.equals("main.jsp")) {
			theme=(byte)(++theme%2);
			request.setAttribute("theme", theme);
		}
		request.getRequestDispatcher(SHARED_FOLDER+"layout.jsp").forward(request, response);		
	}

	private void blogProcess(String pageName, HttpServletRequest request) {

		if(pageName.equals("list")) {
			try {
				PostManager pm = new PostManager();
				logger.info("PostManager : "+pm);
				
				List<Post> posts = pm.list();	
				logger.info("PostManager - posts : "+posts);
				
				request.setAttribute("posts", posts);
				
			} catch (Exception e) {
				logger.info("blogProcess - Error  : "+e);
			}
			
			
		}
		else if(pageName.equals("create")) {		
			List<Category> categories = new CategoryManager().findAll();
			request.setAttribute("categories", categories);		
		}
		else if(pageName.equals("update")) {		
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
		else if(pageName.equals("post")) {			
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
