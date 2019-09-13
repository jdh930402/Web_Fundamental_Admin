<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page pageEncoding="utf-8"%>							
							
<%
	/*
		page = 1 => 1~10 => limit 0, 10
		page = 2 => 11~20 => limit 10, 10
		page = 3 => 21~30 => limit 20, 10
		
		등차수열
		An = a1 + (n-1)*d => 0+(page-1)*length
	*/
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.equals("0") || tempPage.length() == 0){
		tempPage = "1";
	}
	try{
		cPage = Integer.parseInt(tempPage);
	} catch(NumberFormatException e){
		cPage = 1;
	}
		int length = 10; // 길이를 설정하는 변수
		int start = (cPage-1)*length; // limit의 start값을 선언하는 변수
		int totalPage = 0; // 전체 페이지를 저장하는 변수
		int startPage = 0; // 페이지 버튼의 시작 값을 설정하는 변수
		int endPage = 0; // 페이지 버튼의 마지막 값을 설정하는 변수
		int pageLength = 10; // 페이지버튼의 길이를 조절하는 변수
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> list = dao.select(start, length);
			/*
				totalRows => 258개
				cPage => 1 : startPage = 1, endPage = 10
				...
				cPage => 10 : startPage = 1, endPage = 10
				currentBlock = 1 => startPage = 1, endPage = 10
				
				cPage => 11 : startPage = 11, endPage = 20
				currentBlock = 2 => startPage = 11, endPage = 20
				
				cPage => 21 : startPage = 21, endPage = 26 
				currentBlock = 3 => startPage = 21, endPage = 26
				
			*/
			int totalRows = dao.getRows();
		
			totalPage = totalRows%length == 0 ? totalRows/length : totalRows/length+1; // 조건 ? true : false; // 26개
			if(totalPage == 0){
				totalPage = 1;
			}
			
			// pageLength개 씩의 페이지를 판별하는 블록
			int currentBlock = cPage % pageLength == 0 ? cPage/pageLength : cPage/pageLength+1;
			// 마지막 블록에서는 마지막 페이지가 있어야하기때문에 totalBlock을 구한다.
			int totalBlock = totalPage % pageLength == 0 ? totalPage/pageLength : totalPage/pageLength +1;
			
			// 등차수열 An = a1 + (n-1)*d => n이 currentBlock
			// 
			startPage = 1 + (currentBlock - 1) * pageLength;   
			endPage = pageLength + (currentBlock - 1) * pageLength;
			if(currentBlock == totalBlock){
				endPage = totalPage;
			}
%>	
							
							<table class="table table-hover">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="15%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">이름</th>
										<th scope="col">아이디</th>
										<th scope="col">이메일</th>
										<th scope="col">핸드폰번호</th>
										<th scope="col">등록날짜</th>
									</tr>
								</thead>
								<tbody id = "table_body">
								<%
									if(list.size() != 0){
										for(int i=0; i< list.size(); i++){
											MemberDto dto = list.get(i);
											int num = totalRows-(cPage-1)*length-i;
											int seq = dto.getSeq();
											String name = dto.getName();
											String id = dto.getId();
											String email = dto.getEmail();
											String phone = dto.getPhone();
											String regdate = dto.getRegdate();
								%>
									<tr>
										<th scope="row"><%=num%></th>
										<td><%=name%></td>
										<td><a href="view.jsp?seq=<%=seq%>&page=<%=cPage%>"><%=id%></a></td>
										<td><%=email%></td>
										<td><%=phone%></td>
										<td><%=regdate%></td>
									</tr>
									
								<%
										}
									}else{
								%>
								 	<tr>
									 	<td class="text-center" colspan = "6" scope = "row"> 등록된 부서가 없습니다.</td>
									</tr>
								
								<%
									}
								%>
								</tbody>
							</table>

							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-lg justify-content-center">
								
								<!-- <<버튼 설정  -->
								<%
									if(currentBlock !=1) {
								%>
									<li class="page-item "> <a class="page-link" href="javascript:pageLoad(<%=startPage-1%>);" tabindex="-1">&laquo;</a></li>
								<%
									} else {
								%>
									<li class="page-item disabled"> <a class="page-link" href="#" tabindex="-1">&laquo;</a></li>
								<%
									}
								%>
								
								<!-- 숫자버튼 설정  -->
								<%
									for(int i = startPage ; i<=endPage; i++){
								%>
									<li class="page-item <%if(cPage==i){%>active <%}%>"><a class="page-link" href="javascript:pageLoad(<%=i%>);"><%=i%></a></li>
								<%
									}
								%>
								
								<!-- >>버튼 설정  -->
								<%
									if(currentBlock != totalBlock){
								%>
									<li class="page-item" ><a class="page-link" href="javascript:pageLoad(<%=endPage+1%>);"> &raquo;</a></li>
								<%
									} else{
								%>
									<li class="page-item disabled" ><a class="page-link" href="#"> &raquo;</a></li>
								<%
									}
								%>
								</ul>
							</nav>
							
							<div class="text-right">
								<a href="register.jsp?page=<%=cPage%>" class="btn btn-outline-primary">등록</a>
							</div>