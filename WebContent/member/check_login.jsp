<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page pageEncoding="utf-8"%>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");

	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(email, pwd);
	dto = dao.isMember(dto);
	if(dto != null ){
		// 세션 유효 기본 시간을 초단위로 바꾼다.
		// session.setMaxInactiveInterval(30);
		// 세션 유효 기본 시간은 30분 (web.xml 확인가능)
		session.setAttribute("member", dto);
%>
	<script>
		alert('로그인 성공');
		location.href = 'login.jsp';
	</script>
<%
	} else {
		%>
		<script>
			alert('로그인 실패');
			history.back(-1);		
		</script>			
<%
	}
%>
