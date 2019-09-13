<%@page import="kr.co.kic.dev1.dao.NoticeDao"%>
<%@page import="kr.co.kic.dev1.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page pageEncoding="utf-8"%>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == "0" || tempPage == null || tempPage.length() == 0){
		tempPage = "1";				
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	NoticeDao dao = NoticeDao.getInstance();
	int length = 5;
	int start =  (cPage-1)*length;
	int totalRows = dao.getRows();
	int totalPage = totalRows%length==0 ? totalRows/length : totalRows/length+1;	
	int currentBlock = cPage % length == 0 ?cPage/length : cPage/length + 1;;
 	int totalBlock = totalPage % length == 0 ? totalPage/length : totalPage/length +1;
	int startPage = (currentBlock-1)*length+1; 
	int endPage = (currentBlock-1)*length + length;
	if(totalBlock == currentBlock){
		endPage = totalPage;
	}
	ArrayList<NoticeDto> list = dao.select(start, length);
%>

<table class="table table-hover">
	<colgroup>
		<col width="15%" />
		<col width="15%" />
		<col width="35%" />
		<col width="35%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">부서번호</th>
			<th scope="col">부서명</th>
			<th scope="col">부서위치</th>
		</tr>
	</thead>
	<tbody>
		<tr>		
		
		
<%
	if(list.size() != 0){
		for(int i=0; i<list.size() ; i++){
			NoticeDto dto = list.get(i);
			int pageNum = totalRows-(cPage-1)*length-i;
			int num = dto.getNum();
			String writer = dto.getWriter();
			String title = dto.getTitle();
			String regdate = dto.getRegdate();
%>
			<th scope="row"><%=pageNum%></th>
			<td><%=writer%></td>
			<td><a class = "click_list" href = "view.jsp?num=<%=num%>"><%=title%></a></td>
			<td><%=regdate%></td>
		</tr>	
		
<% 
		}
	} else {	
%>
<tr>
	<td class = "text-center" colspan = "6" scope = "row"> 등록된 부서가 없습니다.</td>
</tr>
<%
	}
%>	
	</tbody>
</table>

<nav aria-label="Page navigation example">
	<ul class="pagination pagination-lg justify-content-center">
		<%-- <<버튼 --%>
		<%if(currentBlock == 1){ %>
		<li class="page-item disabled">
			<a class="page-link" href="javascript:pageLoad(<%=startPage-1%>)" tabindex="-1">&laquo;</a>
		</li>
		<%} else{%>
		<li class="page-item">
			<a class="page-link" href="javascript:pageLoad(<%=startPage-1%>)" tabindex="-1">&laquo;</a>
		</li>
		<% 
		}
		for(int i = startPage ; i <= endPage ; i++){
		%>
		<li class="page-item  <%if(cPage == i){%>active<%}%> "><a class="page-link" href="javascript:pageLoad(<%=i%>)" ><%=i%></a></li>
		<%}%>
		<%-- >>버튼 --%>
		<%if(currentBlock == totalBlock){ %>
		<li class="page-item disabled">
			<a class="page-link" href="javascript:pageLoad(<%=endPage%>)">&raquo;</a>
		</li>
		<%}else{ %>
				<li class="page-item ">
			<a class="page-link" href="javascript:pageLoad(<%=endPage+1%>)">&raquo;</a>
		</li>
		<%} %>
	</ul>
</nav>
<div class="text-right">
		<a href="write.jsp" class="btn btn-outline-primary">등록</a>
</div>

<script>

</script>






