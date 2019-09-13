<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.length() ==0 || tempPage.length() == 0){
	cPage = 1;
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
            <h5 class="card-title">회원가입</h5>
            <form class="form-horizontal" role="form" name = 'f' method = 'post' action = 'save.jsp?page=<%=page%>'>
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요">
           	    <div id="nameMessage" class = 'message'></div>
              </div>
              <div class="form-group">
                <label class="col-form-label" for="id">아이디</label>
                <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요">
             	<div id="idMessage" class = 'message'></div>
              </div>
              <div class="form-group">
                <label for="email">이메일 주소</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일 주소를 입력해주세요">
                <div id="emailMessage" class = 'message'></div>
              </div>
              <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
                <div id="pwdMessage" class = 'message'></div>
              </div>
              <div class="form-group">
                <label for="repwd">비밀번호 확인</label>
                <input type="password" class="form-control" name="repwd" id="repwd" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
 	            <div id="repwdMessage" class = 'message'></div>
              </div>
              <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <input type="tel" class="form-control" name="phone" id="phone" placeholder="휴대폰번호를 입력해 주세요">
              	<div id="phoneMessage" class = 'message'></div>
              </div>
              <!-- 
              <div class="form-group text-center">
                <button type="submit" id="join-submit" class="btn btn-primary">회원가입<i class="fa fa-check spaceLeft"></i>
                </button>
                <button type="reset" id= "cancle-submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i>
                </button>
              </div>
              -->
              <input type = "hidden" name = "checkId" id="checkId" value = "no">
              <input type = "hidden" name = "checkEmail" id="checkEmail" value = "no">
            </form>
            <div class="text-right">
				<a href="" id="saveMember" class="btn btn-outline-primary">등록</a>				
				<a href="list.jsp?page=<%=cPage%>" class="btn btn-outline-success">취소</a>
			</div>
               <script>
            		let regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
            	$(function(){
            		$('#saveMember').on('click', function(event){
            			event.preventDefault();
            			if($('#name').val().length == 0){
            				$('#nameMessage').html("<span class = 'text-danger'>필수 정보입니다.</span>");
            				$('#name').addClass('is-invalid');
            				$('#name').focus();
            			} else if( $('#id').val().length == 0){
            				$('#idMessage').html("<span class = 'text-danger'>필수 정보입니다.</span>");
            				$('#id').addClass('is-invalid');
            				$('#id').focus();  
            			} else if(regEmail.test($('#email').val())== false && $('#email').val().length != 0){
            				$('#emailMessage').html("<span class = 'text-danger'>이메일 주소를 다시 확인해주세요.</span>");
            				$('#email').addClass('is-invalid');
            				$('#email').focus();
            			} else if($('#email').val().length == 0){
            				$('#emailMessage').html("<span class = 'text-danger'>필수 정보입니다.</span>");
            				$('#email').addClass('is-invalid');
            				$('#email').focus();
            			} else if( ($('#pwd').val().length < 8 ||  $('#pwd').val().length > 16) && $('#pwd').val().length == 0 ){
            				$('#pwdMessage').html("<span class = 'text-danger'>필수 정보입니다.</span>");
            				$('#pwd').addClass('is-invalid');
            				$('#pwd').focus();
            			} else if( $('#repwd').val().length == 0){
            				$('#repwdMessage').html("<span class='text-danger'>필수 정보입니다.</span>");
            				$('#repwd').addClass('is-invalid');
            				$('#repwd').focus();
            			} else if( $('#phone').val().length == 0 ){
            				$('#phoneMessage').html("<span class = 'text-danger'>필수 정보입니다.</span>");
            				$('#phone').addClass('is-invalid');
            				$('#phone').focus();
            			} else if($('#checkId').val() == 'yes' && $('#checkEmail').val() == 'yes' && ($('#pwd').val().length >= 8 &&  $('#pwd').val().length <= 16) ){
    						f.submit();
    					} else{
    						return;
    					}
            

            		}); // end of register click event
            	}); // end of load event
            	$('#name').on('focusout', function(){
            		if($('#name').val().length == 0){
            			$('#name').removeClass('is-invalid');
            			$('#nameMessage').html("<span class = 'text-danger'>필수 정보입니다.</span>");
            		}
            	});
            	
            	$("#name").on("keydown", function(){
            		$('#name').removeClass('is-invalid');
            		$('#nameMessage').html("");
            	});
            
            	$("#id").on("focusout", function(){
            		$('#id').removeClass('is-invalid');
            		$('#idMessage').html('');
            		if( $('#id').val().length >= 4 && $('#id').val().length <= 12 ){
            			$.ajax({
            				type : 'GET',
            				url : 'check_id_ajax.jsp?id=' + $('#id').val(),
            				dataType : 'json',
            				error : function(){
            					alert('error');
            				},
            				success : function(json){
            					if(json.result == 'ok'){
            						$('#idMessage').html("<span class = 'text-danger'>이미 존재하는 아이디입니다.</span>"); 
            						$('#id').addClass('is-invalid');
            						$('#checkId').val('no');
            					}else if(json.result == 'fail'){
            						$('#idMessage').html("<span class = 'text-success'> 사용 가능한 아이디입니다.</span>")
            						$('#id').addClass('is-invalid');
            						$('#checkId').val('yes');
            					}             					            					
            				}     				
            			});			
            		}else if( ($('#id').val().length < 4 || $('#id').val().length > 12) &&  $('#id').val().length != 0) {
            			$('#idMessage').html("<span class = 'text-danger'>아이디는 4~12자만 가능합니다.</span>");
        				$('#id').addClass('is-invalid');
            		}else if($('#id').val().length == 0){
            			$('#idMessage').html("<span class = 'text-danger'>필수 정보입니다.</span>");
            		}
            	});
            	
            	$('#id').on('keyup',function(){
            		if( $('#id').val().length != 0 ){
            			$('#idMessage').html("");
            		}
            	});
            	
            	$("#email").on("focusout", function(){
            		$('#email').removeClass('is-invalid');
            		if(regEmail.test($('#email').val())== true){
            			$.ajax({
            				type : 'GET',
            				url : 'check_email_ajax.jsp?email=' + $('#email').val(),
            				dataType : 'json',
            				error : function(){
            					alert('error');
            				},
            				success : function(json){
            					if(json.result == 'ok'){
            						$('#emailMessage').html("<span class = 'text-danger'>이미 존재하는 이메일입니다.</span>"); 
            						$('#email').addClass('is-invalid');
            						$('#checkEmail').val('no');
            					}else if(json.result == 'fail'){
            						$('#emailMessage').html("<span class = 'text-success'>사용 가능한 이메일입니다.</span>")
            						$('#email').addClass('is-invalid');
            						$('#checkEmail').val('yes');
            					}             					            					
            				}     				
            			});
            		}else if(regEmail.test($('#email').val())== false && $('#email').val().length != 0) {
            			$('#emailMessage').html("<span class = 'text-danger'>이메일 주소를 다시 확인해주세요.</span>"); 
            		}else {
            			$('#emailMessage').html("<span class = 'text-danger'>필수 정보입니다.</span>"); 
            		}    		
            	});
            	
            	
            	
            	$('#pwd').on('focusout',function(){
            		if( ($('#pwd').val().length < 8 ||  $('#pwd').val().length > 16) && $('#pwd').val().length != 0 ){
            			$('#pwdMessage').html("<span class = 'text-danger'>비밀번호는 8~16자만 가능합니다.</span>");
            		} else if($('#pwd').val().length >= 8 && $('#pwd').val().length <= 16){
            			$('#pwdMessage').html("");
            		}else{
            			$('#pwdMessage').html("<span class='text-danger'>필수 정보입니다.</span>");
            		}
            	});
            	
            	$('#pwd').on('keyup',function(){
            		if( $('#pwd').val().length != 0 ){
            			$('#pwdMessage').html("");
            		}
            	});
            	

            	
            	$('#repwd').on('focusout',function(){
            		if( $('#pwd').val() != $('#repwd').val() && $('#repwd').val().length != 0 ){
            			$('#repwdMessage').html("<span class='text-danger'>비밀번호가 일치하지 않습니다.</span>");
            			$('#repwd').val("");
            		} else if( $('#pwd').val() == $('#repwd').val() && $('#repwd').val().length != 0 ){
            			$('#repwdMessage').html("");
            		} else if($('#repwd').val().length == 0){
            			$('#repwdMessage').html("<span class='text-danger'>필수 정보입니다.</span>");       			
            		}
            	});
            	
            	$('#repwd').on('keyup',function(){
            		if( $('#repwd').val().length != 0 ){
            			$('#repwdMessage').html("");
            		}
            	});    	
            </script>
          </div>
        </div>
      </div>

    </div>
  </div>
<%@include file="/inc/footer.jsp"%>