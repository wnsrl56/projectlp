<%@page import="com.project.model.dto.Board"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!--  start to head -->
<!-- 설정내용 넣어놓기 -->
<c:import url="../../../views/include/import.jsp"/>
<!--  end of head -->


<!--  start to body -->
<body>
<!--  include header -->
<c:import url="../../../views/include/header.jsp"/>

<!--  include body -->

<div id="allcontainer" class="container-fluid " style="margin-top:80px" >
  
  <div class="row" id="grid">
 	 
 	 <div class="col-md-2" role="main" id="sidebar">
  		<ul class="nav nav-pills nav-stacked">
     		 <li role="presentation" class="active"><a href="insert.action"><p class="text-center">질문 하기</p></a></li>
         </ul>
        
       
  	 </div><!-- sidebar end --> 
  	 
  	  <div class="col-md-6" role="complementary" id="list">
  	
  		 
    <c:choose> 
    <c:when test="${ empty quest }">
        <table width="700" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">게시판에 저장된 글이 없습니다.</td>
        </tr>
        </table>
    </c:when>
    
    <c:otherwise>
    
    <c:forEach var="quest" items="${ quests }">
    		<!-- <div class="col"> -->
    		<div style="width: 1200px" >
				  <div class="col-sm-6 col-md-3">
				    <div class="thumbnail">
										<table>
											<tr>
												<td><span class="glyphicon glyphicon-user btn-lg"
													aria-hidden="true"></span></td>
												<td>${ quest.writer }<br> ${ quest.regDate }
												</td>
												<td align="right">
													<!-- <span class="glyphicon glyphicon-option-vertical btn-lg" aria-hidden="true"></span> -->
													<div class="dropdown">
														<div class="dropdown-toggle"
															id="dropdownMenu1" data-toggle="dropdown"
															aria-expanded="true">
															<span class="glyphicon glyphicon-option-vertical btn-lg" aria-hidden="true"></span>
														</div>
														<ul class="dropdown-menu" role="menu"
															aria-labelledby="dropdownMenu1">
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#"><span class="glyphicon glyphicon-copy" aria-hidden="true"></span>&nbsp;스크랩</a></li>
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#"><span class="glyphicon glyphicon-cloud-upload" aria-hidden="true"></span>&nbsp;공유</a></li>
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#"><span class="glyphicon glyphicon-alert" aria-hidden="true"></span>&nbsp;신고</a></li>
														</ul>
													</div>

												</td>
											</tr>
										</table>
										<hr>
										<img src="${cp}/resources/image/${ quest.savedFilePath }" alt="..." style="width: 300px; height: 200px"> 
				      <div class="caption">
				      	<hr>
				      		#태그
				      	<hr>
				        <p>
				        <%-- <a href="<c:url value='/board/boardview.action'/>" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">답변하기</a> --%>
				        <%-- <a href="<c:url value='/board/boardview.action'/>" id="activeModal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">답변하기</a> --%> 
				       	<div>
												<table>
													<tr>
														<td><c:url value="boardview.action"
																var="viewUrl">
																<c:param name="questNo" value="${ quest.questNo }" />
															</c:url> <a id="activeModal" href="${ viewUrl }"> <span
																class="glyphicon glyphicon-pencil" aria-hidden="true">답변하기!!</span></a></td>
														<td>
															<c:url value="good.action"
																var="viewUrl">
																<c:param name="questNo" value="${ quest.questNo }" />
															</c:url> <a id="activeModal" href="${ viewUrl }"  style="color: red" >&nbsp; <span
																class="glyphicon glyphicon-heart-empty" aria-hidden="true">좋아요!!</span></a></td>
													</tr>
												</table>
											</div>
				        <!-- <a href="#" class="btn btn-default" role="button" >Button</a></p> -->
				      </div>
				    </div>
				  </div>
				</div>
     	</c:forEach> 
    
    	
    	
<%--             <c:forEach var="board" items="${boards}">AAA.rows는 레코드 배열을 반환한다
              	 <div class="col-sm-6 col-md-4">
					   <p>${ board.title }</p>
					   <hr>
					    <a href="#" class="thumbnail">
					      <img src=".." alt="...">
					    </a>
					    <hr>
					    <c:out value = "${board.regDate}"/>
					  </div>
					  
					  <div id="detail"></div>
					
      				  <div class='modal fade' >
      				  <div class='modal-dialog'>
      				   <p>${ board.title }</p>
					   <hr>
					    <a href="#" class="thumbnail">
					      <img src=".." alt="...">
					    </a>
					    <hr>
					    <c:out value = "${board.regDate}"/>
      				  
      				  </div></div>	 
              </c:forEach>     --%>
        
    </c:otherwise>
</c:choose>
  	  
  	  
  	  
		   
		  </div>
		  
      </div><!-- list end --> 
  	 
  	 
  	
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


	$('a').on('click',function(){
		
	
		
		$('.modal').modal();
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



