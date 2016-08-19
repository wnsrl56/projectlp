<%@page import="com.project.model.dto.Board"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<!--  start to head -->
<!-- 설정내용 넣어놓기 -->
<c:import url="../../../views/include/import.jsp" />
<!--  end of head -->

<!--  start to body -->
<body>
	<script type="text/javascript">
	$(function () {
		$("a[data-noticeno]").on('click',function(event){
			//alert($(this).attr('data-noticeno'));
			$('#collapseExample div').text($(this).attr('data-noticeno'));
			$('#collapseExample').slideToggle();
			
		})
		
		$("button").on('click',function(event){
			
			
			 //alert($(this).attr('id'))
			
				
			  partynotice = {
 			  			"noticeNo" : $(this).attr('id')
 			  			 } ;
 			 	
			 partynotice = JSON.stringify(partynotice);
 			
		 			$.ajax({
		 		
		 			url: "/lp/pboard/delete.action",
		 			type : "post",
		 		    data: partynotice,
		 		    contentType: "application/json",
		 			success : function(data, status, xhr) {
		 				
		 				// alert("저장했습니다.");
		 				 location.reload();
		 				
		 			},beforeSend:function(){
		 		       
		 				 
		 		    },
		 			
		 			error:function(request,status,error){
		 		      // alert("저장에 실패했습니다.");
		 	       }
		
					
		
		});
	});
	
	});
	
	
	
	</script>
	<!--  include header -->
	<c:import url="../../../views/include/header.jsp" />

	<!--  include body -->

	<div id="allcontainer" class="container-fluid "
		style="margin-top: 80px">



		<div class="col-md-2" role="main" id="sidebar">
			<ul class="nav nav-pills nav-stacked">
				<li role="presentation" class="active"><a href="insert.action"><p class="text-center">공지사항 등록</p></a></li>
			</ul>



		</div>
		<!-- sidebar end -->


		<div class="col-md-6" role="complementary" id="list">

			<c:choose>
				<c:when test="empty partynotices">
					<table width="700" border="1" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center">게시판에 저장된 글이 없습니다.</td>
						</tr>
					</table>
				</c:when>

				<c:otherwise>


					<h3>Notice</h3>
					<hr>


					<div class="collapse" id="collapseExample">
									<div class="well">
										
									</div>
								</div>
					<table class="table table-condensed" style="margin: auto">

						<tr style="height: 25px" align="center">
							<th>글 번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
							

						</tr>
						
						<c:forEach var="partynotice" items="${ partynotices }" varStatus="status">
							<%-- AAA.rows는 레코드 배열을 반환한다 --%>
							<tr>
								<td>${ partynotice.noticeNo }</td>

								<td>
								<a class="btn btn-primary" href="#" data-noticeno="${partynotice.context}">${ partynotice.title }</a>
								</td>
								
								
								
								<td>${ partynotice.dateChanged }</td>
								<td>${ partynotice.viewCount }</td>
						<th><button type="button" class="btn btn-primary" id="${ partynotice.noticeNo }">
							삭제
							</button></th>
								
							</tr>
						</c:forEach>



					</table>

				</c:otherwise>

			</c:choose>


		</div>



		<!-- list end -->



		<%-- <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">Header</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	   		<div class="row">
	               <div class="col-sm-6 col-md-4">
	              
						   <p>${ board.title }</p>
						   <hr>
						    <a href="#" class="thumbnail">
						      <img src="<%=cp%>/resources/img/empty.PNG" alt="...">
						    </a>
						    <hr>
						    <c:out value = "${board.regDate}"/>
				</div>

		</div>
</div>
</div>
</div>
</div> --%>



	</div>

	<!--  modal phase -->
	<script type="text/javascript">

		$('a').on('click', function() {

		
			/* 	 $.ajax({
			    	          url:'/PS/board/check.action',
			    	          type:'POST',
			    	          data:boardNo,
			    	          dataType:'text',
			    	          success: function (result) {
			    	             
			    	                 	
			    					
			  							
			    	  					
			    	  						
			    	  					/* $('#registerBtn').on('click',function(){
			    	  						$.ajax({
			    						    	          url:'/TP/member/register.action',
			    						    	          type:'POST',
			    						    	          data:member,
			    						    	          contentType:'application/json',
			    						    	  		  success: function (result) {

			    						  		    	   
			    						    	  			 alert('성공성공1');
			    						    	  		 }
			    						    	  		 });
			    	  					}); */

		});
	</script>


</body>
<!--  end of body -->






</html>



