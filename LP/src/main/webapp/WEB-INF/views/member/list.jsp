<%@page import="com.project.model.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<title>회원 목록</title>
</head>
<body>

	<div><c:import url="/WEB-INF/views/web/include/header.jsp" /></div>

	<div id="list">
		 <div id="content">
        	<br /><br />
        	<div style='text-align:center'>
        		[&nbsp;<!-- <a href="register.action"> --><a href="#">사용자 등록</a>&nbsp;]
        	</div>
        	<br /><br />        	
        	<table border="1" align="center" width="700px">
        		<tr style="height:30px;background-color:orange">
        			<td>이메일(아이디)</td>
        			<td>이메일</td>
        			<td>사용자구분</td>
        			<td>활성화여부</td>
        			<td>등록일자</td>
        		</tr>        	
        	<c:forEach var="member" items="${ members }">
        		<tr style="height:30px">
        			<td>
        				<!-- view.action?memberid=...... 경로를 만들고 변수에 저장 -->
        				<%-- <c:url value="view.action" var="viewUrl">
        					<c:param name="memberid" value="${ member.memberId }" />
        				</c:url>
        				<a href="${ viewUrl }">${ member.memberId }</a> --%>
        				<a href="#">${ member.memberId }</a> 
        			</td>
        			<td>${ member.email }</td>
        			<td>${ member.userType }</td>
        			<td>${ member.active }</td>
        			<td>${ member.regDate }</td>
        		</tr>
        	</c:forEach>
        	</table>
        	
        </div>	
	</div>
</body>
</html>



