<%@page import="java.util.Calendar"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "/inc/header.jsp" %>
<%
	String tempYear = request.getParameter("year");
	Calendar calendar = Calendar.getInstance();
	int cYear = calendar.get(Calendar.YEAR);
	if(tempYear == null || tempYear.length() == 0){
		tempYear = String.valueOf(cYear);
	}
	try{
		cYear = Integer.parseInt(tempYear);
	} catch(NumberFormatException e){
		cYear = Calendar.YEAR;
	}
	
%>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Crawling1</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title" >
						<select id = 'year' name = 'year' style = "float: right;">
						<%for(int i = cYear ; i >= 1983 ; i--){ %>
						<option value = '<%=i%>'><%=i%></option>
						<%} %>
						</select>		
						</h5>
						
						<div class="table-responsive-md">
									
						</div>
						<form class="form-horizontal" enctype = "multipart/form-data" role="form" name = "f" method = "post" action = "crawling1_Download.jsp?year=<%=cYear%>">
						 	<button id="saveExcel" class="btn btn-outline-info" style = "float: right;">Excel Download</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
	
		$('#year').on('change',function(){
			let url = "http://localhost/crawling/crawling.jsp?year="+$('#year option:selected').val();
			history.pushState(null, null, url)
			$.ajax({
				type : 'GET',
				dataType : 'html',
				url : 'crawling1_ajax.jsp?year='+$('#year option:selected').val(),
				error : function(){
					alert('에러발생');
				},
				success : function(html){
					$('.table-responsive-md').children().remove();
					$('.table-responsive-md').html(html);
				}	
			})
		});
		
		$('#saveExcel').on('click', function(event){
			event.preventDefault();
			$.ajax({
				type : 'GET',
				dataType : 'html',
				url : 'crawling1_Download.jsp?year=<%=cYear%>',
				error : function(){
					alert('파일 다운이 불가능합니다.');
				},
				success : function(){
					alert('파일 다운이 완료되었습니다.');
				}
			});
			
		});
	
		$.ajax({
			type : 'GET',
			dataType : 'html',
			url : 'crawling1_ajax.jsp?year='+$('#year option:selected').val(),
			error : function(){
				alert('에러발생');
			},
			success : function(html){
				$('.table-responsive-md').children().remove();
				$('.table-responsive-md').html(html);
			}	
		});
		
		$(window).on('popstate', function(){
			let url = location.search;
			let cYear = new URLSearchParams(url).get("year");
			console.log(cYear);
			
			$.ajax({
				type : 'GET',
				dataType : 'html',
				url : 'crawling1_ajax.jsp?year='+cYear,
				error : function(){
					alert('error 발생');
				},
				success : function(html){
					$('.table-responsive-md').children().remove();
					$('.table-responsive-md').html(html);
				}
				
			});
		});
	
	
	</script>

<%@include file= "/inc/footer.jsp"%>