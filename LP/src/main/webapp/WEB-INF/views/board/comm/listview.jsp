<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<!-- set Script -->
<script type="text/javascript">


//forAjax
$(function() {
	 
				//send context to server 	
		 		$('#save').on('click',function(event){
	 			
	 			  var comm;
	 				
	 			  comm = {
	 			  			"context" :$('#context').val(),
	 			  			"title" : "test",
	 			  			"writer" : $('#currName').val()
	 			  			 } ;
	 			 	
	 			 	comm = JSON.stringify(comm);
	 			
			 			$.ajax({
			 		
			 			url: "insert.action",
			 			type : "post",
			 		    data: comm,
			 		    contentType: "application/json",
			 			success : function(data, status, xhr) {
			 				
			 				// alert("저장했습니다.");
			 				 location.reload();
			 				
			 			},beforeSend:function(){
			 		       
			 				 
			 		    },
			 			
			 			error:function(request,status,error){
			 		       alert("저장에 실패했습니다.");
			 	       }
	 			
	 		   });
	 		
	 		});
				
				
			
			//send reply to server
			$('.btn:submit').on('click',function(event){
				var reply;
 				var commNo;
 				
				var check = $(this).attr('id');
				
				if(check.indexOf('reply')>=0){
				
	 				commNo = check.substring(5,check.length);
	 				
	 			
	 				
	 				 reply = {
		 			  			"context" :$('#inputCommReply' + commNo).val(),
		 			  			"commNo" : commNo,
		 			  			"writer" : $('#currName').val()
		 			  			 } ;
		 			 	
	 				 reply = JSON.stringify(reply);
		 			
				 			$.ajax({
				 		
				 			url: "insertReply.action",
				 			type : "post",
				 		    data: reply,
				 		    contentType: "application/json",
				 			success : function(data, status, xhr) {
				 				//alert("리플을 저장 했습니다.");
				 				location.reload();
				 				
				 			},
				 			
				 			error:function(request,status,error){
				 		       alert("리플을 저장에 실패했습니다.");
				 	       } 
		 			
		 		   });  
					
				}
				
				
				
			});
			
			


});
</script>

<!--  loading page -->


	<div style="margin-bottom:70px">
	<c:import url="/WEB-INF/views/include/header.jsp" />
	</div>

	<!--  include body -->
	
	<div class="container">
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav" id="clickmenu">
						<li class="active">
							<a href="insert.action"><p class="text-center">Talk</p></a>
						</li>					
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		
		<div class="col-md-9">
			<div id="profile">
            <div class="profile-content">
				 
				 
		<div class="row" id="inputcontainer">
			<input type="hidden" id="currName" value="${ sessionScope.loginuser.name }"/>
				<div class="row">
					<div class="col-md-2" id="profile" style="width:80px;height:80px">
						<a href="#" class="thumbnail">
						  <img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
						</a>
					</div>
					<div class="col-md-10">
						<textarea  id="context" class="form-control" rows="4" style="height:103px" placeholder="이야기를 적어주세요."></textarea>
					</div>
				</div>
				 <p>&nbsp;&nbsp;</p>
				<div class="col-md-11">
				<nav class="pull-right">
				 	<button type="submit" class="btn btn-danger" id="save">이야기 남기기</button>	
				</nav>
			
				</div>
			</div>
				 
				 <hr>
				 
				 <c:choose> 
					
		    			<c:when test="${empty comms }">
					        <table class="table">
					        <tr>
					            <td align="center">작성된 이야기가 없습니다.</td>
					        </tr>
					        </table>
					    </c:when>
		    			
		    			
		    			
		    			<c:otherwise>
    					  <c:forEach var="comm" items="${ comms }">
						    <div class="row">	
										<!--  profile picture -->
										<div class="col-md-2" id="profile" style="width:80px;height:80px">
											<a href="#" class="thumbnail">
												<img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
											</a>
										</div>
										
										<div class="col-md-10" id="texttable">
											<div class="row">
													<!--  top manu bar -->
													<div class="col-md-12">
														<ul class="nav nav-pills">
					     									 <li><a href="#" id="username"> ${ comm.writer }</a></li>
					     									 	<!--  dropdown button -->
					     									 	<span style="float:right">
					     									 		<span class="label label-primary">${ comm.dateChanged }</span>
					            								     <div class="btn-group pullRight">
					            								        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																		   <span class="caret"></span>
																		  </button>
																			  <ul class="dropdown-menu">
																				    <li><a href="">삭제</a></li>
																			  </ul>
																	</div>
																</span>
					       							    </ul>
					       							 </div>
								       				
								       				 <!--  context -->
								       				 <div class="col-md-12" id="contextdata">
								       				 	
								       				 	<div class="panel panel-info">
								       				 	<div class="panel-body">
													    <p>${ comm.context }</p>
													    </div>
								       				 	
								       				 	</div>
								       					
								       				 </div>
								       				 
								       				 
								       				 <!-- reply -->
								       			
								       				 <div class="row">
								       				 <div class="col-md-12" id="replytable">
								       				  <div class="col-md-10" name="replytable">
															<div class="row">
																	<!--  top manu bar -->
														 			
																<c:forEach var="reply" items="${ comm.reply }">
																	<div class="col-md-12">
																	 <!--  profile picture -->
																		
									     									<!--  context -->
													       				 	<div class="panel panel-info">
													       				 	<div class="panel-body">
													       				 	<div class="col-md-2" id="profile" style="width:80px;height:80px">
																			<a href="#" class="thumbnail">
																				<img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
																				<span> ${reply.writer }</span>
																			</a>
																		</div>
																		
													       				 	  <span class="panel-info">${ reply.context }</span>
																		    </div>
																		    </div>
													       				 
									       							 </div>
									       							 	</c:forEach>
									       							
									       								<p>&nbsp;&nbsp;</p>
									       							 <div class="col-md-12">
									       							<div class="input-group" name="replyinput">
																		<div class="input-group-btn">
																	   	  <button class="btn btn-info"><span class="glyphicon glyphicon-align-justify"></span></button>
																	   </div>
																	   
																	    <input type="text" class="form-control" id="inputCommReply${ comm.commNo }" aria-describedby="inputCommReply" value=""/>
																	    <div class="input-group-btn">
																		    <button type="submit" class="btn btn-info" id="reply${ comm.commNo }">확인</button>
																		 </div>
							    									</div>
							    									</div><!--  end of replyinput --> 
							    									
												       		 </div>
														</div>
														</div>
													</div>
											
							</div>	
							<p>&nbsp;&nbsp;</p>
							</div>
							</div>
							</c:forEach>        	
							
											
											
						 </c:otherwise>
					</c:choose>
				 
            </div>
		</div>
		</div>
		</div>
		</div>




<!-- ---------------------------------------------------------------------------- -->
<%-- <div id="allcontainer" class="container-fluid " style="margin-top:80px" >
  
  	<div class="row" id="grid">
  	
  	 <div class="col-md-2" role="main" id="sidebar">
  		<ul class="nav nav-pills nav-stacked">
     		 <li role="presentation" class="active"><a href="#"><h4><p class="text-center">Talk</p></h4></a></li>
       </ul>
  
       
  	 </div><!-- sidebar end --> 
  	 
  	  <div class="col-md-6" role="complementary" id="list">
  	  <h3> Community </h3>
  	  <hr>
			
			<div class="row" id="inputcontainer">
			<input type="hidden" id="currName" value="${ sessionScope.loginuser.name }"/>
				<div class="row">
					<div class="col-md-2" id="profile" style="width:80px;height:80px">
						<a href="#" class="thumbnail">
						  <img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
						</a>
					</div>
					<div class="col-md-10">
						<textarea  id="context" class="form-control" rows="4" style="height:103px" placeholder="이야기를 적어주세요."></textarea>
					</div>
				</div>
				 <p>&nbsp;&nbsp;</p>
				<div class="col-md-11">
				<nav class="pull-right">
				 	<button type="submit" class="btn btn-danger" id="save">이야기 남기기</button>	
				</nav>
			
				</div>
			</div>
			
			
			
			
			<hr>
		 
		 <div class="row" id="textcontainer">
		 			
					<c:choose> 
					
		    			<c:when test="${empty comms }">
					        <table class="table">
					        <tr>
					            <td align="center">작성된 이야기가 없습니다.</td>
					        </tr>
					        </table>
					    </c:when>
		    			
		    			
		    			
		    			<c:otherwise>
    					  <c:forEach var="comm" items="${ comms }">
						    <div class="row">	
										<!--  profile picture -->
										<div class="col-md-2" id="profile" style="width:80px;height:80px">
											<a href="#" class="thumbnail">
												<img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
											</a>
										</div>
										
										<div class="col-md-10" id="texttable">
											<div class="row">
													<!--  top manu bar -->
													<div class="col-md-12">
														<ul class="nav nav-pills">
					     									 <li><a href="#" id="username"> ${ comm.writer }</a></li>
					     									 	<!--  dropdown button -->
					     									 	<span style="float:right">
					     									 		<span class="label label-primary">${ comm.dateChanged }</span>
					            								     <div class="btn-group pullRight">
					            								        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																		   <span class="caret"></span>
																		  </button>
																			  <ul class="dropdown-menu">
																				    <li><a href="">삭제</a></li>
																			  </ul>
																	</div>
																</span>
					       							    </ul>
					       							 </div>
								       				
								       				 <!--  context -->
								       				 <div class="col-md-12" id="contextdata">
								       				 	
								       				 	<div class="panel panel-info">
								       				 	<div class="panel-body">
													    <p>${ comm.context }</p>
													    </div>
								       				 	
								       				 	</div>
								       					
								       				 </div>
								       				 
								       				 
								       				 <!-- reply -->
								       			
								       				 <div class="row">
								       				 <div class="col-md-12" id="replytable">
								       				  <div class="col-md-10" name="replytable">
															<div class="row">
																	<!--  top manu bar -->
														 			
																<c:forEach var="reply" items="${ comm.reply }">
																	<div class="col-md-12">
																	 <!--  profile picture -->
																		
									     									<!--  context -->
													       				 	<div class="panel panel-info">
													       				 	<div class="panel-body">
													       				 	<div class="col-md-2" id="profile" style="width:80px;height:80px">
																			<a href="#" class="thumbnail">
																				<img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
																				<span> ${reply.writer }</span>
																			</a>
																		</div>
																		
													       				 	  <span class="panel-info">${ reply.context }</span>
																		    </div>
																		    </div>
													       				 
									       							 </div>
									       							 	</c:forEach>
									       							
									       								<p>&nbsp;&nbsp;</p>
									       							 <div class="col-md-12">
									       							<div class="input-group" name="replyinput">
																		<div class="input-group-btn">
																	   	  <button class="btn btn-info"><span class="glyphicon glyphicon-align-justify"></span></button>
																	   </div>
																	   
																	    <input type="text" class="form-control" id="inputCommReply${ comm.commNo }" aria-describedby="inputCommReply" value=""/>
																	    <div class="input-group-btn">
																		    <button type="submit" class="btn btn-info" id="reply${ comm.commNo }">확인</button>
																		 </div>
							    									</div>
							    									</div><!--  end of replyinput --> 
							    									
												       		 </div>
														</div>
														</div>
													</div>
											
							</div>	
							<p>&nbsp;&nbsp;</p>
							</div>
							</div>
							</c:forEach>        	
							
											
											
						 </c:otherwise>
					</c:choose>
		 			
		 	
		 	
		 	
		 	</div>
							
						 </div>
					</div>
					</div>
 --%>				
				
		 	
						
		
		</div>
		 
	
		 
  	
      </div><!-- list end --> 
  	 
 	 
		
  	 
  	 
	</div>
	
</div>

</body>
<!--  end of body -->
	

</html>



		  
		  