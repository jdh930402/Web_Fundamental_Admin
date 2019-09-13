<%@page import="java.util.Calendar"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page pageEncoding="utf-8"%>

<%
	//String name = request.getParameter("name"); => 파일 업로드시에는 다르게 해야한다.
	request.setCharacterEncoding("utf-8");
	String path = request.getRealPath("/upload");
	
	Calendar c = Calendar.getInstance();
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH)+1;
	
	File file = new File(path,year+"//"+month);
	if(!file.isDirectory()){
		file.mkdirs();
	}

	MultipartRequest multi = null; // 이 객체가 완성되면 파일이 생성된것임.
	try{
		multi = new MultipartRequest(request, file.getPath(), 10*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		// multi = new MultipartRequest(request, 업로드할 디렉토리 경로, 파일 크기(10메가까지 가능), "utf-8", 파일이름이 중복되면 파일명 끝에 1,2,3...을 붙임);
		
	} catch (IOException e){
		e.printStackTrace();
	}
	String name = multi.getParameter("name");
	String fileName = multi.getFilesystemName("file");
	String uploadName = multi.getOriginalFileName("file");
	File f1 = new File(file, fileName);
	long fileSize = f1.length()/1024;
%>

path : <%=path%><br>
name : <%=name%><br>
file system name : <%=fileName%>(<%=fileSize%>KB)<br>
file origin name : <%=uploadName%>