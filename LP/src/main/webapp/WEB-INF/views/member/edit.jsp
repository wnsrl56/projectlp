<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/views/include/import.jsp" />
	<script type="text/javascript">
	$('#selectGrade').on('click', function(event){
    	// 모달띄우기
    	$('#selectGradeModal').modal('show'); 
    	// 마우스 호버링
    	$('.selectGradeButton').mouseenter(function(){
    		$(this).removeClass('btn-default').addClass('btn-primary');
    	}).mouseleave(function(){
    		$(this).removeClass('btn-primary').addClass('btn-default')});
    })    	
    // 학년 선택 후
	$('.selectGradeButton').on('click', function(event){
    	grade = $(this).text(); 		
    	alert(grade);
    	$('#selectGrade').text(grade);
    	$('#grade').val(grade); // hidden input 창에 value 부여
    	$('#selectGradeModal').modal('hide'); // 모달 닫기 
    })
    
    </script>
	<title>회원가입</title>      
</head>
<body>	
	<div class="modal fade" id="selectGradeModal" tabindex="-1" role="dialog"
		aria-labelledby="selectGradeModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="돌아가기">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="selectGradeModal">학년 선택</h4>
				</div>
				<div class="modal-body">
					<div>
					<button type="button" class="btn btn-default selectGradeButton"> 초1 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 초2 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 초3 </button>
					</div>
					<div>
					<button type="button" class="btn btn-default selectGradeButton"> 초4 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 초5 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 초6 </button>
					</div>
					<div>
					<button type="button" class="btn btn-default selectGradeButton"> 중1 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 중2 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 중3 </button>
					</div>
					<div>
					<button type="button" class="btn btn-default selectGradeButton"> 고1 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 고2 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 고3 </button>
					</div>
					<button type="button" class="btn btn-default selectGradeButton"> 대학생 </button>
					<button type="button" class="btn btn-default selectGradeButton"> 일반인 </button>					
				</div>				
			</div>
		</div>
	</div>	

	  <article class="container">	  
        <div class="page-header">
        	<c:import url="/WEB-INF/views/include/header.jsp" />
        </div>
        <div align="center"><h1>회원정보 수정 <small></small></h1></div>
        <c:set var="member" value="${ sessionScope.loginuser }"/>
        <div class="col-md-6 col-md-offset-3">
          <%-- <form:form action="register.action" method="post" modelAttribute="member" > --%>
          <form:form action="${cp}/member/edit.action" method="post" modelAttribute="member" >
            <div class="form-group">
              <label for="email">이메일 주소</label>
              <input type="email" class="form-control" name="email" placeholder="이메일 주소" value="${member.email}" readonly="readonly">
            </div>
            <div class="form-group">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" name="password" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="password2">비밀번호 확인</label>
              <input type="password" class="form-control" name="checkpassword" placeholder="비밀번호 확인">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" placeholder="이름을 입력해 주세요" value="${member.name}">
            </div>
            <div class="form-group">
              <label for="sexual">성별</label> &nbsp;
              <input class="" type="radio" name="sexual" value="male" checked> Male&nbsp;&nbsp; 
  			  <input class="" type="radio" name="sexual" value="female"> Female&nbsp;&nbsp;
  			  <!-- <input class="" type="radio" name="sexual" value="other"> Other <br> -->              
            </div>
            <div class="form-group">
              <label for="grade">학년</label> &nbsp;              
              <button type="button" class="btn btn-default" id="selectGrade"> ${member.grade} </button>
              <input type="hidden" class="form-control" name="grade" id="grade" value="${member.grade}">
              <!-- <input class="" type="radio" name="grade" value="초" checked> 초등학생 &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="중"> 중학생  &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="고"> 고등학생 &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="재수생"> 재수생 &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="대학생"> 대학생 &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="일반인"> 일반인 <br>   -->
            </div>
            <!-- <div class="form-group">
              <label for="userType">사용자 구분</label> &nbsp;
              <input class="" type="radio" name="userType" value="사용자" checked> 사용자 &nbsp;&nbsp; 
  			  <input class="" type="radio" name="userType" value="관리자"> 관리자 &nbsp;&nbsp;  			                
            </div> -->
           
            <div class="form-group">
                <label>약관 동의</label>
              <div data-toggle="buttons">
              <label class="btn btn-primary active">
                  <span class="fa fa-check"></span>
                  <input name="submit" id="agree" type="checkbox" checked value="1">
              </label>
              <a href="#">이용약관</a>에 동의합니다.
              </div>
            </div>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원 정보 수정<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">수정 취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form:form>
        </div>
      </article>	
</body>
</html>