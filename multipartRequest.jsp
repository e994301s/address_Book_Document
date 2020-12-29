<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<%@ page 
import="com.oreilly.servlet.MultipartRequest" 
import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
 import="java.util.*" 
 import="java.io.*"%> 
 
 <% 
 String savePath = "/Library/Tomcat/webapps/ROOT/test"; // 저장할 디렉토리 (절대경로)

  int sizeLimit = 5 * 1024 * 1024; 

  // 5메가까지 제한 넘어서면 예외발생 

  try { 
	  MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, new DefaultFileRenamePolicy());
	   
	   String filename = "";
					String rfile = multpartRequest.getFilesystemName("file");
					String f_ext = "";
					if(rfile != null){
						File file_copy = new File(realPath+"/"+rfile);
						if(file_copy.exists()) {
							f_ext = rfile.substring(rfile.length()-3,rfile.length());
							File file2 = new File(realPath+"/"+now+"."+f_ext);
							file_copy.renameTo(file2);
							filename = file2.getName();
							System.out.println(filename);
							session.setAttribute("eFilename", filename);
						}
	   } catch (Exception e) {
		    out.print(e); out.print("예외 상황 발생..! ");
		}
%>
