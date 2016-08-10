<%@ page import="com.project.model.dto.Member"%>
<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">BaPul Test</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                
                <li>
                        <a href="<c:url value='/board/boardlist.action'/>">Board</a>
                </li>
                    
              <c:choose>
            	<%-- <c:when test="${ sessionScope.loginuser == null }"> --%>
            	<c:when test="${ empty sessionScope.loginuser }">
            		<!-- <a href="/demoweb-spring-compact5/account/login.action">로그인</a>
              		<a href="#">등록</a> -->
              		<li>
                        <a href="<c:url value='/account/login.action'/>">Login</a>
                    </li>
                    <li>
                        <a href="<c:url value='/member/register.action'/>">Register</a>
                    </li>
            	</c:when>
            	<c:otherwise>
            		<%-- ${ loginuser.memberId }님 환영합니다.
            		<a href="/demoweb-spring-compact5/account/logout.action">로그아웃</a> --%>
            		<li>
                        <a href="<c:url value='/account/logout.action'/>">Logout</a>
                    </li>
                    <li>
                        <a href="<c:url value='/member/modify.action'/>">Modify</a>
                    </li>
                     <li>
                   		<a> ${ loginuser.memberemail } Welcome!!</a>
                    </li>
                   
            	</c:otherwise>
            </c:choose>
                    
                    
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    
