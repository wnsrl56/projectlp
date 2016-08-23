<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!--  start to head -->
<!-- 설정내용 넣어놓기 -->
<c:import url="../../../views/include/import.jsp"/>
<!--  end of head -->
<link href="${cp}/resources/css/questpreview.css" rel="stylesheet">
<!--  start to body -->
<body>
<!--  include header -->
<c:import url="../../../views/include/header.jsp"/>


<!--  include body -->
  	 <script>
     $(function() {
    	  $(".dropdown-menu li a").click(function(){
    		  var selText = $(this).text();
    		  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
    		});
     }) 
    </script>
  	 
	<script>
		window.onload = function() {
			//Check File API support			
			if (window.File && window.FileList && window.FileReader) {
				var filesInput = document.getElementById("files");
				filesInput
						.addEventListener(
								"change",
								function(event) {
									var files = event.target.files; //FileList object
									var output = document
											.getElementById("result");
									for (var i = 0; i < files.length; i++) {
										var file = files[i];
										//Only pics
										if (!file.type.match('image'))
											continue;
										var picReader = new FileReader();
										picReader
												.addEventListener(
														"load",
														function(event) {
															var picFile = event.target;
															var div = document
																	.createElement("div");
															div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
		"title='" + picFile.name + "'/>";
															output
																	.insertBefore(
																			div,
																			null);
														});
									
										//Read the image
										picReader.readAsDataURL(file);
									}
								});
			} else {
				console.log("Your browser does not support File API");
			}
			
			$().ready(function(){
				
				
				var id = $('#userid').val();
				
				$("#textid").text(id);
				$("#id").value(id);
				
			});
			
		}
	</script>

<div id="allcontainer" class="container-fluid " style="margin-top:80px" >
  
  	<div class="row" id="grid">
  	
  	 <div class="col-md-2" role="main" id="sidebar">
  		<ul class="nav nav-pills nav-stacked">
     		 <li role="presentation" class="active"><a href="insert.action"><p class="text-center">질문 하기</p></a></li>
            
        </ul>
        
       
  	 </div><!-- sidebar end --> 
  	 
  	  <div class="col-md-6" role="complementary" id="list">
  	  <h3> 질문하기 <small>review register</small></h3>
  	  <hr>
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
  	  

	<form:form action="insert.action" method="post" modelAttribute="quest" enctype="multipart/form-data">
					
					
			
			<%-- <input type="hidden" email="writer" value="${ loginuser.email }" id="id"/> --%>
	 		  <%-- <form:hidden path="memberNo" value="${ loginuser.memberNo }"/> --%>
			  <form:hidden path="writer" value="${ loginuser.email }"/>
			  <%-- <form:hidden path="MemberNo" value="${ loginuser.memberNo }"/> --%>
			   <input type="hidden" id="memberNo" name="memberNo" value="${ loginuser.memberNo }">
			  <%-- <div class="form-group">
              <label for="QuestTitle">제목</label>
              <!-- <input type="text" class="form-control" id="roomTitle" placeholder="방이름을 입력해 주세요"> -->
              <form:input path="title" cssStyle="width:280px; color:black" />
              
            </div> --%>
            <div class="form-group">
          	<label for="Writer">작성자</label>
               ${ loginuser.email } 
              <!-- <input type="text" class="form-control" id="roomType" placeholder="방종류을 입력해 주세요"> -->
            </div>
            
            <div class="form-group">
              <label for="QuestContent">내용</label>
              <!-- <input type="text" class="form-control" id="roomPrice" placeholder="방가격을 입력해 주세요"> -->
              <form:input path="context" cssStyle="width:280px; color:black" />
            </div>


					<div class="form-group">
						<label for="Tag">태그</label> 
						<select class="form-control" style="width: 300px" name="tagNo">
							 <c:forEach var="tag" items="${ tags }">
							<option value="${ tag.tagNo }">${ tag.tagName }</option>
							</c:forEach> 
						</select>
							

						<!-- <div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" type="button"
								data-toggle="dropdown">
								Dropdown Example <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">HTML</a></li>
								<li><a href="#">CSS</a></li>
								<li><a href="#">JavaScript</a></li>
							</ul>
						</div> -->
					</div>
					<!-- 
     		<div class="form-group">
     			<label for="exampleInputFile">파일 업로드</label>
            	<input type="file" name="attachone" id="file"  />
              	<input type="file" name="attach" />4
            </div>
            -->
            <div class="form-group" >
            	<label for="exampleInputFile">파일 업로드</label>
            	<input type="file" name="attach" multiple="multiple" id="files"  />
              	<!-- <input type="file" name="attach" /> -->
              	 <output id="result" />
            </div>

				<div class="form-group text-center">
              <button type="submit" class="btn btn-info">질문 등록<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">질문 취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          <%-- </form> --%>
          </form:form>
          </div>
  

		  
      </div><!-- list end --> 
  	 
 	 
		
  	 
  	 
	</div>
	
</div>



</body>
<!--  end of body -->

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
</script>
 -->

	

</html>


	
