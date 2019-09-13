<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@ page pageEncoding="UTF-8"%>
<%
	MemberDto memberDto = (MemberDto)session.getAttribute("member");
	String conPath = request.getContextPath();

	String url = request.getRequestURI();
	int index = 0;
	if(url.endsWith("register.jsp")){
		index = 1;
	} else if(url.endsWith("/login.jsp")){
		index = 11;
	} else if(url.startsWith(conPath + "/notice")){
		index = 2;
	} else if(url.startsWith(conPath + "/emp")){
		index = 3;
	} else if(url.startsWith(conPath + "/dept")){
		index = 4;
	} else if(url.startsWith(conPath + "/member")){
		index = 5;
	} else if(url.startsWith(conPath + "/file")){
		index = 6;
	} else if(url.endsWith("/crawling1.jsp")){
		index = 7;
	} else if(url.endsWith("/crawling2.jsp")){
		index = 8;
	} else if(url.startsWith(conPath + "/qrcode")){
		index = 9;
	} else if(url.startsWith(conPath + "/shorten")){
		index = 10;
	}
		
	
	%>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<!-- Font Awesome CSS -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
	<script src="/js/jquery-3.4.1.js"></script>
	<title>Bootstrap Template</title>
	<style>
		a.click_list:hover{
			cursor:pointer;
		}
		
		div.message{
			height: 15px;
		}
	</style>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#563d7c;">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			
			
				<li class="nav-item <%if(index == 0){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>"><i class="fa fa-home"></i> Home</a>
				</li>
				<li class="nav-item <%if(index == 2){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/notice/list.jsp"> <i class="fa fa-exclamation"></i> Notice</a>
				</li>
				<li class="nav-item <%if(index == 3){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/emp/list.jsp"> <i class="fa fa-user"></i> Employee</a>
				</li>
				<li class="nav-item <%if(index == 4){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/dept/list.jsp"> <i class="fa fa-building-o"></i> Department</a>
				</li>
				<li class="nav-item <%if(index == 5){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/member/list.jsp">  <i class="fa fa-user"></i> Member</a>
				</li>
				<li class="nav-item <%if(index == 6){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/file/index.jsp">  <i class="fa fa-upload"></i> File Upload </a>
				</li>
				<li class="nav-item <%if(index == 7){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/crawling/crawling1.jsp">  <i class="fa fa-files-o"></i> crawling1</a>
				</li>
				<li class="nav-item <%if(index == 8){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/crawling/crawling2.jsp">  <i class="fa fa-files-o"></i> crawling2</a>
				</li>
				<li class="nav-item <%if(index == 9){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/qrcode/index.jsp">  <i class="fa fa-files-o"></i> QRCode</a>
				</li>
				<li class="nav-item <%if(index == 10){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/shorten/index.jsp">  <i class="fa fa-files-o"></i> shortenURL</a>
				</li>
				
			</ul>
			<ul class="navbar-nav ">
			<%if(memberDto == null){%>
				<li class="nav-item <%if(index == 1){%> active <%}%>">
					<a class="nav-link" href="<%=conPath%>/member/register.jsp"><i class="fa fa-registered"></i> Register</a>
				</li>
			<% } %>
				
				<li class="nav-item <%if(index == 11){%> active <%}%>">
							<%if(memberDto == null){ %>
					<a class="nav-link" href="<%=conPath%>/member/login.jsp"> Login</a>
					<%} else{%>
					<a class="nav-link" href="<%=conPath%>/member/logout.jsp"> Logout</a>
					<%} %>
				</li>
			</ul>
		</div>
	</nav>
	
	