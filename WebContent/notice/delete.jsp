<%@page import="kr.co.kic.dev1.dto.NoticeDto"%>
<%@page import="kr.co.kic.dev1.dao.NoticeDao"%>
<%@page pageEncoding="utf-8"%>
<%@include file="/inc/header.jsp" %>
<%
	if(memberDto != null){
	request.setCharacterEncoding("utf-8"); // 받는 값을 utf-8로 인코딩해준다.
	int num = Integer.parseInt(request.getParameter("num"));
	System.out.print(num);
	NoticeDao dao = NoticeDao.getInstance();
	if(dao.delete(num)){
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
	<%} %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

	<%
		} else{
	%>	
	<script>
		alert('접근할 수 없는 권한입니다.');
		location.href = 'list.jsp';
	</script>	
	<%	
		}
	%>