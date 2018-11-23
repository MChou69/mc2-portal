package mc.com;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

import com.google.gson.JsonObject;

import mc.com.beans.Document;
import mc.com.business.DocumentManager;

@WebServlet("/async")
@MultipartConfig
public class AsyncServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "c:/uploads";
	private static Logger logger=Logger.getLogger(AsyncServlet.class);

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
				
				sendJsonMessage(response,"files ("+items.size()+") uploaded with success!");
				
				DocumentManager dm= new DocumentManager();
				for (Document doc : docs) {
					dm.add(doc);
				}

			} catch (Exception ex) {
				sendJsonMessage(response,"Upload request - error:  "+ex.toString());
			}
		}else {
			sendJsonMessage(response,"Upload request :  ServletFileUpload.isMultipartContent false!");
		}




		//String ajaxUpdateResult = "";

		//		try {
		//
		//			List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);            
		//
		//			for (FileItem item : items) {
		//
		//				if (item.isFormField()) {
		//
		//					ajaxUpdateResult += "Field " + item.getFieldName() + 
		//
		//							" with value: " + item.getString() + " is successfully read\n\r";
		//
		//				} else {
		//
		//					String fileName = item.getName();
		//
		//					InputStream content = item.getInputStream();
		//
		//					response.setContentType("text/plain");
		//
		//					response.setCharacterEncoding("UTF-8");
		//
		//					// Do whatever with the content InputStream.
		//
		//					System.out.println(Streams.asString(content));
		//
		//					ajaxUpdateResult += "File " + fileName + " is successfully uploaded\n\r";
		//
		//				}
		//
		//			}
		//
		//		} catch (FileUploadException e) {
		//
		//			throw new ServletException("Parsing file upload failed.", e);
		//
		//		}
	}

	private void sendJsonMessage(HttpServletResponse response, String message) throws IOException {
		JsonObject json = new JsonObject();

		json.addProperty("message", message);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json.toString());
	}
}
