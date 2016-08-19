<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />




<!--  start to head -->
<!-- 설정내용 넣어놓기 -->
	<c:import url="../../../views/include/import.jsp" />
<!--  end of head -->
	<link href="${cp}/resources/css/questpreview.css" rel="stylesheet">
	<link rel="stylesheet" href="${cp}/resources/css/viewbox.css">
<!--  start to body -->
<body>
	<!--  include header -->
	<c:import url="../../../views/include/header.jsp" />

	<!--  include body -->


	
	<!-- <script>
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
	</script> -->

	<div id="allcontainer" class="container-fluid "
		style="margin-top: 80px">

		<div class="row" id="grid">

			<div class="col-md-2" role="main" id="sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a href="insert.action"><p
								class="text-center">답변 하기</p></a></li>
				</ul>


			</div>
			<!-- sidebar end -->

			<div class="col-md-6" role="complementary" id="list">
				<h3>
					<p align="center"> ${ quest.title }  <small></small></p>
				</h3>
				<hr>
				<p align="center" >${ quest.context }</p>
				<hr>
				<div align="center" >
					<c:forEach var="qpicture" items="${ quest.qpicture }">
						<a class="thumbnail-2" href="${cp}/resources/image/${ qpicture.savedFilePath }">
						<img class="jbox-img img-rounded" style="width: 400px" src="${cp}/resources/image/${ qpicture.savedFilePath }">
							</a>
						<br><hr>
					</c:forEach>
				</div>

				
				<!-- 답변하기 글쓰기 -->
<%-- 				<c:choose>
					<c:when test="${ empty answer }">
						<table width="100%" border="1" cellpadding="0" cellspacing="0">
							<tr>
								<td align="center">답변한 글이 없습니다.</td>
							</tr>
						</table>
					</c:when>

					<c:otherwise>
						<c:forEach var="answer" items="${ answers }">
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<hr>
				<!-- 답변하기 입력 -->
				<form action="ainsert.action" method="post" modelAttribute="answer" enctype="multipart/form-data">
				<input type="hidden" id="memberNo" name="memberNo" value="${ loginuser.email }">
				<input type="hidden" id="questNo" name="questNo" value="${ quest.questNo }">
				<div class="form-group">
					<label for="Answer">답변하기</label>
					<br>
					<table style="width: 100%">
						<tr>
							<td><input name="context" style="width: 90%; height: 200px" /></td>

						</tr>
						<tr>
							<td><output id="result" /></td>
						</tr>
					</table>

					<!-- <input type="text" class="form-control" id="roomPrice" placeholder="방가격을 입력해 주세요"> -->
					
				</div>

	<!-- 			<div class="form-group">
					<label for="exampleInputFile">파일 업로드</label> <input type="file"
						name="attach" multiple="multiple" id="files" />
					<input type="file" name="attach" />	
				</div> -->

				<div class="form-group" align="right">
					<table style="width: 100%;" >
						<tr>
							<td><input type="file" name="attach" multiple="multiple"
								id="files" src="" /></td>
							<td>
								<button type="submit" class="btn btn-info">
									답변 하기<i class="fa fa-check spaceLeft"></i>
								</button>
							</td>
						</tr>
					</table>
				</div>
				</form> --%>
				<div class="row" id="textcontainer">

					<c:choose>

						<c:when test="${ empty answers }">
							<table class="table">
								<tr>
									<td align="center">작성된 답변이 없습니다.</td>
								</tr>
							</table>
						</c:when>



						<c:otherwise>
							<c:forEach var="answer" items="${ answers }">
								<div class="row">
									<!--  profile picture -->
									<div class="col-md-2" id="profile"
										style="width: 80px; height: 80px ">
										<a href="#"> <img
											src="${cp}/resources/images/profile.jpg" alt=""
											class="img-circle" style="width: 50px; height: 50px">
										</a>
									</div>

									<div class="col-md-10" id="texttable">
										<div class="row">
											<!--  top manu bar -->
											<div class="col-md-12">
												<ul class="nav nav-pills">
													<li><a href="#" id="username"> ${ answer.writer }</a></li>
													<!--  dropdown button -->
													<span style="float: right"> <span
														class="label label-primary">${ answer.dateChanged }</span>
														<div class="btn-group pullRight">
															<button type="button"
																class="btn btn-info dropdown-toggle"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false">
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
														<p>${ answer.context }</p>
													</div>

												</div>

											</div>


											<!-- reply -->

											<div class="row">
												<div class="col-md-12" id="replytable">
													<div class="col-md-10" name="replytable">
														<div class="row">
															<!--  top manu bar -->

															<c:forEach var="replies" items="${ replies }">
																<div class="col-md-12">
																	<!--  profile picture -->

																	<!--  context -->
																	<div class="panel panel-info">
																		<div class="panel-body">
																			<div class="col-md-2" id="profile"
																				style="width: 80px; height: 80px">
																				<a href="#"> <img
																					src="${cp}/resources/images/profile.jpg" alt=""
																					class="img-circle" style="width: 30px; height: 30px"> <span> ${ replies.writer }</span>
																				</a>
																			</div>

																			<span class="panel-info">${ replies.context }</span>
																		</div>
																	</div>

																</div>
															</c:forEach>

															<p>&nbsp;&nbsp;</p>
															<div class="col-md-12">
																<div class="input-group" name="replyinput">
																	<div class="input-group-btn">
																		<button class="btn btn-info">
																			<span class="glyphicon glyphicon-align-justify"></span>
																		</button>
																	</div>

																	<input type="text" class="form-control"
																		id="inputAnswerReply${ answer.answerNo }"
																		aria-describedby="inputAnswerReply" value="" />
																	<div class="input-group-btn">
																		<button type="submit" class="btn btn-info"
																			id="reply${ answer.answerNo }">확인</button>
																	</div>
																</div>
															</div>
															<!--  end of replyinput -->

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

				<div class="row" id="inputcontainer">
					<input type="hidden" id="currName"
						value="${ sessionScope.loginuser.name }" />
					<input type="hidden" id="questNo"
						value="${ quest.questNo }" />
					<div class="row">
						<div class="col-md-2" id="profile"
							style="width: 80px; height: 80px">
							<a href="#"> <img
								src="${cp}/resources/images/profile.jpg" alt=""
								class="img-circle" style="width: 50px; height: 50px">
							</a>
						</div>
						<div class="col-md-10">
							<textarea id="context" class="form-control" rows="4"
								style="height: 103px" placeholder="답변을 적어주세요."></textarea>
						</div>
					</div>
					<p>&nbsp;&nbsp;</p>
					<div class="col-md-11">
						<nav class="pull-right">
							<button type="submit" class="btn btn-danger" id="save">답변
								하기</button>
						</nav>

					</div>
				</div>



			</div>

		</div>
		<!-- list end -->

	</div>
	<!-- All end -->
	<script type="text/javascript">
		//forAjax
		$(function() {

			//send context to server 	
			$('#save').on('click', function(event) {

				var answer;

				answer = {
					"context" : $('#context').val(),
					"title" : "test",
					"writer" : $('#currName').val(),
					"questNo" : $('#questNo').val()
				};

				answer = JSON.stringify(answer);

				$.ajax({

					url : "/lp/qboard/cinsert.action",
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

			});

			//send reply to server
			$('.btn:submit').on('click', function(event) {
				var reply;
				var answerNo;

				var check = $(this).attr('id');

				if (check.indexOf('reply') >= 0) {

					answerNo = check.substring(5, check.length);

					reply = {
						"context" : $('#inputAnswerReply' + answerNo).val(),
						"answerNo" : answerNo,
						"writer" : $('#currName').val()
					};

					reply = JSON.stringify(reply);

					$.ajax({

						url : "/lp/qboard/crinsertReply.action",
						type : "post",
						data : reply,
						contentType : "application/json",
						success : function(data, status, xhr) {
							//alert("리플을 저장 했습니다.");
							location.reload();

						},

						error : function(request, status, error) {
							alert("리플을 저장에 실패했습니다.");
						}

					});

				}

			});

		});
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

				$().ready(function() {

					var id = $('#userid').val();

					$("#textid").text(id);
					$("#id").value(id);

				});

			}
		</script>

	<script src="${cp}/resources/js/jquery.viewbox.min.js"></script>
	<script>
		$(function(){
			
			$('.thumbnail').viewbox();
			$('.thumbnail-2').viewbox();
			
			(function(){
				var vb = $('.popup-link').viewbox();
				$('.popup-open-button').click(function(){
					vb.trigger('viewbox.open');
				});
				$('.close-button').click(function(){
					vb.trigger('viewbox.close');
				});
			})();
			
			(function(){
				var vb = $('.popup-steps').viewbox({navButtons:false});
				
				$('.steps-button').click(function(){
					vb.trigger('viewbox.open',[0]);
				});
				
				$('.next-button').click(function(){
					vb.trigger('viewbox.open',[1]);
				});
				$('.prev-button').click(function(){
					vb.trigger('viewbox.open',[0]);
				});
				$('.ok-button').click(function(){
					vb.trigger('viewbox.close');
				});
			})();
			
		});
	</script>	


</body>


</html>



