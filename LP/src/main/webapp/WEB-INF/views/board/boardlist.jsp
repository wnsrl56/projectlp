<%@page import="com.project.model.dto.Board"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

     <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    
<!--      <script>
     $(function() {
	    $('#activeModal').click(function(event){
	    	alert('test');
	        $('#myModal .modal-body').load('/board/boardview.action', { boardNo : $(this).attr('data-boardno') });
	        
	    });
     })
     -->
    </script>

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
	
	<% Board board = (Board)request.getAttribute("board"); %>
	
	 <article class="container">
 <!--   ///////////////////////////////////////////////////////////////////////    -->
 
 	    <div class="page-header">
          <h1> 질문 하기 <small>Question</small></h1>
        </div>
        
        	<!-- <div class="col-md-6 col-md-offset-3"> -->
         <div class="accordion_content">
      
      
      <div align="center">	
		<a href="<c:url value='/board/boardregister.action'/>" type="button" class="btn btn-default btn-lg" style="background-color: #8BC34A;">
			<span class="glyphicon glyphicon-question-sign" aria-hidden="true"> 질문하기</span></a>
		<br/><br/>
      </div>
 
      
       <%--  <a href="<c:url value='/board/boardregister.action'/>"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"/> 질문 등록</a> --%>
      
      
		<!--    	<table border="1" align="center" width="900px"> -->
        	<!-- 	<tr style="height:30px;background-color:orange">
   					<td>사진</td>
        			<td>제목</td>
        			<td>작성자</td>
        		</tr>     -->    	  		
        	<c:forEach var="board" items="${ boards }">
        		<%-- <tr style="height:30px">
					<td style="width: 150px">   
						<img style="width: 150px; height: 150px" src="<c:url value='/resources/image/${ board.savedFileName }'/>">
                     </td >
 					<td style="width: 100px">
        				<!-- view.action?memberid=...... 경로를 만들고 변수에 저장 -->
        				<c:url value="boardview.action" var="viewUrl">
        					<c:param name="roomNo" value="${ board.boardNo }" />
        				</c:url>
        				<a href="${ viewUrl }">${ board.boardTitle }</a>
        			</td>
        			<td style="width: 70px">   
						${ board.boardWriter }
                     </td>
        		</tr> --%>
        	
				<div class="col">
				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">
				      <img src="<c:url value='/resources/image/${ board.savedFileName }'/>" alt="...">
				      <div class="caption">
				        <h3>${ board.boardTitle }</h3>
				        <p>${ board.boardWriter }</p>
				        <p>
				        <%-- <a href="<c:url value='/board/boardview.action'/>" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">답변하기</a> --%>
				        <%-- <a href="<c:url value='/board/boardview.action'/>" id="activeModal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">답변하기</a> --%> 
				       	<div>
				       	<c:url value="boardview.action" var="viewUrl">
        					<c:param name="boardNo" value="${ board.boardNo }" />
        				</c:url>		       
				        <a id="activeModal"
				        	href="${ viewUrl }" class="btn btn-primary btn-lg"
				        	data-toggle="modal" data-target="#myModal" >답변하기</a>
				        </div>
				        <a href="#" class="btn btn-default" role="button" >Button</a></p>
				      </div>
				    </div>
				  </div>
				</div>
				        	       
        	</c:forEach>
        			
        	<!-- </table>  -->
			<br><br>
			</div>
 
      </article>
      

      <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
     <!--    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4> -->
      </div>
      <div class="modal-body">
       
      </div>
      <div class="modal-footer">
      <!--   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
      </div> 
    </div>
  </div>
</div>
      
      
      
      <!-- Modal -->
<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> -->
	
	<!-- Page Content -->
 <!--    <div class="container">

        Page Heading
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Page Heading
                    <small>Secondary Text</small>
                </h1>
            </div>
        </div>
        /.row

        Projects Row
        <div class="row">
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
        </div>
        /.row

        Projects Row
        <div class="row">
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
        </div>
        /.row

        Projects Row
        <div class="row">
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
        </div>
        /.row

        <hr>

        Pagination
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        /.row

        <hr>

        Footer
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            /.row
        </footer>

    </div> -->
    <!-- /.container -->
	

</body>
</html>