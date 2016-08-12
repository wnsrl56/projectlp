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
	 
	  
	 	
	 	
		
	 		$('#save').on('click',function(event){
	 			
	 			  var comm;
	 				
	 			  comm = {
	 			  			"context" :$('#context').val(),
	 			  			"title" : "hihihi",
	 			  			"writer" : "annoy"
	 			  			 } ;
	 			 	
	 			 	comm = JSON.stringify(comm);
	 			
			 			$.ajax({
			 		
			 			url: "/lp/cboard/insert.action",
			 			type : "post",
			 		    data: comm,
			 		    contentType: "application/json",
			 			success : function(data, status, xhr) {
			 				alert("저장했습니다.");
			 			},
			 			
			 			error:function(request,status,error){
			 		       alert("저장에 실패했습니다.");
			 	       }
	 			
	 		   }); 
	 		
	 		});


});


 
</script>



<div id="allcontainer" class="container-fluid " style="margin-top:80px" >
  
  	<div class="row" id="grid">
  	
  	 <div class="col-md-2" role="main" id="sidebar">
  		<ul class="nav nav-pills nav-stacked">
     		 <li role="presentation" class="active"><a href="#"><h4><p class="text-center">Talk</p></h4></a></li>
       </ul>
        
       
  	 </div><!-- sidebar end --> 
  	 
  	  <div class="col-md-6" role="complementary" id="list">
  	  <h3> Community </h3>
  	  <hr>
		
			
					<p></p>
				<div class="row">
					<div class="col-md-2" id="profile">
						<a href="#" class="thumbnail">
						  <img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
						</a>
					</div>
					<div class="col-md-10">
						<textarea  id="context" class="form-control" rows="4" style="height:103px" placeholder="이야기를 적어주세요."></textarea>
					</div>
				</div>
				<div class="row">
				
				<span style="float:right">
				 	<button type="submit" class="btn btn-danger" id="save">이야기 남기기</button>	
				</span>
				</div>
			
			
			
			
			<hr>
		 
		 <div class="row" id="replycontainer">
		 	
		 		<div class="row">
					<div class="col-md-2" id="profile">
						<a href="#" class="thumbnail">
						  <img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
						</a>
					</div>
				<div class="col-md-10" id="replytable">
							<div class="row">
								<div class="col-md-12">
									<ul class="nav nav-pills">
     									 <li><a href="#"> your name</a></li>
     									 	<span style="float:right">
            								<div class="btn-group">
												  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												  <span class="caret"></span>
												  </button>
												  <ul class="dropdown-menu">
												    <li><a href="#">Action</a></li>
												    <li><a href="#">Another action</a></li>
												    <li><a href="#">Something else here</a></li>
												    <li role="separator" class="divider"></li>
												    <li><a href="#">Separated link</a></li>
												  </ul>
											</div>
											</span>
       							    </ul>
       							 </div>
       							 <div class="col-md-12">
       							 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
       							 </div>
					
					  
					  <div class="input-group">
					   <div class="input-group-btn">
					   	  <button class="btn btn-info"><span class="glyphicon glyphicon-align-justify"></span></button>
					   </div>
					    <input type="text" class="form-control" id="inputCommReply" aria-describedby="inputCommReply">
					    <div class="input-group-btn">
						    <button class="btn btn-info">확인</button>
						 </div>
					</div>
					
					
							
							</div>
							</div>
					 </div>
				</div>
				
				<span style="float:right">
				
				</span>
		 
		 </div>
		
		 
  	
      </div><!-- list end --> 
  	 
 	 
		
  	 
  	 
	</div>
	
</div>

</body>
<!--  end of body -->
	

</html>


	
