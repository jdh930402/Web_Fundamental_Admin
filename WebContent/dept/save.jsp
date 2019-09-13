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
	if(dao.insert(new DeptDto(no, name, loc))){
%>
	<script>
		alert('성공');
		location.href = 'list.jsp';
	</script>
<%		
	}else{
%>
	<script>
		alert('실패');
		location.href = 'list.jsp';
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
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>