<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.project.model.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/include/import.jsp" />
<title>마이페이지</title>
</head>
<body>
	<div><c:import url="/WEB-INF/views/include/header.jsp" /></div>
	<div id="content">
		<c:set var="member" value="${ session.loginuser }"/>
		<table class="table">
			<tr style="height: 30px;">
				<th>회원정보</th>
			</tr>
			<tr style="height: 30px;">
				<th>이름</td>
			</tr>
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
				<tr style="height: 30px">
					<td>
						<!-- view.action?memberid=...... 경로를 만들고 변수에 저장 --> <%-- <c:url value="view.action" var="viewUrl">
        					<c:param name="memberid" value="${ member.memberId }" />
        				</c:url>
        				<a href="${ viewUrl }">${ member.memberId }</a> --%> <a
						href="#">${ member.email }</a>
					</td>
					<td>${ member.name }</td>
					<td>${ member.sexual }</td>
					<td>${ member.grade }</td>
					<td>${ member.regDate }</td>
					<td>${ member.submit }</td>
					<td>${ member.extMember }</td>
					<td>${ member.userType }</td>
					<td>${ member.deleted }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>



