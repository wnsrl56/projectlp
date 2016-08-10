<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link href="<c:url value='/resources/css/uploadpreview.css'/>" rel="stylesheet">

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


     <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    

    <!-- Bootstrap Core CSS -->
    <%-- <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Custom CSS -->
    <%-- <link href="${pageContext.request.contextPath}/resources/css/4-col-portfolio.css" rel="stylesheet"> --%>
	<link href="<c:url value='/resources/css/4-col-portfolio.css'/>" rel="stylesheet">
	
	

<title>Insert title here</title>
</head>
<body>

	<div><c:import url="/WEB-INF/views/include/header.jsp" /></div>

	
	<article class="container">
        <div class="page-header">
          <h1>질문 등록<small>review register</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
        <div class="table-responsive">
	<form:form action="boardregister.action" method="post" modelAttribute="board"
					enctype="multipart/form-data">
			
			<%-- <input type="hidden" email="writer" value="${ loginuser.email }" id="id"/> --%>
			 <form:hidden path="memberNo" value="${ loginuser.memberNo }"/>
			 <form:hidden path="boardWriter" value="${ loginuser.memberemail }"/>
			
			  <div class="form-group">
              <label for="boardTitle">제목</label>
              <!-- <input type="text" class="form-control" id="roomTitle" placeholder="방이름을 입력해 주세요"> -->
              <form:input path="boardTitle" cssStyle="width:280px; color:black" />
              
            </div>
            <div class="form-group">
          
              ${ loginuser.memberemail }
              <!-- <input type="text" class="form-control" id="roomType" placeholder="방종류을 입력해 주세요"> -->
            </div>
            
            <div class="form-group">
              <label for="boardContent">내용</label>
              <!-- <input type="text" class="form-control" id="roomPrice" placeholder="방가격을 입력해 주세요"> -->
              <form:input path="boardContent" cssStyle="width:280px; color:black" />
            </div>
     		<div class="form-group">
     			<label for="exampleInputFile">파일 업로드</label>
            	<input type="file" name="attachone" id="file"  />
              	<!-- <input type="file" name="attach" /> -->4
            </div>
           
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
        </div>
      </article>
	

</body>
</html>