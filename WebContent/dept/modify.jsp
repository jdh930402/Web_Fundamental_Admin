<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@page pageEncoding="utf-8"%>
<%@ include file = "/inc/header.jsp" %>
<%
	if(memberDto != null){
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String loc = request.getParameter("loc");
	
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = new DeptDto(no, name, loc);
	
	if(dao.update(dto)){
%>
	<script>
		alert('성공');
		location.href="view.jsp?no=<%=no%> ";
	</script>
	<%} else{ %>
	<script>
		alert('실패');
		history.back(-1); // 이전 페이지로 되돌아가기
	</script>
<%		
	}} else{
	%>	
	<script>
		alert('접근할 수 없는 권한입니다.');
		location.href = 'list.jsp';
	</script>	
	<%	
		}
	%>