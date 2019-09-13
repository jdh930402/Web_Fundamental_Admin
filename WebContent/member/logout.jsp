<%@ page pageEncoding="utf-8"%>

<%
	/*
		HttpSession 객체를 종료하는 3가지 방법
		1. 브라우저를 종료했을 경우
		2. 해당 페이지의 시간(default: 30분)이 경과되면 자동으로 세션객체 삭제
		3. invalidate()메서드를 호출할 경우
	*/
	session.invalidate(); // 기존 세션 객체를 삭제하고 새로운 세션 객체를 만들음 
	response.sendRedirect("/admin");
%>
