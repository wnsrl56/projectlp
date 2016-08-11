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

<div id="allcontainer" class="container-fluid " style="margin-top:80px" >
  
  	<div class="row" id="grid">
  	
  	 <div class="col-md-2" role="main" id="sidebar">
  		<ul class="nav nav-pills nav-stacked">
     		 <li role="presentation" class="active"><a href="insert.action"><p class="text-center" style= "text-align: center">공지사항</p></a></li>
            
        </ul>
        
       
  	 </div><!-- sidebar end --> 
  	 
  	  <div class="col-md-6" role="complementary" id="list">
  	  <h3> 공지사항 </h3>
  	  <hr>
  	  <form id ="frm">
  	  <table class ="board_view">
  	  <colgroup>
  	  <col width="15%" />
  	  <col width="*" />
  	  </colgroup>
  	  <caption>공지사항</caption>
  	  <tbody>
  	  <tr>
  	    <th scope="row"> 제목 </th>
  	    <td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
  	    </tr>
  	     <td colspan="2" class="view_text">
  	     <textarea rows="20" cols="100" title="내용" id="CONTEXT" name="CONTEXT"></textarea>
  	     </td>
  	     </tr>
  	     
  	     
  	  </tbody>
  	  </table>
  	  <a href="/LP/pboard/listview.action" class="btn" id="write">등록</a>
  	  <a href="/LP/pboard/listview.action" class="btn" id="list"> 목록으로</a>
  	  </form>
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

<script>
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
</script>


	

</html>


	
