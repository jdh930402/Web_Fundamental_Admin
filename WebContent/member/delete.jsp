<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file = "/inc/header.jsp" %>
<%
	if(memberDto != null){
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int cPage = Integer.parseInt(request.getParameter("page"));
	MemberDao dao = MemberDao.getInstance();
	if(dao.delete(seq)){
%>	
	<script> 
		alert('삭제 성공');
		location.href = 'list.jsp?page=<%=cPage%>';
	</script>
<%
	} else{
%>
	<script>
		alert('삭제 실패');
		history.back(-1);
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