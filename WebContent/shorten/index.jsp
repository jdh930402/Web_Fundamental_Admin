<%@ page pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Shorten URL</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Shorten URL Generator</h5>
               <form class="form-horizontal" name = "f" method = "post" action = "createShortenUrl.jsp">
               
              <div class="form-group">
                <input type="text" class="form-control" id="url" name = "url" value="http://"/>
                <div id = "emailMessage" class = "message"> </div>
              </div>
              
              <div class="form-row d-flex align-items-center">
					<div class="form-group col-md-8">
					    <p id="shortenUrl">shorten url</p> 
					</div>
					<div class="form-group col-md-4">
						<button id="clip_copy"  data-clipboard-target="#shortenUrl"  class="btn btn-info btn-lg btn-block"><i class="fa fa-clipboard" aria-hidden="true"></i>  Copy to clipboard</button>
					</div>
			  </div>
           		
           		<a href="" id="refreshNumber" class="btn btn-info btn-lg btn-block"><i class="fa fa-refresh" aria-hidden="true"></i>Shorten URL GENERATOR</a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 <script>
 
 	// 키보드로 엔터버튼을 누른 경우
 	$('.form-horizontal').on('keydown', function(event){
	 	if( event.keyCode == 13){
	 		event.preventDefault();
	 		if( $('#url').val() == "" ){
	 			alert('URL을 입력하세요.');
	 			$('#url').focus();
	 			return;
	 		}
	 		
	 		// URL의 값이 net, co.kr, com으로 끝나지 않는 경우
	 		if( ($('#url').val().endsWith("net") || $('#url').val().endsWith("co.kr") || $('#url').val().endsWith("com")) === false ){
	 			alert('올바른 URL이 아닙니다.');
	 			$('#url').focus();
	 			return;
	 		}
	 		
	 		// 조건을 만족할 떄 shorten url을 생성한다.
	 		$.ajax({
	 			type : 'GET',
	 			dataType : 'json',
	 			url : 'createShortenUrl.jsp?url=' + $('#url').val(),
	 			error : function(){
	 				alert('ajax error');
	 			},
	 			success : function(json){
	 				if(json.message == "ok"){
	 					console.log(json);
	 					let shorten = json.result.url;
	 					$('#shortenUrl').html(shorten);
	 				}else{
	 					alert('주소를 다시 확인해주세요.');
	 				}
	 			}
	 		});
 		}
 	});
 	
 	
 	// refresh버튼을 누른 경우 
 	$('#refreshNumber').on('click', function(event){
 		event.preventDefault();
 		if( $('#url').val() == "" ){
 			alert('URL을 입력하세요.');
 			$('#url').focus();
 			return;
 		}
 		
 		if( ($('#url').val().endsWith("net") || $('#url').val().endsWith("co.kr") || $('#url').val().endsWith("com")) === false ){
 			alert('URL을 .');
 			$('#url').focus();
 			return;
 		}
 		
 		$.ajax({
 			type : 'GET',
 			dataType : 'json',
 			url : 'createShortenUrl.jsp?url=' + $('#url').val(),
 			error : function(){
 				alert('ajax error');
 			},
 			success : function(json){
 				if(json.message == "ok"){
 					console.log(json);
 					let shorten = json.result.url;
 					$('#shortenUrl').html(shorten);
 				}else{
 					alert('주소를 다시 확인해주세요.');
 				}
 			}
 		});
 	});
 	
 	// copy버튼을 누른경우
 	$("#clip_copy").on("click",function(e){
		e.preventDefault();
		var clipboard = new ClipboardJS('#clip_copy');
		clipboard.on('success', function(e) {
		    console.info('Action:', e.action);
		    console.info('Text:', e.text);
		    console.info('Trigger:', e.trigger);
		    e.clearSelection();
		    
		});
	});
 </script>
<%@include file="/inc/footer.jsp"%>