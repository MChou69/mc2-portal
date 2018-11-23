package mc.com.tools;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

public class Tools {
	private static Logger logger=Logger.getLogger(Tools.class);
	
	static String LOCAL_FILES_PATH= "C:\\EclipseOxygen\\workspace\\Servers\\uploads\\";
	
	public static String createFile(String fullPath, String content) throws Exception {		
		File file = new File(fullPath);
		file.createNewFile();
		
		BufferedWriter writer = new BufferedWriter(new FileWriter(file));
		
		System.out.println(content);
		
		writer.write(content);
		writer.close();	
		
		return fullPath;
	}
	public static String updateFile(String fullPath, String content) throws Exception {		
		File file = new File(fullPath);
		BufferedWriter writer = new BufferedWriter(new FileWriter(file));
		writer.write(content);
		writer.close();		
		return fullPath;
	}
	
	public static String uploadPath() {
//		String path = this.getClass().getClassLoader().getResource("").getPath();
//		System.out.println(path);		
//		String[] parts = path.split("/target/");
//		path = parts[0]+"/src/main/webapp/views/uploads/";
		
		//..TODO..	
		return LOCAL_FILES_PATH;
	}
	
	public static void restoreFiles(String target) throws Exception {		
        File sourceDirectory = new File(LOCAL_FILES_PATH);
        File targetDirectory = new File(target);

        try {
            FileUtils.copyDirectory(sourceDirectory, targetDirectory);
            logger.info("****************************************************************************");
            logger.info("Posts restore ok! from : "+sourceDirectory+" to : "+targetDirectory);
            logger.info("****************************************************************************");
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
