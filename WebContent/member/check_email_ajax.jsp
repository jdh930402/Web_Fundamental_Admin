<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page contentType="application/json; charset=utf-8"%>
<%
	String email = request.getParameter("email");
	MemberDao dao = MemberDao.getInstance();
	if(dao.isCheckEmail(email)){
%>
		{"result" : "ok"}
<%
	} else {
%>
		{"result" : "fail"}
<%
	}
%>