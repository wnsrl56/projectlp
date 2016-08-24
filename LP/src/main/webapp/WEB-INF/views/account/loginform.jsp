<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>	
	<c:import url="/WEB-INF/views/include/import.jsp" />
	<title>로그인</title>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#loginModal').modal('show'); // 모달 띄우기	
			
			$('.cancel').on('click', function() {
				$('#loginModal').modal('hide'); 
				var url = "/LP/home.action";
		 		location.href = url;
			})
    	});
    </script>
</head>
<body>
<div class="modal fade" tabindex="-1" role="dialog" id="loginModal" aria-labelledby="loginModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close cancel" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="loginModal">로그인</h4>
      </div>
	  <div class="modal-body">
		<form class="form-group" action="login.action" method="post">
			<div class="form-group">
				<label class="sr-only" for="exampleInputEmail3">이메일</label> 
				<input type="email" class="form-control" name="email" placeholder="Enter email">
			</div>
			<div class="form-group">
				<label class="sr-only" for="exampleInputPassword3">열쇠글</label> 
				<input type="password" class="form-control" name="password"	placeholder="Password">
			</div>
			<div class="checkbox">
				<label> <input type="checkbox"> 기억하기 </label>
			</div>
			<button type="submit" class="btn btn-info">로그인</button>
			<button type="button" class="btn btn-default cancel" >취소</button>
		</form>
	   </div>
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>