<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "/inc/header.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = dao.select(no);
	no = dto.getNo();
	String name = dto.getName();
	String loc = dto.getLoc();
	
%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Department</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">부서 상세정보</h5>

						<form class="form-horizontal" role="form" name = "f" method = "post" action = "modify.jsp">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="no">부서번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="no" name = "no" value = <%=no%> readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">부서명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name" name = "name" value = "<%=name%>">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="loc">부서위치</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id = "loc" name = "loc" value = "<%=loc%>">
								</div>
							</div>
						</form>

						<div class="text-right">
							<a href="modify.jsp" id = "modifyDept" class="btn btn-outline-primary">수정</a>
							<a href="list.jsp" id = "deleteDept" class="btn btn-outline-success">삭제</a>
							<a href="list.jsp" class="btn btn-outline-success">취소</a>
						</div>
						
						<script>
							$(function(){
								$('#modifyDept').on('click', function(event){
									event.preventDefault();
									f.action = 'modify.jsp';
									f.submit();
								});
								
								$('#deleteDept').on('click',function(event){
									event.preventDefault();
									f.action = 'delete.jsp';
									f.submit();
								});
							});
						
						</script>

					</div>
				</div>
			</div>

		</div>
	</div>
<%@ include file = "/inc/footer.jsp"%>