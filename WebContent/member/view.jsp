<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8" info="test"%>
<%@include file="/inc/header.jsp" %>
<%
	String tempSeq = request.getParameter("seq");
	int seq = 0;
	try{
		seq = Integer.parseInt(tempSeq);
	} catch(NumberFormatException e){
		seq=0;
	}
	
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.length() ==0 || tempPage.equals("0")){
	tempPage = "1";
	}
	try{
	cPage = Integer.parseInt(tempPage);
	} catch(NumberFormatException e){
	cPage = 1;
	}
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.select(seq);
	if(dto != null){
		String name = dto.getName();
		String id = dto.getId();
		String email = dto.getEmail();
		String pwd = dto.getPwd();
		String phone = dto.getPhone();
		String regdate = dto.getRegdate();
%>

  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="/">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Member</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">회원정보</h5>
            <form class="form-horizontal" role="form" name = 'f' method = 'post'>
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                	<p><%=name%></p>
              </div>
              <div class="form-group">
                <label class="col-form-label" for="id">아이디</label>
                <p><%=id%></p>
              </div>
              <div class="form-group">
                <label for="email">이메일 주소</label>
                <p><%=email%></p>
              </div>
              <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <p><%=phone%></p>
              </div>
              <div class="form-group">
                <label for="regdate">가입일</label>
                <p><%=regdate%></p>
              </div>
              <input type="hidden" name = "seq" value = "<%=seq%>">
              <input type="hidden" name = "page" value = "<%=cPage%>">
            </form>
            <div class="text-right">
				<a href="" id = "modifyEmp" class="btn btn-outline-primary">수정</a>
				<a href="" id = "deleteEmp" class="btn btn-outline-danger">삭제</a>		
				<a href="list.jsp?page=<%=cPage%>" class="btn btn-outline-success">리스트</a>
			</div>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@include file="/inc/footer.jsp"%>
<%
	} else{
%>
	<script>
		alert('회원정보가 없습니다.');
		history.back(-1);
	</script>
<%
}
%>