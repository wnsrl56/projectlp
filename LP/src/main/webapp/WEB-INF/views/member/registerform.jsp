<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/views/include/import.jsp" />
	
<title>회원가입</title>   
    <!-- 회원가입 폼 관련 css, js -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<%--     <link href="${ cp }/resources/css/registerbootstrap.min.css" rel="stylesheet">
     <script src="<c:url value='/resources/js/registerbootstrap.min.js'/>" > </script> --%>
</head>
<body>	
	  <article class="container">	  
        <div class="page-header">
        	<c:import url="/WEB-INF/views/include/header.jsp" />
        </div>
        <div align="center"><h1>회원가입 <small>basic form</small></h1></div>
        <div class="col-md-6 col-md-offset-3">
          <%-- <form:form action="register.action" method="post" modelAttribute="member" > --%>
          <form:form action="${cp}/member/register.action" method="post" modelAttribute="member" >
            <div class="form-group">
              <label for="email">이메일 주소</label>
              <input type="email" class="form-control" name="email" placeholder="이메일 주소">
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
              <input type="text" class="form-control" name="name" placeholder="이름을 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="sexual">성별</label> &nbsp;
              <input class="" type="radio" name="sexual" value="male" checked> Male&nbsp;&nbsp; 
  			  <input class="" type="radio" name="sexual" value="female"> Female&nbsp;&nbsp;
  			  <input class="" type="radio" name="sexual" value="other"> Other <br>              
            </div>
            <div class="form-group">
              <label for="grade">학년</label> &nbsp;
              <input class="" type="radio" name="grade" value="초" checked> 초등학생 &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="중"> 중학생  &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="고"> 고등학생 &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="재수생"> 재수생 &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="대학생"> 대학생 &nbsp;&nbsp;
  			  <input class="" type="radio" name="grade" value="일반인"> 일반인 <br>  
            </div>
            <div class="form-group">
              <label for="userType">사용자 구분</label> &nbsp;
              <input class="" type="radio" name="userType" value="사용자" checked> 사용자 &nbsp;&nbsp; 
  			  <input class="" type="radio" name="userType" value="관리자"> 관리자 &nbsp;&nbsp;  			                
            </div>
           <!--  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">HTML</a></li>
      <li><a href="#">CSS</a></li>
      <li><a href="#">JavaScript</a></li>
    </ul>
    </div> -->
        <!--     <div class="form-group">
              <label for="username">휴대폰 인증</label>
              <div class="input-group">
                <input type="tel" class="form-control" id="username" placeholder="- 없이 입력해 주세요">
                <span class="input-group-btn">
                  <button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
                </span>
              </div>
            </div> -->
            <!-- <div class="form-group">
              <label for="username">인증번호 입력</label>
              <div class="input-group">
                <input type="text" class="form-control" id="username" placeholder="인증번호">
                <span class="input-group-btn">
                  <button class="btn btn-success">인증번호 입력<i class="fa fa-edit spaceLeft"></i></button>
                </span>
              </div>
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
              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form:form>
        </div>
      </article>	
</body>
</html>