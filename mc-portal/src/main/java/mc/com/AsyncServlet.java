package mc.com;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

import com.google.gson.JsonObject;

import mc.com.beans.Category;
import mc.com.beans.Document;
import mc.com.beans.Post;
import mc.com.beans.Todo;
import mc.com.business.CategoryManager;
import mc.com.business.DocumentManager;
import mc.com.business.PostManager;
import mc.com.business.TodoManager;
import mc.com.tools.Tools;

@WebServlet("/async")
@MultipartConfig
public class AsyncServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "c:/uploads";
	private static final String UPLOAD_FOLDER = MainServlet.UPLOAD_FOLDER;
	
	private static Logger logger=Logger.getLogger(AsyncServlet.class);

	private void sendJsonMessage(HttpServletResponse response, String message, boolean success) throws IOException {
		JsonObject json = new JsonObject();

		json.addProperty("message", message);
		json.addProperty("success", success);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json.toString());
	}
	private void sendJsonMessage(HttpServletResponse response, JsonObject json) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json.toString());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("***********************************************************");
		logger.info("********************AsyncServlet!!*************************");

		//String name=request.getParameter("name");
		//sendJsonMessage(response, "hello from async servlet.."+name);
		processJsonRequest(request,response);

		logger.info("***********************************************************");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void processJsonRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

		if(ServletFileUpload.isMultipartContent(request)){		
			logger.info("*******************************************************");
			logger.info("AsyncServlet - processFileUploads..: "+request.getParameter("title"));
			logger.info("*******************************************************");
			
			processFileUploads(request, response);
		}else {
			String item_to_process = request.getParameter("item");
			if(item_to_process==null)
				return;		
			switch (item_to_process) {
				case "post":
					postProcess(request, response);
					break;
				case "todo":					
					logger.info("processJsonRequest ==> TODO..");
					todoProcess(request, response);
				case "login":					
					logger.info("processJsonRequest ==> LOGIN..");
					loginProcess(request, response);
				default:
					break;
			}
		}
	}

	private void loginProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session=request.getSession();  
		if(request.getParameter("action").equals("login")) {
			String login=request.getParameter("login");
			String password=request.getParameter("password");
			
			//todo : BD check login..
			boolean ok = "mc@admin.com".equals(login) && "123".equals(password);
		    session.setAttribute("admin_mode",ok); 
			
			sendJsonMessage(response,ok?"logged in!":"login/password incorrect!",ok);
			
		}
		else if(request.getParameter("action").equals("logout")) {
			
		    session.setAttribute("admin_mode",false); 
			sendJsonMessage(response,"logged out!",true);
		}
	}
	private void postProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

		String fullPath;
		try {
			Post post = new PostManager().findById(id);
			if(post!=null) {
				String fileName = post.getFileName();

				//..en local..(copie)..
				String path=Tools.uploadPath(); 				
				fullPath = Tools.updateFile(path+fileName, html);
		
				fullPath = getServletContext().getRealPath(UPLOAD_FOLDER+fileName);
				fullPath = Tools.updateFile(fullPath, html);

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
			

			fullPath = getServletContext().getRealPath(UPLOAD_FOLDER+fileName);
			fullPath = Tools.createFile(fullPath, html);

			//logger.info("==============> Post File - path (remote)  : "+fullPath);

			boolean result = new PostManager().create(category, title, description, fileName, tags.split(",") );
			json.addProperty("message", "Post Created!");

		} catch (Exception e) {
			logger.info("File creation - Error : "+e);
			json.addProperty("message", "Post creation - Error : "+e.getMessage());
		}		

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json.toString());		
	}
	private void todoProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getParameter("action").equals("add")) 
			processAddUpdateTodo(request, response,false);
		else if(request.getParameter("action").equals("update")) 
			processAddUpdateTodo(request, response,true);
		else if(request.getParameter("action").equals("load")) {
			logger.info("todoProcess ==> load todos..");
			processLoadTodo(request, response,true);
		}else if(request.getParameter("action").equals("delete")) 
			processDeleteTodo(request, response,true);
		else
			sendJsonMessage(response,"nothing to do..", false);	
	}

	private void processDeleteTodo(HttpServletRequest request, HttpServletResponse response, boolean b) throws IOException {
		TodoManager tm= new TodoManager();
		int id=Integer.parseInt(request.getParameter("id"));
		tm.delete(id);
		
		sendJsonMessage(response,"todo deleted!", true);
	}
	private void processLoadTodo(HttpServletRequest request, HttpServletResponse response, boolean b) throws IOException {
		String[] colors= {"yellow","green","blue","red"};
		
		logger.info("processLoadTodo..");
		TodoManager tm= new TodoManager();
		
		logger.info("processLoadTodo..TodoManager = "+tm);
		
		List<Todo> todos= tm.findAll();
		String _html="";
		
		logger.info("todos : "+todos.toArray());
		
		for (Todo todo : todos) 
			_html +="<div id='note-"+todo.getId()+"' data-deadline='"+todo.getDeadline()+"' class='note "+colors[todo.getImportance()]+"' style='left:"+todo.getX()+"px;top:"+todo.getY()+"px;z-index:"+todo.getZ()+"'>"+todo.getNote()+"<br/>["+todo.getDeadline()+"]&nbsp;<span class='label label-danger note-close' id='"+todo.getId()+"'>X</span><span class='data'>"+todo.getId()+"</span></div>";
		
		sendJsonMessage(response,_html, true);
	}

	private void processFileUploads(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {

			List<Document> docs= new ArrayList<Document>();
			List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

			File file;
			for (FileItem item : items) {
				if(!item.isFormField()){
					File fileSaveDir = new File(UPLOAD_DIRECTORY);

					if (!fileSaveDir.exists()) {
						fileSaveDir.mkdir();
					}

					file = new File(item.getName());
					String name = file.getName();
					double size = file.length();
					//double size = ( / 1024);
					String ext = FilenameUtils.getExtension(name);

					item.write( new File(UPLOAD_DIRECTORY + File.separator + name));

					docs.add(new Document(name.replace("."+ext, "")+size, name));
				}
			}

			sendJsonMessage(response,"files ("+items.size()+") uploaded with success!", true);

			DocumentManager dm= new DocumentManager();
			for (Document doc : docs) {
				dm.add(doc);
			}

		} catch (Exception ex) {
			sendJsonMessage(response,"Upload request - error:  "+ex.toString(),false);
		}
	}
	private void processAddUpdateTodo(HttpServletRequest request, HttpServletResponse response, boolean update) throws IOException {
		TodoManager tm= new TodoManager();

		String note;
		Date deadline;
		int importance;
		Todo todo;
		JsonObject json;

		logger.info("update : "+update + " ==============> deadline : "+request.getParameter("deadline"));
		if(!update) {
			note = request.getParameter("note");
			deadline = dateFromString(request.getParameter("deadline"));
			logger.info("Date : "+deadline);
			
			importance = Integer.parseInt(request.getParameter("important"));
			todo = new Todo(note, importance, deadline);

		}else{
			int id=Integer.parseInt(request.getParameter("id"));
			todo = tm.findById(id);

			if(todo!=null) {
				todo.setCreated(new Date()); //..		
				
				todo.setX((int)Float.parseFloat(request.getParameter("x")));
				todo.setY((int)Float.parseFloat(request.getParameter("y")));
				todo.setZ((int)Float.parseFloat(request.getParameter("z")));
				
				todo.setImportance(Integer.parseInt(request.getParameter("important")));
				
				deadline = dateFromString(request.getParameter("deadline"));
				todo.setDeadline(deadline);
				
			}else {
				json = createJsonObject("not saved!",false,0);
				sendJsonMessage(response,json);
				return;
			}
		}

		logger.info("***********************************************************");
		logger.info(update?"update note..":"add note!");

		if(!update)
			tm.add(todo);
		else
			tm.update(todo);

		logger.info(todo);
		logger.info("***********************************************************");
		json = createJsonObject("note saved with success!",true,todo.getId());
		sendJsonMessage(response,json);
	}
	private Date dateFromString(String stringDate) {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		if(stringDate!=null)
	        try {
	        	logger.info("==============> stringDate : "+stringDate);
				date = formatter.parse(stringDate); //....
			} catch (ParseException e) {
				
			}
		return date;
	}
	private JsonObject createJsonObject(String message, boolean success, int id) {
		JsonObject json = new JsonObject();

		json.addProperty("message", message);
		json.addProperty("success", success);
		json.addProperty("id", id);

		return json;
	}
}
