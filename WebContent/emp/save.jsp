<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@page pageEncoding="utf-8"%>
<%@include file="/inc/header.jsp" %>

<%
	if(memberDto != null){
	request.setCharacterEncoding("utf-8"); // 받는 값을 utf-8로 인코딩해준다.
	int cPage = Integer.parseInt(request.getParameter("page"));
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	int mgr = Integer.parseInt(request.getParameter("mgr"));
	String hiredate = request.getParameter("hiredate");
	float sal = Float.parseFloat(request.getParameter("sal"));
	float comm = Float.parseFloat(request.getParameter("comm"));
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = new EmpDto(no, name, job, mgr, hiredate, sal, comm, deptno);
	if(dao.insert(dto)){
	%>
	<script>
		alert('성공');
		location.href="list.jsp?page=<%=cPage%>";
	</script>
	<%} else{ %>
	<script>
		alert('실패');
		history.back(-1); // 이전 페이지로 되돌아가기
	</script>
	<%	}} else{
	%>	
	<script>
		alert('접근할 수 없는 권한입니다.');
		location.href = 'list.jsp';
	</script>	
	<%	
		}
	%>
