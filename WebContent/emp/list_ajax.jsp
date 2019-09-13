<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@page import="java.util.ArrayList"%>
<%@page pageEncoding="utf-8"%>

<%
	String tempPage = request.getParameter("page");
	if(tempPage == null || tempPage.length()==0 || tempPage.equals("0")){
		tempPage = "1";
	}
	
	int cPage = 0;
	try{
		cPage = Integer.parseInt(tempPage);
		if(cPage < 0){
			cPage = Math.abs(cPage);
			System.out.println(cPage);
		}
	} catch(NumberFormatException e){
		cPage = 1;
	}
	EmpDao dao = EmpDao.getInstance(); 	
	int length = 10;
	int start = (cPage-1)*length;
	int totalRows = dao.getRows();
	int totalPage =  0;
	int startPage = 0;
	int endPage = 0;
	ArrayList<EmpDto> list = dao.select(start, length);
	
	totalPage = totalRows%length == 0 ? totalRows/length : totalRows/length+1;
	if(totalPage == 0){
		totalPage = 1;
	}
										
												
	int pageLength = 5;
	int currentBlock = cPage%pageLength == 0 ? cPage/pageLength : cPage/pageLength+1;  
	int totalBlock = totalPage%pageLength == 0? totalPage/pageLength : totalPage/pageLength+1;
														
	startPage = (currentBlock - 1) * pageLength + 1;
	endPage = currentBlock * 10;
										
	if(currentBlock == totalBlock){
		endPage = totalPage;
	}
%>

							<table class="table table-hover">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="20%" />
									<col width="20%" />
									<col width="15%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">사원번호</th>
										<th scope="col">이름</th>
										<th scope="col">직책</th>
										<th scope="col">담당사수</th>
										<th scope="col">입사일</th>				
									</tr>
								</thead>
								<tbody>
									<%				
									if(list.size() != 0){ 
									for(int i=0 ; i<list.size() ; i++){
										EmpDto dto = list.get(i);
										int pageNum = totalRows-(cPage-1)*length-i;
										int no = dto.getNo();
										String name = dto.getName();
										String job = dto.getJob();
										int mgr = dto.getMgr();
										String hiredate = dto.getHireDate();
									%>
									
									<tr>
										<th scope="row"><%=pageNum%></th>
										<td><%=no%></td>
										<td ><a class = "click_list" href = "view.jsp?no=<%=no%>&page=<%=cPage%>"><%=name%></a></td>
										<td><%=job%></td>
										<td><%=mgr%></td>
										<td><%=hiredate%></td>
									</tr>
									<%}} else{ %>
									 <tr>
									 	<td class = "text-center" colspan = "6" scope = "row"> 등록된 사원이 없습니다.</td>
									 </tr>										
									<%} %>
								</tbody>								
							</table>

							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-lg justify-content-center">
								
								<% if(currentBlock == 1){ %>
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1">&laquo;</a>
									</li>
								<%}else{%>
									<li class="page-item">
										<a class="page-link" href="javascript:pageLoad(<%=startPage-1%>)" tabindex="-1">&laquo;</a>
									</li>
								<%}%>
									
									<%								
										for(int i = startPage ; i <= endPage ; i++ ){
									%>
									<li class="page-item <%if(cPage == i){%>active<%}%>"><a class="page-link" href="javascript:pageLoad(<%=i%>)"><%=i%></a></li>
									<%
										}
									%>
									
									<% if(currentBlock == totalBlock){ %>
									<li class="page-item disabled">
										<a class="page-link" href="#">&raquo;</a>
									</li>
									<%}else{%>
									<li class="page-item">
										<a class="page-link" href="javascript:pageLoad(<%=endPage+1%>)" tabindex="-1">&raquo;</a>
									</li>
								<%}%>
									
								</ul>
							</nav>
							
							<div class="text-right">
								<a href="write.jsp?page=<%=cPage%>" class="btn btn-outline-primary">등록</a>
							</div>