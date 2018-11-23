package mc.com.tests;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import org.apache.log4j.Logger;
import org.junit.Test;

import mc.com.tools.Tools;


public class LogTests {
	private static Logger logger=Logger.getLogger(LogTests.class);

	@Test
	public void test() {
		//		String path = this.getClass().getClassLoader().getResource("").getPath();
		//		String[] parts =path.split("/target/");
		//		String pathUploads= parts[0]+"/src/main/webapp/views/uploads/";
		//
		//		logger.info("==============> Path : "+pathUploads);
		//		SimpleDateFormat formater = new SimpleDateFormat("ddMMyyyy_HHmmss");
		//		try {
		//
		//			String fileName="post_"+ formater.format(new Date())+".htm";						
		//			Tools.createFile(pathUploads+fileName, "<h1>hello!</h1>");
		//
		//		} catch (Exception e) {
		//			e.printStackTrace();
		//		}
		
//		String x = new Tools().getUploadPath();
//		logger.info("==============> Path : "+x);
	}
}
