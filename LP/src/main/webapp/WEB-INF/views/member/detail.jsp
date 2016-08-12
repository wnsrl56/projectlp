<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.project.model.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/include/import.jsp" />
<title>마이페이지</title>
<script type="text/javascript">
	// 개인정보 수정
	function edit() { 
		// 수정하려면 아이디 / 비번 입력 받기
		// 아이디 /pw 입력
		// ID/PW 조회 요청
		// 맞으면 edit.jsp 로
		// 틀리면 다시 입력
		// 입력/ 취소 버튼		
	}
	
</script>
</head>
<body>
	<div><c:import url="/WEB-INF/views/include/header.jsp" /></div>
	<div style="height: 100px;"></div>
	<div id="content" >
		<c:set var="member" value="${ sessionScope.loginuser }"/>
		<div>회원정보 ${ member.name }</div>
		<table class="table">			
			<tr>
				<th>이름</th>
				<td>${ member.name }</td>
				<th>성별</th>
				<td>${ member.sexual }</td>				
			</tr>
			<tr>
				<th>학년</th>
				<td>${ member.grade }</td>
				<th>등록일자</th>
				<td>${ member.regDate }</td>								
			</tr>
			<tr>
				<th>약관동의여부</th>
				<td>${ member.submit }</td>
				<th>가입사이트</th>	
				<td>${ member.extMember }</td>
			</tr>				
		</table>
	</div>
	<div class="form-group text-center">
       <button type="submit" class="btn btn-info">회원수정</button>
       <button type="submit" class="btn btn-warning">돌아가기</button>
       <button type="button" class="btn btn-info fa">회원탈퇴</button>
    </div>
</body>
</html>



