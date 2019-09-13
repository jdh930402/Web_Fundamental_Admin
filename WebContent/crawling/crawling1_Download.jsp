<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page pageEncoding="utf-8" %>
<%
String year = request.getParameter("year");
boolean isSuccess = false;
String url = null;
FileOutputStream fos = null;
Document doc = null;
HSSFWorkbook workbook = new HSSFWorkbook();
HSSFSheet sheet = workbook.createSheet("Sheet");
HSSFRow row = null;
HSSFCell cell = null;
try {
	url = "https://sports.news.naver.com/kfootball/record/index.nhn?category=kleague" + "&year=" + year;
	doc = Jsoup.connect(url).get();
	Elements elementsData = doc.select("#regularGroup_table tr");

	row = sheet.createRow(0);
	cell = row.createCell(0);
	cell.setCellValue("순위");

	cell = row.createCell(1);
	cell.setCellValue("팀");

	cell = row.createCell(2);
	cell.setCellValue("경기수");

	cell = row.createCell(3);
	cell.setCellValue("승점");

	cell = row.createCell(4);
	cell.setCellValue("승");

	cell = row.createCell(5);
	cell.setCellValue("무");

	cell = row.createCell(6);
	cell.setCellValue("패");

	cell = row.createCell(7);
	cell.setCellValue("득점");

	cell = row.createCell(8);
	cell.setCellValue("실점");

	cell = row.createCell(9);
	cell.setCellValue("득실차");

	cell = row.createCell(10);
	cell.setCellValue("도움");

	cell = row.createCell(11);
	cell.setCellValue("파울");

	for (int i = 0; i < elementsData.size(); i++) {
		int index = 0;
		row = sheet.createRow(i + 1);
		Element elementData = elementsData.get(i);

		cell = row.createCell(index);
		String rank = elementData.child(index++).text();
		cell.setCellValue(rank);

		cell = row.createCell(index);
		String teamName = elementData.child(index++).text();
		cell.setCellValue(teamName);

		cell = row.createCell(index);
		String match = elementData.child(index++).text();
		cell.setCellValue(match);

		cell = row.createCell(index);
		String winPoint = elementData.child(index++).text();
		cell.setCellValue(winPoint);

		cell = row.createCell(index);
		String win = elementData.child(index++).text();
		cell.setCellValue(win);

		cell = row.createCell(index);
		String draw = elementData.child(index++).text();
		cell.setCellValue(draw);

		cell = row.createCell(index);
		String lose = elementData.child(index++).text();
		cell.setCellValue(lose);

		cell = row.createCell(index);
		String goal = elementData.child(index++).text();
		cell.setCellValue(goal);

		cell = row.createCell(index);
		String lost = elementData.child(index++).text();
		cell.setCellValue(lost);

		cell = row.createCell(index);
		String gainAndLost = elementData.child(index++).text();
		cell.setCellValue(gainAndLost);

		cell = row.createCell(index);
		String assist = elementData.child(index++).text();
		cell.setCellValue(assist);

		cell = row.createCell(index);
		String foul = elementData.child(index++).text();
		cell.setCellValue(foul);
	}
	fos = new FileOutputStream("C:\\dev\\test\\kleague" + year + ".xls");
	workbook.write(fos);
	fos.close();
	workbook.close();
	isSuccess = true;
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


	

%>