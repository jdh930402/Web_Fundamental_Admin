<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@page import="java.util.Calendar"%>
<%@page pageEncoding="utf-8"%>
<%@include file = "/inc/header.jsp" %>
	<!-- datepicker widget css -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%

	String coin = request.getParameter("coin");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	
	Calendar calendar = Calendar.getInstance();
	String cDate = Utility.getDate(calendar, "yyyyMMdd");
	if (coin == null){
		coin = "bitcoin";
	}
	if(start == null){
		start = cDate;
	}
	if(end == null){
		end = cDate;
	}
	
%>

<!doctype html>
<html lang="en">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Crawling2</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5>
							<button id="btnOk" style = "float: right;">확인</button>
							<input type="text" id = "end" class="testDatepicker" name = "end" style = "float: right;" placeholder="endDate"> 
							<span style = "float: right;"> ~ </span>
							<input type="text" id = "start" class="testDatepicker"  name = "start" style = "float: right;" placeholder="startDate"> 
							<select id = 'coin' name = 'coin' style = "float: right;">
							<option value = 'bitcoin'>Bitcoin</option>
							<option value = 'ethereum'> Ethereum</option>
							<option value = 'ripple'>XRP</option>
							<option value = 'bitcoin-cash'>Bitcoin Cash</option>
							<option value = 'litecoin'>Litecoin</option>
							</select>
						</h5>
						
						<div class="table-responsive-md">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	
	$('#coin').on('change', function(){	
		let url = "http://localhost/crawling/crawling2.jsp?coin="+ $('#coin option:selected').val();
		history.pushState(null,null,url);
		$.ajax({
			type : 'GET',
			dataType : 'html',
			url : 'crawling2_ajax.jsp?coin=' + $('#coin option:selected').val() + "&start=" + $('#start').val() + "&end=" + $('#end').val(),
			error : function(){
				alert('error');
			},
			success : function(html){
				$('.table-responsive-md').children().remove();
				$('.table-responsive-md').html(html);
			}			
		});
	});
	
	$(window).on('popstate', function(){
		let url = location.search;
		let coin = new URLSearchParams(url).get("coin");
		let start = new URLSearchParams(url).get("start");
		let end = new URLSearchParams(url).get("end");
		
		if (coin == null){
			coin = "bitcoin";
		}
		$.ajax({
			type : 'GET',
			dataType : 'html',
			url : 'crawling2_ajax.jsp?coin='+coin + "&start=" + start +"&end=" + end,
			error : function(){
				alert('error 발생');
			},
			success : function(html){
				$('.table-responsive-md').children().remove();
				$('.table-responsive-md').html(html);
			}	
		});
	});
	
	$(function() {
		$.ajax({
			type : 'GET',
			dataType : 'html',
			url : 'crawling2_ajax.jsp?coin=' + $('#coin option:selected').val() + "&start=" + $('#start').val() + "&end=" + $('#end').val(),
			error : function(){
				alert('error');
			},
			success : function(html){
				$('.table-responsive-md').children().remove();
				$('.table-responsive-md').html(html);
			}
		});
		    $('.testDatepicker').datepicker({
		         closeText: '닫기', 
		         dateFormat: "yymmdd"
		  });
		    
		    $('#btnOk').on('click',function(){
		    	let url = "http://localhost/crawling/crawling2.jsp?coin="+ $('#coin option:selected').val() + "&start=" + $('#start').val() + "&end=" + $('#end').val();
				history.pushState(null,null,url);
		    	$.ajax({
					type : 'GET',
					dataType : 'html',
					url : 'crawling2_ajax.jsp?coin=' + $('#coin option:selected').val() + "&start=" + $('#start').val() + "&end=" + $('#end').val(),
					error : function(){
						alter('error');
					},
					success : function(html){
						$('.table-responsive-md').children().remove();
						$('.table-responsive-md').html(html);
					}			
				});
		    });
	});
</script>
<%@include file = '/inc/footer.jsp'%>