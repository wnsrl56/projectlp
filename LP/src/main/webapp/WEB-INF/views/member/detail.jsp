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
	$(document).ready(function () {
    	$('#edit').on('click', function (event) {
    		var flag = "edit"; // 탈퇴/수정 구분 위한 flag	
    		checkPw(flag);
    	});
    	
    	$('#leave').on('click', function (event) {
    		var flag = "leave"; // 탈퇴/ 수정 구분 위한 flag	
    		checkPw(flag);
    	});
	    	
    // 비밀번호 확인	
  	function checkPw(flag) {
    	    	  		
    	$('#checkPwModal').modal('show'); // 모달 띄우기
    	$('#checkPw').on('click', function (event) { // 모달에 확인 버튼 누르면
    	
    		var account;
    		account = {
    			  		"email" : $('#modalEmail').val(),
    	  				"password" : $('#modalPw').val()
        			  };
    		
        	if ( $('#modalPw').val != null ) {
        		$.ajax({
        			url: "/LP/account/check.action",
        		 	type : "post",
        		 	data : account,
        			success : function(data, status, xhr) {
   			 			if (flag == "edit") { // 수정       			 		
   			 				url = "edit.action";
   	    		 			location.href = url;
   			 			} else if (flag == "leave") { // 탈퇴
  			 				url = "leave.action";
   	    		 			location.href = url;
   			 			} else {
   			 				alert("flag error"); // 에러
   			 			}
   	  				},         	  			
        	  		error:function(request,status,error) {
        			 		alert("ajax 응답 오류");
        			 		alert(request, status);
        			    }
        			});		        		        			
        		}
        	});	        	
    	}	    
	})  		
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
		<button id="edit" type="button" class="btn btn-success btn-sm" >회원수정</button>
        <button id="back" type="button" class="btn btn-default btn-sm">돌아가기</button>
		<button id="leave" type="button" class="btn btn-warning btn-sm">회원탈퇴</button>            
    	<!-- <a href="/LP/member/edit.action" class="btn btn-success btn-sm active" role="button">회원수정</a>
		<a href="/LP/home.action" class="btn btn-default btn-sm active" role="button">돌아가기</a>
       	<a href="/LP/member/leave.action" class="btn btn-warning btn-sm active" role="button">회원탈퇴</a> -->
    </div>

	<div class="modal fade" id="checkPwModal" tabindex="-1" role="dialog"
		aria-labelledby="checkPwModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="돌아가기">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="checkPwModalLabel">열쇠글 확인</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="email" class="control-label">e-Mail</label>
							<input type="email" class="form-control" id="modalEmail" value="${member.email}">
						</div>
						<div class="form-group">
							<label for="password" class="control-label">열쇠글</label>
							<input type="password" class="form-control" id="modalPw" >
						</div>
						<div id="pwMsg" style="hidden:hidden">비밀번호를 입력해 주세요.</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
					<button type="button" class="btn btn-primary" id="checkPw">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>



