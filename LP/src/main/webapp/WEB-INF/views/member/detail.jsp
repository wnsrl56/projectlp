<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.project.model.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/views/include/import.jsp" />
	<title>마이페이지</title>
	<script type="text/javascript">
	// 개인정보 수정
	$(function () {
    	$('#edit').on('click', function (event) {
    		var flag = "edit"; // 탈퇴/수정 구분 위한 flag	
    		checkPw(flag);
    	});
    	
    	$('#leave').on('click', function (event) {
    		var flag = "leave"; // 탈퇴/ 수정 구분 위한 flag	
    		checkPw(flag);
    	});
    	$('#back').on('click', function (event) {
    		url = "/rean/home.action";
	 		location.href = url;
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
        			url: "/rean/account/check.action",
        		 	type : "post",
        		 	data : account,
        			success : function(data, status, xhr) {
        				if (data == "success") {
	   			 			if (flag == "edit") { // 수정       			 		
	   			 				url = "edit.action";
	   	    		 			location.href = url;
	   			 			} else if (flag == "leave") { // 탈퇴
	  			 				url = "leave.action";
	   	    		 			location.href = url;
	   			 			} else {
	   			 				alert("flag error"); // 에러
	   			 			}
        				} else if (data == "fail") {
        					alert("비밀번호가 틀림!");
        					return;
        				} else {
        					alert("error")
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
	

    
	
	}
	
	///function 버튼 active 체인지
			
		
		

	
	
	
	)  	

	
	
	
	
	
	// _____________________________________________
		//forAjax
		$(function() {

			//send context to server 	
			$('.won').on('click', function(event) {

				var answer;
				var questNo;
				
				var check = $(this).attr('id');
				if(check.indexOf('good') >= 0){
					
					questNo = check.substring(4,check.length);
					
				answer = {
					"questNo" : questNo
				};
				answer = JSON.stringify(answer);

				$.ajax({

					url : "/lp/qboard/good.action",
					type : "post",
					data : answer,
					contentType : "application/json",
					success : function(data, status, xhr) {

						// alert("저장했습니다.");
						location.reload();

					},
					beforeSend : function() {

					},

					error : function(request, status, error) {
						alert("저장에 실패했습니다.");
					}

				});
				
				}

			})
			
		});
	</script>
	
	<style type="text/css">
		/***
User Profile Sidebar by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
***/

body {
  background: #F1F3FA;
}

/* Profile container */
.profile {
  margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
  padding: 20px 0 10px 0;
  background: #fff;
}

.profile-userpic img {
  float: none;
  margin: 0 auto;
  width: 50%;
  height: 50%;
  -webkit-border-radius: 50% !important;
  -moz-border-radius: 50% !important;
  border-radius: 50% !important;
}

.profile-usertitle {
  text-align: center;
  margin-top: 20px;
}

.profile-usertitle-name {
  color: #5a7391;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 7px;
}

.profile-usertitle-job {
  text-transform: uppercase;
  color: #5b9bd1;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 15px;
}

.profile-userbuttons {
  text-align: center;
  margin-top: 10px;
}

.profile-userbuttons .btn {
  text-transform: uppercase;
  font-size: 11px;
  font-weight: 600;
  padding: 6px 15px;
  margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
  margin-right: 0px;
}
    
.profile-usermenu {
  margin-top: 30px;
}

.profile-usermenu ul li {
  border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
  border-bottom: none;
}

.profile-usermenu ul li a {
  color: #93a3b5;
  font-size: 14px;
  font-weight: 400;
}

.profile-usermenu ul li a i {
  margin-right: 8px;
  font-size: 14px; 
}

.profile-usermenu ul li a:hover {
  background-color: #fafcfd;
  color: #5b9bd1;
}

.profile-usermenu ul li.active {
  border-bottom: none;
}

.profile-usermenu ul li.active a {
  color: #5b9bd1;
  background-color: #f6f9fb;
  border-left: 2px solid #5b9bd1;
  margin-left: -2px;
}

/* Profile Content */
.profile-content {
  padding: 20px;
  background: #fff;
  min-height: 460px;
}
	</style>
	
</head>
<body>
	<c:set var="member" value="${ sessionScope.loginuser }"/>
	<div style="margin-bottom:70px">
	<c:import url="/WEB-INF/views/include/header.jsp" />
	</div>
	<!--
User Profile Sidebar by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
-->
	<div class="container">
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
					<img src="/rean/resources/images/profile.jpg" class="img-responsive" alt=""
					 >
					 <!-- style ="width:100px; height:120px; margin-bottom:5px" -->
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						${member.name} 님 환영합니다.
					</div>					
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
					<button type="button" class="btn btn-success btn-sm" id="edit">회원 정보 수정</button>					
					<button type="button" class="btn btn-warning btn-sm" id="leave">회원  탈퇴</button>
				</div>
				<!-- END SIDEBAR BUTTONS -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav" id="clickmenu">
						<li class="active">
							<a href="/rean/member/detail.action">
							<i class="glyphicon glyphicon-user"></i>
							내 정보 </a>
						</li>
						  <c:if test="${sessionScope.loginuser.userType == 'admin' }">
						<li>
						<a href="/rean/member/list.action">
							<i class="glyphicon glyphicon-question-sign"></i>
						   회원 리스트 </a>
						</li>
						
						   </c:if>
						<!--  <li>
							<a href="#" target="_blank">
							<i class="glyphicon glyphicon-ok-sign"></i>
							답변 </a>
						</li>
						<li>
							<a href="#">
							<i class="glyphicon glyphicon-pushpin "></i>
							스크랩 </a>
						</li>
						<li>
							<a href="#" target="_blank">
							<i class="glyphicon glyphicon-heart-empty"></i>
							친구 </a>
						</li>
						<li>
							<a href="#">
							<i class="glyphicon glyphicon-tags"></i>
							그룹 </a>
						</li> -->
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		
		<div class="col-md-9">
			<div id="profile">
            <div class="profile-content">
				 <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">회원정보</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> 
                	<img alt="User Pic" src="/rean/resources/images/profile.jpg" class="img-circle img-responsive"> 
                <!-- 	<a href="#" class="btn btn-primary" style="margin-top:10px">사진 등록</a> -->
                </div>
               
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>이메일 </td>
                        <td>${member.email}</td>
                      </tr>
                      <tr>
                        <td>이 름 </td>
                        <td>${member.name }</td>
                      </tr>
                      <tr>
                        <td>성 별 </td>
                        <td>${member.sexual }</td>
                      </tr>
                      <tr>
                        <td>가입일자</td>
                        <td>${member.regDate}</td>
                      </tr> 
                       
                     
                    </tbody>
                  </table>
                  <!-- 
                  <a href="#" class="btn btn-primary">My Sales Performance</a>
                  <a href="#" class="btn btn-primary">Team Sales Performance</a> 
                  -->
                </div>
              </div>
            </div>   
            </div>
		</div>
		</div>
		<%-- <div id="question">
			<div class="profile-content">
				 <div class="panel panel-info">
					<div class="panel-heading">
              			<h3 class="panel-title">내가 한 질문</h3>
            		</div>
            		<div class="panel-body">
              			<div class="row">
               			<table class="table table-user-information">
		                    <tbody>
		                    <c:choose>
		                    	<c:when>
        		              <tr>
                		        <td>이메일 </td>
                        		<td>${member.email}</td>
                      		  </tr>
                      		 	</c:when>
                      		 	<c:otherwise>
                      		  <tr>
                        		<td>이 름 </td>
                        		<td>${member.name }</td>
                      		  </tr>
                      		  </c:otherwise>
                      		 </c:choose>
                      		  <tr>
                        		<td> 질문 목록이 없습니다. </td>                        		
                              </tr>
                      		 
                  			</tbody>
                  		</table>
						</div>
					</div>
				</div>
			</div> --%>
</div>
		
	
	
<%-- 	<div style="height: 100px;"></div>
	<div id="content" >
		<c:set var="member" value="${ sessionScope.loginuser }"/>
		<div>회원정보 </div>
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
    </div> --%>
	<!-- 열쇠글 확인 모달 -->
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
	<!-- 열쇠글 확인 모달 끝 -->
	
	
	
	<%-- 
<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2" style="padding-top:12%;padding-left:7%">
				<div class="col-xs-2">
					<ul class="nav nav-pills nav-stacked">
						<li>
						<a href="/teamfive/member/view.action"
							style="background-color: #F6FFCC; color: black; text-align: center;">
								회원 정보								
						</a></li>
						
						<li>
						<a href="/teamfive/member/album.action"
							style="background-color: #F6FFCC; color: black; text-align: center;">
							내가 쓴 글							
						</a></li>
					</ul>
				</div>
			</div>
			<div class="span10">
				<div class="col-xs-7">
					<div class="container">
						<div class="well well-lg" style="background-color:#ffffff">
							<table class="table">
								<tr>
									<th align="center"><a href="#"><img id="myimg" width="200px" height="200px"
										class="img-circle"
										src="/teamfive/resources/image/${ member.getProfileImageName() }"></a>
									</th>
									<td>
									<form id="uploadform" action="upload.action" method="post"
										enctype="multipart/form-data">
										<div>
											<h4 style="font-weight: bold">사진 등록</h4>
											<input id="memberno" type="hidden" name="memberNo"
												value="${ member.memberNo }"> <input type="file"
												id="profile" name="profile" /> <img id="blah" src=""
												width="120px" height="180px" class="img-circle"
												style="padding-top: 30px;padding-bottom:30px;"/> 
												<input type="submit" value="&nbsp;&nbsp;사진 등록&nbsp;&nbsp;"
													class="btn btn-primary btn-sm" style="margin-left:30px" />
										</div>
									</form>
									</td>
								</tr>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	 --%>



</body>
</html>



