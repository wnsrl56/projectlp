<%@page import="com.project.model.dto.Board"%>
<%@page import="com.project.model.dto.Quest"%>
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
 	 
 	 <div class="col-sm-2 col-md-2" role="main" id="sidebar">
  		<ul class="nav nav-pills nav-stacked">
     		 <li role="presentation" class="active"><a href="insert.action"><p class="text-center">질문 하기</p></a></li>
         </ul>
        
       
  	 </div><!-- sidebar end --> 
  	 
  	  <div class="col-sm-9 col-md-9" role="complementary" id="list">
  	<input type="hidden" value="${ end }" id="endNo"/>
  		 
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
    		<!-- <div style="width: 100%;" > -->
				  <div class="col-sm-6 col-md-3">
				    <div class="thumbnail">
										<table>
											<tr>
												<td><span class="glyphicon glyphicon-user btn-lg"
													aria-hidden="true" style="color: navy;"></span></td>
												<td>${ quest.writer }<br> <span class="label label-primary">${ quest.dateChanged }</span>
												</td>
												<td align="right">
													<!-- <span class="glyphicon glyphicon-option-vertical btn-lg" aria-hidden="true"></span> -->
													<div class="dropdown">
														<div class="dropdown-toggle"
															id="dropdownMenu1" data-toggle="dropdown"
															aria-expanded="true">
															<span class="glyphicon glyphicon-option-vertical btn-lg" aria-hidden="true" style="color:gray;"></span>
														</div>
														<ul class="dropdown-menu" role="menu"
															aria-labelledby="dropdownMenu1">
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#" style="color:gray;"><span class="glyphicon glyphicon-copy" aria-hidden="true"></span>&nbsp;스크랩</a></li>
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#" style="color:gray;"><span class="glyphicon glyphicon-cloud-upload" aria-hidden="true"></span>&nbsp;공유</a></li>
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#" style="color:gray;"><span class="glyphicon glyphicon-alert" aria-hidden="true"></span>&nbsp;신고</a></li>
														</ul>
													</div>

												</td>
											</tr>
										</table>
										<hr>
										<img src="${cp}/resources/image/${ quest.savedFilePath }" alt="..." style="width: 300px; height: 200px"> 
				      <div class="caption">
				      	<hr>
				      		<a href="#" style="color:gray;">#태그</a>
				      	<hr>
				        <p>
				        <%-- <a href="<c:url value='/board/boardview.action'/>" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">답변하기</a> --%>
				        <%-- <a href="<c:url value='/board/boardview.action'/>" id="activeModal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">답변하기</a> --%> 
				       	<div>
												<table>
													<tr>
														<td><c:url value="questview.action"
																var="viewUrl">
																<c:param name="questNo" value="${ quest.questNo }" />
															</c:url> <a id="activeModal" href="${ viewUrl }"> <span
																class="glyphicon glyphicon-pencil" aria-hidden="true"><b>답변하기(${ quest.viewCount })</b> </span></a></td>
													<td>
														<div id="inputcontainer">
															<input type="hidden" id="questNo"
																value="${ quest.questNo }" />
															<nav class="pull-right">
															<a type="submit" id="good${ quest.questNo }" class="won" style="cursor:pointer">&nbsp;<span
																class="glyphicon glyphicon-heart-empty"
																aria-hidden="true" style="color: hotpink"><b>좋아요(${ quest.goodCount })</b>&nbsp;</span></a>
															
																<!-- <button type="submit" class="btn btn-danger" id="good">좋아요</button> -->
															</nav>
														</div>
													</td>
													<td align="right">
															<span class="glyphicon glyphicon-copy" aria-hidden="true" style="color: gray;">&nbsp;</span>
															<!-- <span class="glyphicon glyphicon-cloud-upload" aria-hidden="true" style="color: gray;"></span> -->
														</td>
													</tr>
												</table>
											</div>
				      
				      </div>
				    </div>
				  <!-- </div> -->
				</div>
     	</c:forEach> 
    
    
    </c:otherwise>
</c:choose>
  	 	
  	 
 </div>
		  
 </div><!-- list end --> 
  	 
  	  <div class="jumbotron">
  	  <p style="text-align:center"><Button href="#" class="btn btn-info" role="button"  id="more">More</Button></p> 
  	  </div>
		   
  	
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
	
				

<script type="text/javascript">
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

			
			
			
			
			//for more button
			
			$('#more').on('click', function(event) {

				var getMoreData;
				var start =$("#endNo").val();
				var add= start *1;
			  
				//alert(start);
									
			 	
			 	
			 

				$.ajax({

					url : "/lp/qboard/morepost.action",
					type : "post",
					data :start,
					contentType : "application/json",
					success : function(data) {
						
						 console.log(data);
						
						
						
					$.each(data, function(){
							
						var writer = this["writer"];	
						var dateChanged = this["dateChanged"];
						var viewCount = this["viewCount"];
						var questNo = this["questNo"];
						var goodCount = this["goodCount"];	
						
						
							$('#list').append(
							  '<div class="col-sm-6 col-md-3"><div class="thumbnail"><table><tr><td><span class="glyphicon glyphicon-user btn-lg" aria-hidden="true" style="color: navy;"></span></td><td>'
							+writer+'<br> <span class="label label-primary">'+dateChanged+'</span></td><td align="right"><div class="dropdown"><div class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">'
							+'<span class="glyphicon glyphicon-option-vertical btn-lg" aria-hidden="true" style="color:gray;"></span></div><ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"><li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:gray;"><span class="glyphicon glyphicon-copy" aria-hidden="true"></span>&nbsp;스크랩</a></li>'
							+'<li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:gray;"><span class="glyphicon glyphicon-cloud-upload" aria-hidden="true"></span>&nbsp;공유</a></li><li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:gray;"><span class="glyphicon glyphicon-alert" aria-hidden="true"></span>&nbsp;신고</a></li></ul></div></td></tr></table><hr>'
							+'<img src="${cp}/resources/image/${ quest.savedFilePath }" alt="..." style="width: 300px; height: 200px">' 
						    +'<div class="caption"><hr><a href="#" style="color:gray;">#태그</a><hr><p><div><table><tr><td><c:url value="questview.action" var="viewUrl">'
							+'<c:param name="questNo" value="${ quest.questNo }" /></c:url> <a id="activeModal" href="${ viewUrl }"> <span class="glyphicon glyphicon-pencil" aria-hidden="true">'
							+'<b>답변하기('+viewCount+')</b></span></a></td><td><div id="inputcontainer">'
							+'<input type="hidden" id="questNo" value="'+questNo+'" /><nav class="pull-right"><a type="submit" id="good'+questNo+'" class="won" style="cursor:pointer">&nbsp;<span class="glyphicon glyphicon-heart-empty" aria-hidden="true" style="color: hotpink"><b>좋아요('+goodCount+')</b>&nbsp;</span></a>'
							+'</nav></div></td><td align="right"><span class="glyphicon glyphicon-copy" aria-hidden="true" style="color: gray;">&nbsp;</span></td></tr></table></div></div></div></div>'
																	
							
							); 
							
							
						
						});
						
						add+= 4;
					   
						start = add;
						 $("#endNo").val(start);
						
					
				
					},
					error : function(request, status, error) {
						alert("저장에 실패했습니다.");
					}

				});
				 
				});

			
			
			
			
			
		});

</script>


</body>
<!--  end of body -->




	

</html>



