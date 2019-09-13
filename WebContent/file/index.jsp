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
      <li class="breadcrumb-item active" aria-current="page">Upload File</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">파일 업로드</h5>
            <%-- 파일 업로드 시에는 form 엘리먼트에 enctype 속성을 반드시 추가해야한다. --%>
            <form class="form-horizontal" enctype = "multipart/form-data" role="form" name = "f" method = "post" action = "upload.jsp">
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요">
           	    <div id="nameMessage" class = 'message'></div>
              </div>
              
              <div class="custom-file">
              	<input type="file" class="custom-file-input" name = "file" id="customFile">
              	<label class="custom-file-label" for="customFile">Choose file</label>
              </div>
            </form>
            <div class="text-right mt-3">
				<a href="" id="saveMember1" class="btn btn-outline-primary">업로드1</a>		
				<a href="" id="saveMember2" class="btn btn-outline-info">업로드2</a>			
				<a href="list.jsp?page=<%=cPage%>" class="btn btn-outline-success">취소</a>
			</div>
			<script>
			$(function(){
					$('#saveMember1').on('click',function(event){
						event.preventDefault();
						f.submit();
					});
					
					$('#saveMember2').on('click',function(event){
						event.preventDefault();
						$('#saveMember1').trigger('click'); //trigger()메서드는 selector의 기능을 사용한다.
					});
			});
			</script>
			
          </div>
        </div>
      </div>

    </div>
  </div>
<%@include file="/inc/footer.jsp"%>