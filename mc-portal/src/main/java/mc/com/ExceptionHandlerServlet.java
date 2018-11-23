package mc.com;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExceptionHandlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log=Logger.getLogger("Exception Handler Servlet!");
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processError(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processError(request, response);
		
	}

	private void processError(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {				
		Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
		Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");

		
		log.info("***************************************************************");
		log.info("ExceptionHandlerServlet ======> processError : "+statusCode+ " "+throwable);
		log.info("***************************************************************");

		request.setAttribute("error", statusCode);
		request.setAttribute("message", (throwable==null)?(statusCode==404?"Not Found!":"Unknown Error!"):throwable.getMessage());	
		String error_view="views/shared/layout.jsp";
		request.getRequestDispatcher(error_view).forward(request, response);	

	}
}
