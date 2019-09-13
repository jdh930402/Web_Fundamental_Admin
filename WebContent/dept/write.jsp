	<%@ page pageEncoding="UTF-8"%>
<%@ include file = "/inc/header.jsp" %>
<%
	if(memberDto != null){
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
						<h5 class="card-title">부서등록</h5>

						<form class="form-horizontal" role="form" name = 'f' method = 'post' action = 'save.jsp'>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="no">부서번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "no" id="no" placeholder="부서번호를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">부서명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "name" id="name" placeholder="부서명을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="loc">부서위치</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name = "loc" id="loc" placeholder="부서위치를 입력해 주세요">
								</div>
							</div>
							
						</form>
						<div class="text-right">
							<a href="/" id = "saveDept" class="btn btn-outline-primary">등록</a>
							<a href="list.jsp" class="btn btn-outline-success">취소</a>
						</div>
						<script>
							$(function(){
								$('#saveDept').on('click', function(event){
									event.preventDefault();
									let no = $('#no').val();
									let name = $('#name').val();
									let loc = $('#loc').val();
									
									if(!no){
										alert('부서번호를 입력하세요');
										$('#no').focus();
									} else if(!name){
										alert('부서명을 입력하세요');
										$('#name').focus();
									}else if(!loc){
										alert('부서위치를 입력하세요');
										$('#loc').focus();
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
<%@ include file = "/inc/footer.jsp"%>