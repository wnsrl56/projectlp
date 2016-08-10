<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/views/include/import.jsp" />
	<title>로그인</title>
</head>
<body>
	<%-- <div><c:import url="/WEB-INF/views/include/header.jsp" /></div> --%>
	<!-- <div id="test">check </div> -->
	<form class="form-inline" action="login.action" method="post">
		<div class="form-group">
    		<label class="sr-only" for="exampleInputEmail3">Email address</label>
    		<input type="email" class="form-control" name="email" placeholder="Enter email">
		</div>
	  	<div class="form-group">
	    	<label class="sr-only" for="exampleInputPassword3">Password</label>
	    	<input type="password" class="form-control" name="password" placeholder="Password">
	  	</div>
  		<div class="checkbox">
    		<label>
      			<input type="checkbox"> Remember me
		    </label>
  		</div>
  		<button type="submit" class="btn btn-default">Sign in</button>
  		<button type="button" class="btn btn-default">Cancel</button>
	</form>
</body>
</html>