<%@ page pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
<%
	if(memberDto != null){
	int cPage = Integer.parseInt(request.getParameter("page"));
%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Employee</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">사원등록</h5>

						<form class="form-horizontal" role="form" name="f" method = "post" action ="save.jsp?page=<%=cPage%>">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for=no">사원번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "no" id="no" placeholder="사원번호를 입력해 주세요" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "name" id="name" placeholder="이름을 입력해 주세요" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="job">직책</label>
								<div class="col-sm-10">
									<input type="text"  class="form-control" name = "job" id="job" placeholder="직책을 입력해 주세요" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="mgr">담당사수</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "mgr" id="mgr" placeholder="담당사수를 입력해 주세요" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="hiredate">입사일</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "hiredate" id="hiredate" placeholder="입사일을 입력해 주세요" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="sal">급여</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "sal" id="sal" placeholder="급여를 입력해 주세요" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="comm">커미션</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "comm" id="comm" placeholder="커미션을 입력해 주세요" >
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="deptno">부서번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "deptno" id="deptno" placeholder="부서번호를 입력해 주세요" >
								</div>
							</div>
						</form>
						<div class="text-right">
							<a href="http://www.naver.com" id="saveEmp" class="btn btn-outline-primary">등록</a>
							<a href="list.jsp" class="btn btn-outline-success">취소</a>
						</div>
						
						<script>		
							$(function(){
								$('#saveEmp').on('click', function(event){
									event.preventDefault();
									// 유효성 검사
									let no = $('#no').val();
									let name = $('#name').val();
									let job = $('#job').val();
									let mgr = $('#mgr').val();
									let hiredate = $('#hiredate').val();
									let sal = $('#sal').val();
									let comm = $('#comm').val();
									let deptno = $('#deptno').val();
									
									if(!no){
										alert('사원번호를 입력해주세요..');
										$('#no').focus();
									}
									
									else if(!name){
										alert('이름을 입력해주세요..');
										$('#name').focus();
									}
									
									else if(!job){
										alert('직책을 입력해주세요..');
										$('#job').focus();
									}
									else if(!mgr){
										alert('담당사수를 입력해주세요..');
										$('#mgr').focus();
									}
									else if(!hiredate){
										alert('입사일을 입력해주세요..');
										$('#hiredate').focus();
									}
									else if(!sal){
										alert('급여를 입력해주세요..');
										$('#sal').focus();
									}
									else if(!comm){
										alert('커미션을 입력해주세요..');
										$('#comm').focus();
									}
									else if(!deptno){
										alert('부서번호를 입력해주세요..');
										$('#deptno').focus();
									}else{						
									f.submit();
									}
								});
							});
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
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
<%@include file="/inc/footer.jsp"%>