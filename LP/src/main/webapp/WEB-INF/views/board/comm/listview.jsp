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
	 			  			"writer" : $('#username').val()
	 			  			 };
	 			  			"writer" : $('#currName').val()
	 			  			 } ;
	 			 	
	 			 	comm = JSON.stringify(comm);
	 			
			 			$.ajax({
			 			
			 			url: "insert.action",
			 			type : "post",
			 		    data: comm,
			 		    contentType: "application/json",
			 			success : function(data, status, xhr) {
			 				
			 				addlist();
			 			},
			 			
			 			error:function(request,status,error){
			 		       alert("저장에 실패했습니다.");
			 	       }
	 			
	 		   }); 
	 		
	 		});
				
				
			
			//send reply to server
			//add to reply
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
				 		
				 			url: "/lp/cboard/insertReply.action",
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

//addlist
function addlist(data){
	
	 profileStr= '<div class="row"><div class="col-md-2" id="profile">'
				+'<a href="#" class="thumbnail">'
				 +'<img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">' 
				   +'</a></div>'
				   +'<div class="col-md-10" id="texttable">  <div class="row"><div class="col-md-12"> <ul class="nav nav-pills">'
		     +'<li><a href="#" id="username"> ${ loginuser.name }</a></li>'
			 	+'<span style="float:right"><div class="btn-group"><button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="caret"></span></button>'
				 + '<ul class="dropdown-menu">'
				    +'<li><a href="#">Action</a></li>'
				      +'<li><a href="#">Another action</a></li></ul></div></span></ul></div>'
	 					+'<div class="col-md-12" id="contextdata">'
	 					+ 'hihihihihihihihihih'+
	 					+'</div>';

$('#textcontainer').append(profileStr);


}

 
 


function getSingleReply(data,textid) {
	
	var textid = "";
	var  itemStr = "hihi" ;
	  	$(textid).append(itemStr);
	  	 
}

 
 
</script>

<input type="hidden" id="username" value="${ loginuser.name }" /> 
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
		 
		 <div class="row" id="textcontainer">
		 <%-- 	<table class="table">
		 		<tr style="height:30px;background-color:orange">
        			<td>이메일(아이디)</td>
        			<td>이름</td>
        			<td>성별</td>
        			<td>학년</td>
        			<td>등록일자</td>
        			<td>약관동의여부</td>
        			<td>가입사이트</td>
        			<td>사용자구분</td>
        			<td>활성화여부</td>        			
        		</tr>  
		 	<c:forEach var="member" items="${ members }">
        		<tr style="height:30px">
        			<td>
        				<!-- view.action?memberid=...... 경로를 만들고 변수에 저장 -->
        				<c:url value="view.action" var="viewUrl">
        					<c:param name="memberid" value="${ member.memberId }" />
        				</c:url>
        				<a href="${ viewUrl }">${ member.memberId }</a>
        				<a href="#">${ member.email }</a> 
        			</td>
        			<td>${ member.name }</td>
        			<td>${ member.sexual }</td>
        			<td>${ member.grade }</td>
        			<td>${ member.regDate }</td>
        			<td>${ member.submit } </td>
        			<td>${ member.extMember }</td>
        			<td>${ member.userType }</td>
        			<td>${ member.deleted }</td>        			
        		</tr>
        	</c:forEach>
		 	</table> --%>
		 	</div>
							
						 </div>
					</div>
					</div>
				
				
		 	
						
		
		</div>
		 
	
		 
  	
      </div><!-- list end --> 
  	 
 	 
		
  	 
  	 
	</div>
	
</div>

</body>
<!--  end of body -->
	

</html>


<!--  template -->

<!-- 
 <div class="row" >
					<div class="col-md-2" id="profile">
						<a href="#" class="thumbnail">
						  <img src="${cp}/resources/images/profile.jpg" alt="" class="img-circle" style="">
						</a>
					</div>
				<div class="col-md-10" id="texttable">
							<div class="row">
								<div class="col-md-12">
									<ul class="nav nav-pills">
     									 <li><a href="#" id="username"> ${ loginuser.name }</a></li>
     									 	<span style="float:right">
            								   <div class="btn-group">
												  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												   <span class="caret"></span>
												  </button>
												  <ul class="dropdown-menu">
												    <li><a href="#">Action</a></li>
												    <li><a href="#">Another action</a></li>
												  </ul>
											</div>
											</span>
       							    </ul>
       							 </div>
       							 <div class="col-md-12" id="contextdata">
       								<p></p>
       				  </div>
					
					  
					  <div class="input-group" id="replycontainer">
					   <div class="input-group-btn">
					   	  <button class="btn btn-info"><span class="glyphicon glyphicon-align-justify"></span></button>
					   </div>
					    <input type="text" class="form-control" id="inputCommReply" aria-describedby="inputCommReply">
					    <div class="input-group-btn">
						    <button class="btn btn-info" id="insertreply">확인</button>
						 </div>
					</div>
					
					
							
							</div>
							</div>
					 </div>
					 
					
					

 -->
	
