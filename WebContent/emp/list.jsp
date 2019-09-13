<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "/inc/header.jsp" %>
<%
	// get방식으로 받은 page를 판별
	String tempPage = request.getParameter("page");
	if(tempPage == null || tempPage.length()==0 || tempPage.equals("0")){
		tempPage = "1";
	}
	
	int cPage = 0;
	try{
		cPage = Integer.parseInt(tempPage);
		if(cPage < 0){
			cPage = Math.abs(cPage);
			System.out.println(cPage);
		}
	} catch(NumberFormatException e){
		cPage = 1;
	}

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
						<h5 class="card-title">사원목록</h5>
						<div class="table-responsive-md">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$.ajax({
			type : 'GET',
			dateType : 'html',
			url : 'list_ajax.jsp?page=<%=cPage%>',
			error : function(){
				alert('ajax error');
			},
			success : function(html){
				$('.table-responsive-md').children().remove();
				$('.table-responsive-md').html(html);
			}
		});
		
		const pageLoad = function(cPage){
			let url = 'http://localhost/emp/list.jsp?page='+cPage
			history.pushState(null, null, url);
			$.ajax({
				type : 'GET',
				dataType : 'html',
				url : 'list_ajax.jsp?page=' + cPage,
				error : function(){
					alert('버튼 클릭 error');
				},
				success : function(html){
					$('.table-responsive-md').children().remove();
					$('.table-responsive-md').html(html);
				}
			});
		}
		
		$(window).on('popstate', function(){
			let url = location.search;
			let cPage = new URLSearchParams(url).get("page");
			$.ajax({
				type : 'GET',
				dataType : 'html',
				url : 'list_ajax.jsp?page=' + cPage,
				error : function(){
					alert('뒤로가기 error');
				},
				success : function(html){
					$('.table-responsive-md').children().remove();
					$('.table-responsive-md').html(html);
				}
				
			});
			
		});
	</script>
	
<%@ include file = "/inc/footer.jsp" %>