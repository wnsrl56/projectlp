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
				var url = "/rean/home.action";
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
      </div>
	  <div class="modal-body">
	    
	
								
										<a class="btn btn-outline" href="/rean/account/login.action">
										<div class="thumbnail">
										<img src="/rean/resources/images/error.png" alt="..." />
										</div>
										<span style="text-align:center">누르시면 로그인 페이지로 이동합니다.</span>
										</a> 
									
				    					
				    </div>
			
			
	    
	    
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>