<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page pageEncoding="utf-8"%>
<%@ include file = "/inc/header.jsp" %>

<%	
	if(memberDto != null){
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int cPage = Integer.parseInt(request.getParameter("page"));
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String regdate = request.getParameter("regdate");
	MemberDto dto = new MemberDto(seq, id, email, name, phone, regdate);
	
	MemberDao dao = MemberDao.getInstance();
	if(dao.update(dto)){
%>
	<script>
		alert('수정 성공');
		location.href = 'view.jsp?seq=<%=seq%>&page=<%=cPage%>';
	</script>
<%
	} else{
%>
	<script>
		alert('수정 실패');
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