<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.project.model.dto.PartyNotice"%>
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
     		 <li role="presentation" class="active"><a href=""><p class="text-center" style= "text-align: center">이벤트</p></a></li>
            
        </ul>
        
       
  	 </div><!-- sidebar end --> 
  	 
  	  <div class="col-md-6" role="complementary" id="list">
  	  <h3> 이벤트 </h3>
  	  <hr>
  	   
  	   <img src="${ cp }/resources/images/1.jpg">
  	 

  		<%-- 
		<form:form modelAttribute="board"  action="insert.action" method="post" enctype="multipart/form-data">
		
	    <div class="form-group">
		      
				
				  <input name="attach" id="questionImageFile" type="file" accept="image/*" style="display: none" onchange="angular.element(this).scope().getFile(this);"/>
			
							<a style="display: block" onclick="document.getElementById('questionImageFile').click();">
								<div id="holder"><img src="${ cp }/resources/img/empty.PNG"/></div>
							</a>
							
							
			
							
							
		  </div> 
		  
		  <form:textarea path="context" id="context" class="form-control" rows="5" placeholder="질문을 해주세요."/>
		  
		  <hr>
		   <form:hidden path="writer" value= "${ loginuser.memberId }"/>	
		   <button class="btn btn-warning">취소</button>
		  <button type="submit" class="btn btn-info ">등록</button>
		</form:form>
  	  --%>
		  
      </div><!-- list end --> 
  	 
 	 
		
  	 
  	 
	</div>
	
</div>

</body>
<!--  end of body -->

<!-- <script type = "text/javascript">
$(document).ready(function(){
    $("#list").on("click", function(e){
        e.preventDefault();
        fn_openBoardList();
    });     
});
 
function fn_openBoardList(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/board/partynotice/listview' />");
    comSubmit.submit();
}
</script> -->

<!-- <script>

var upload = document.getElementsByTagName('input')[0],
    holder = document.getElementById('holder'),
    state = document.getElementById('questionImageFile');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  state.innerHTML = 'File API & FileReader available';
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
</script> -->


	

</html>


	
