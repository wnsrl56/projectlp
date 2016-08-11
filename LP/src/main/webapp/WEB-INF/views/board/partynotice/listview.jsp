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
     		 <li role="presentation" class="active"><a href="insert.action"><p class="text-center">공지사항 등록</p></a></li>
         </ul>
        
        
       
  	 </div><!-- sidebar end --> 
  	 
  	  <div class="col-md-6" role="complementary" id="list">
  	
  		 <table style = "border:1px solid #ccc">
  		 <colgroup>
  		 <col width="10%"/>
  		 <col width="*" />
  		 <col width="15%"/>
  		 <col width="20%"/>
  		 </colgroup>
  		 <thead>
  		   <tr>
  		    <th scope="col">글번호</th>
  		     <th scope="col">제목</th>
  		      <th scope="col">조회수</th>
  		       <th scope="col">작성일</th>
  		       </tr>
  		       </thead>
  		 
  		 
   <c:choose> 
    <c:when test="${count != 0 }">
        <table width="700" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">게시판에 저장된 글이 없습니다.</td>
        </tr>
        </table>
    </c:when>
    
    <c:otherwise>
    	
    	
            <c:forEach var="board" items="${boards}"><%-- AAA.rows는 레코드 배열을 반환한다 --%>
              	 <div class="col-sm-6 col-md-4">
					   <p>${ partynotice.title }</p>
					   <hr>
					    <a href="#" class="thumbnail">
					      <img src=".." alt="...">
					    </a>
					    <hr>
					    <c:out value = "${partynotice.regDate}"/>
					  </div>
					  
					  <div id="detail"></div>
					
      				  <div class='modal fade' >
      				  <div class='modal-dialog'>
      				   <p>${ partynotice.title }</p>
					   <hr>
					    <a href="#" class="thumbnail">
					      <img src=".." alt="...">
					    </a>
					    <hr>
					    <c:out value = "${partynotice.regDate}"/>
      				  
      				  </div></div>	 
              </c:forEach>    
        
    </c:otherwise>
</c:choose>
  	  </table>
  	  
  	  
		   
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



