<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.equals("0") || tempPage.length() == 0){
		tempPage = "1";
	}
	try{
		cPage = Integer.parseInt(tempPage);
	} catch(NumberFormatException e){
		cPage = 1;
	}
%>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Member</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">회원</h5>

							<div class="table-responsive-md">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			const pageLoad = function(page){
				let url =  'http://localhost/member/list_ajax.jsp?page='+page;
				history.pushState(null,null,url);
				$.ajax({
					type : 'GET',
					url : 'list_ajax.jsp?page=' + page,
					dataType : 'html', // jason, xml, html
					error : function(){
						alert('HTML Loading Error');
					},
					success : function(html){
					$('.table-responsive-md').children().remove();
					$('.table-responsive-md').html(html);						
					}
				});
			}
			
			$.ajax({
				type : 'GET',
				dataType : 'html',
				url : 'list_ajax.jsp?page=<%=cPage%>',
				error : function(){
					alter('page error');
				},
				success : function(html){
					$('.table-responsive-md').children().remove();
					$('.table-responsive-md').html(html);			
				}
			});
			
			$(window).on('popstate', function(){
				let url = location.search;
				let cPage = new URLSearchParams(url).get("page");
				$.ajax({
					type : 'GET',
					dataType : 'html',
					url : 'list_ajax.jsp?page=' + cPage,
					error : function(){
						alter('페이지 에러');
					},
					success : function(html){
						$('.table-responsive-md').children().remove();
						$('.table-responsive-md').html(html);
					}
				});
			});
		
		</script>
		
<%@include file="/inc/footer.jsp"%>