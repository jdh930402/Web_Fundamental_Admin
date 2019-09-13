<%@ page pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
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
            <h5 class="card-title">로그인</h5>
            <% if(memberDto == null){ %>
            <form name = 'f' method = 'post' action = 'check_login.jsp'>
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Your Email *" id="eamil" name = "email" />
                <div id = "emailMessage" class = "message"> </div>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" placeholder="Your Password *" id="pwd" name = "pwd"/>
                <div id = "pwdMessage" class = "message" ></div>
              </div>
              
              <div class="form-row d-flex align-items-center">
                      <div class="form-group col-md-8">
                        <img class="form-control" src="" id="img_form_url"/>
                      </div>
                      <div class="form-group col-md-4">
                        <a href="" id="refreshNumber" class="btn btn-info btn-lg btn-block"><i class="fa fa-refresh" aria-hidden="true"></i> REFRESH</a>
                      </div>
              </div>
              <div class="form-group">
             	<input type="text" name="captchaCode" id="captchaCode" class="form-control" placeholder="캡차코드를 입력하세요" value="" />
              </div>
                 
              <div class="form-group">
                <input type="submit" class="btn btn-primary" id = "checkLogin" value="Login" />
              </div>
              <div class="form-group">
                <a href="#" class="ForgetPwd" id = "forgetPwd">Forget Password?</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 <script>
 		let captchaKey = "";
	 	$('#checkLogin').on('click', function(event){
 			event.preventDefault();	
 			
	 		if( $('#eamil').val().length == 0){
 				$('#emailMessage').html("<span class = 'text-danger'>아이디를 입력하세요.</span>");
 				$('#email').addClass('is-invalid');
 				$('#email').focus();
	 		}else if( $('#pwd').val().length == 0 ){
	 			$('#pwdMessage').html("<span class = 'text-danger'>비밀번호를 입력하세요.</span>");
	 			$('#email').addClass('is-invalid');
	 			$('#pwd').focus();
	 		}else if( $('#captchaCode').val() == ""){
	 			alert('캡차코드를 입력하세요');
	 			$('#captchaCode').addClass('is-invalid');
	 			$('#captchaCode').focus();
	 		}else{
	 			$.ajax({
	 				type : 'GET',
	 				dataType : 'json',
	 				url : 'captcha/getKeyResult.jsp?key='+captchaKey +'&value='+$('#captchaCode').val(), // 캡차 키, 입력한 값을 보내야한다.
	 				success : function(json){
	 					console.log(json);
	 					if(json.result === true){ //== : 값 비교 	=== : 값+타입 비교		
			 				f.submit();
	 					}else{
	 						alert('캡차코드가 잘못 되었습니다.');
	 						location.href="login.jsp";
	 					}
	 				}
	 			});
	 		}
	 	}); // login이벤트 종료 
	 	
	 	$('#refreshNumber').on('click', function(event){
	 		event.preventDefault();
	 		loadImage();
	 	});
	 	
	 	var loadImage = function(){
	 		$.ajax({
	 			url :'captcha/getKey.jsp',
	 			type :'GET',
	 			dataType :'json',
	 			error : function(){
	 				alert('실패');
	 			},
	 			success : function(json){
	 				console.log(json);
	 				captchaKey = json.key;
	 				$.ajax({
	 					type : 'GET',
	 					url : 'captcha/getImage.jsp?key='+captchaKey,
	 					xhrFields : {
	 						responseType : 'blob'
	 					},
	 					success : function(data){
	 						const url = window.URL || window.webketURL;
	 						const src = url.createObjectURL(data);
	 						$('#img_form_url').attr('src',src);	
	 					}
	 				});
	 			}
	 		});
	 	}
	 	loadImage();
	 	

 </script>
	 <%} else{ %>
 			<h5 class="card-title">로그인을 하셨습니다.</h5>
	 <%} %>
<%@include file="/inc/footer.jsp"%>