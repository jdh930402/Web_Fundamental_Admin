<%@page import="java.util.Calendar"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="com.google.zxing.WriterException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@page contentType="application/json; charset=utf-8"%>
<%
	String url = request.getParameter("url");

	QRCodeWriter writer = new QRCodeWriter();
	try {
		BitMatrix qrCode = writer.encode(url, BarcodeFormat.QR_CODE, 300, 300);
		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
		String path = request.getRealPath("/upload/qrcode");
		
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		
		File f = new File(path,year+"//"+month);
		if(!f.isDirectory()){
			f.mkdirs();
		}
		long currentMills = System.currentTimeMillis();
		File f1 = new File(f, currentMills+".png");
		boolean isSuccess = ImageIO.write(qrImage, "png", f1);
		
		if(isSuccess){
%>
		{"result" : "ok", "path" : "/upload/qrcode/<%=year%>/<%=month%>/<%=currentMills%>.png"}
	
		<%}else{%>
		{"result" : "fail"}
			
			<%
		}
		
	} catch (WriterException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
%>