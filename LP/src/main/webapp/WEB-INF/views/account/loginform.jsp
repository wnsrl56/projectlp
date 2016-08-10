<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<c:set var="cp" value="${pageContext.request.contextPath}"/>
     <!-- jQuery -->
    <script src="${cp}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${cp}/resources/js/bootstrap.min.js"></script>
    
    <!-- Bootstrap Core CSS -->
    <%-- <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Custom CSS -->
    <%-- <link href="${pageContext.request.contextPath}/resources/css/4-col-portfolio.css" rel="stylesheet"> --%>
	<link href="<c:url value='/resources/css/4-col-portfolio.css'/>" rel="stylesheet">

<title>로그인</title>
</head>
<body>

<form class="form-inline" action="<c:url value='/member/login.action'/>" method="post">
  <div><c:import url="/WEB-INF/views/web/include/header.jsp" /></div>
  
  <div class="form-group">
    <label class="sr-only" for="exampleInputEmail3">Email address</label>
    <input type="email" class="form-control" name="memberemail" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label class="sr-only" for="exampleInputPassword3">Password</label>
    <input type="password" class="form-control" name="memberpassword" placeholder="Password">
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> Remember me
    </label>
  </div>
  <button type="submit" class="btn btn-default">Sign in</button>
</form>

</body>
</html>