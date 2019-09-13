<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@page pageEncoding="utf-8"%>
<%@ include file = "/inc/header.jsp" %>
<%
	if(memberDto != null){
	request.setCharacterEncoding("utf-8"); // 받는 값을 utf-8로 인코딩해준다.
	int no = Integer.parseInt(request.getParameter("no"));
	DeptDao dao = DeptDao.getInstance();
	if(dao.delete(no)){
	%>
	<script>
		alert('성공');
		location.href="list.jsp";
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