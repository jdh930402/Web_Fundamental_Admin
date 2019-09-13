<%@page import="java.io.IOException"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<% 
	String tempYear = request.getParameter("year");
	Calendar calendar = Calendar.getInstance();
	int cYear = calendar.get(Calendar.YEAR);
	if(tempYear == null || tempYear.length() == 0){
		tempYear = String.valueOf(cYear);
	}
	try{
		cYear = Integer.parseInt(tempYear);
	} catch(NumberFormatException e){
		cYear = calendar.get(Calendar.YEAR);
	}
	String url = "https://sports.news.naver.com/kfootball/record/index.nhn?category=kleague&year="+cYear ;
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
%>
	<h5 class="card-title" >
		<%=cYear%> K리그1 정규 라운드 팀별 순위
	</h5>


<table class="table table-hover">
	<colgroup>
		<col width="7%" />
		<col width="23%" />
		<col width="7%" />
		<col width="7%" />
		<col width="7%" />
		<col width="7%" />
		<col width="7%" />
		<col width="7%" />
		<col width="7%" />
		<col width="7%" />
		<col width="7%" />
		<col width="7%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">순위</th>
			<th scope="col">팀</th>
			<th scope="col">경기수</th>
			<th scope="col">승점</th>
			<th scope="col">승</th>
			<th scope="col">무</th>
			<th scope="col">패</th>
			<th scope="col">득점</th>
			<th scope="col">실점</th>
			<th scope="col">득실차</th>
			<th scope="col">도움</th>
			<th scope="col">파울</th>
			
		</tr>
	</thead>
	<tbody>
	<%
	if(cYear >= 2012 && cYear <=2018){
		Elements elementsData = doc.select("#splitGroupA_table tr");
		for(int i=0 ; i<elementsData.size() ; i++){

			int index = 0;
			Element elementData = elementsData.get(i);
			
			String rank = elementData.child(index++).text();
			String teamName = elementData.child(index++).text();
			String match = elementData.child(index++).text();
			String winPoint = elementData.child(index++).text();
			String win = elementData.child(index++).text();
			String draw = elementData.child(index++).text();
			String lose = elementData.child(index++).text();
			String goal = elementData.child(index++).text();
			String lost = elementData.child(index++).text();
			String gainAndLost = elementData.child(index++).text();
			String assist = elementData.child(index++).text();
			String foul = elementData.child(index++).text();
		%>
			<tr>
				<th scope="row"><%=rank%></th>
				<td><%=teamName%></td>
				<td><%=match%></td>
				<td><%=winPoint%></td>
				<td><%=win%></td>
				<td><%=draw%></td>
				<td><%=lose%></td>
				<td><%=goal%></td>
				<td><%=lost%></td>
				<td><%=gainAndLost%></td>
				<td><%=assist%></td>
				<td><%=foul%></td>	
			</tr>
	
 	<% }
		elementsData = doc.select("#splitGroupB_table tr");
		for(int i=0 ; i<elementsData.size() ; i++){

			int index = 0;
			Element elementData = elementsData.get(i);
			
			String rank = elementData.child(index++).text();
			String teamName = elementData.child(index++).text();
			String match = elementData.child(index++).text();
			String winPoint = elementData.child(index++).text();
			String win = elementData.child(index++).text();
			String draw = elementData.child(index++).text();
			String lose = elementData.child(index++).text();
			String goal = elementData.child(index++).text();
			String lost = elementData.child(index++).text();
			String gainAndLost = elementData.child(index++).text();
			String assist = elementData.child(index++).text();
			String foul = elementData.child(index++).text();
		%>
			<tr>
				<th scope="row"><%=rank%></th>
				<td><%=teamName%></td>
				<td><%=match%></td>
				<td><%=winPoint%></td>
				<td><%=win%></td>
				<td><%=draw%></td>
				<td><%=lose%></td>
				<td><%=goal%></td>
				<td><%=lost%></td>
				<td><%=gainAndLost%></td>
				<td><%=assist%></td>
				<td><%=foul%></td>	
			</tr>
	
 	<% }
		
	}else{
 		Elements elementsData = doc.select("#regularGroup_table tr");
			for(int i=0 ; i<elementsData.size() ; i++){
	
				int index = 0;
				Element elementData = elementsData.get(i);
				
				String rank = elementData.child(index++).text();
				String teamName = elementData.child(index++).text();
				String match = elementData.child(index++).text();
				String winPoint = elementData.child(index++).text();
				String win = elementData.child(index++).text();
				String draw = elementData.child(index++).text();
				String lose = elementData.child(index++).text();
				String goal = elementData.child(index++).text();
				String lost = elementData.child(index++).text();
				String gainAndLost = elementData.child(index++).text();
				String assist = elementData.child(index++).text();
				String foul = elementData.child(index++).text();
	%>
				<tr>
					<th scope="row"><%=rank%></th>
					<td><%=teamName%></td>
					<td><%=match%></td>
					<td><%=winPoint%></td>
					<td><%=win%></td>
					<td><%=draw%></td>
					<td><%=lose%></td>
					<td><%=goal%></td>
					<td><%=lost%></td>
					<td><%=gainAndLost%></td>
					<td><%=assist%></td>
					<td><%=foul%></td>	
				</tr>
				<%}}%>
	</tbody>
</table>