<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.project.model.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/include/import.jsp" />
<title>회원 목록</title>
</head>
<body>
	<div><c:import url="/WEB-INF/views/include/header.jsp" /></div>
	<div id="list">
		 <div id="content">
        	<br /><br />
        	<div style='text-align:center'>
        		<%-- [&nbsp;<!-- <a href="register.action"> --><a href="#">사용자 등록</a>&nbsp;] --%>
        	</div>
        	<br /><br />        	
        	<table class="table">
        		<tr style="height:30px;background-color:orange">
        			<td>이메일(아이디)</td>
        			<td>이름</td>
        			<td>성별</td>
        			<td>학년</td>
        			<td>등록일자</td>
        			<td>약관동의여부</td>
        			<td>가입사이트</td>
        			<td>사용자구분</td>
        			<td>활성화여부</td>        			
        		</tr>        	
        	<c:forEach var="member" items="${ members }">
        		<tr style="height:30px">
        			<td>
        				<!-- view.action?memberid=...... 경로를 만들고 변수에 저장 -->
        				<%-- <c:url value="view.action" var="viewUrl">
        					<c:param name="memberid" value="${ member.memberId }" />
        				</c:url>
        				<a href="${ viewUrl }">${ member.memberId }</a> --%>
        				<a href="#">${ member.email }</a> 
        			</td>
        			<td>${ member.name }</td>
        			<td>${ member.sexual }</td>
        			<td>${ member.grade }</td>
        			<td>${ member.regDate }</td>
        			<td>${ member.submit } </td>
        			<td>${ member.extMember }</td>
        			<td>${ member.userType }</td>
        			<td>${ member.deleted }</td>        			
        		</tr>
        	</c:forEach>
        	</table>        	
        </div>	
	</div>
</body>
</html>



