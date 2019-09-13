<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page contentType="application/json; charset=utf-8"%>
<%
	String id = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	if(dao.isCheckId(id)){
%>
		{"result" : "ok"}
<%
	}else{
%>
		{"result" : "fail"}
<%
	}
%>