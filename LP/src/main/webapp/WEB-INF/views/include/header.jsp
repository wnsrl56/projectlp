<%@ page import="com.project.model.dto.Member"%>
<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<link rel="stylesheet" href="${cp}/resources/css/landing-page.css">
  <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button> -->
                <a class="navbar-brand topnav" href="${cp}/home.action"><img src="${cp}/resources/image/RA.png" alt="..." style="width: 80px; height: 30px"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">                
                <li>
                       <a href="${ cp }/qboard/listview.action?tagNo=0">Quest</a>
                       
                </li>       
                <li>
                <a href="${ cp }/pboard/listview.action">PartyNotice</a>
                </li>             
               
                <li>
                       <a href="${ cp }/cboard/listview.action" id="linkComm">Comm</a>
                </li>      
                <li> <a href="${ cp }/eboard/listview.action">Event</a>
                </li>             
              <c:choose>
            	<%-- <c:when test="${ sessionScope.loginuser == null }"> --%>
            	<c:when test="${ empty sessionScope.loginuser }">
            		<!-- <a href="/demoweb-spring-compact5/account/login.action">로그인</a>
              		<a href="#">등록</a> -->
              		<li>
                        <a type="button" href="${cp}/account/login.action">Sign In</a>
                    </li>
                   
            	</c:when>
            	<c:otherwise>
            		<%-- ${ loginuser.memberId }님 환영합니다.
            		<a href="/demoweb-spring-compact5/account/logout.action">로그아웃</a> --%>
            		<li>
                        <a href="${cp}/account/logout.action">Sign Out</a>
                    </li>
                  <%--   <c:if test="${sessionScope.loginuser.userType == 'admin' }">
                    <li>
                        <a href="${cp}/member/list.action">List of members</a>
                    </li>
                    </c:if> --%>
                    
                    <%-- <li>
                        <a href="${cp}/member/modify.action">Modify</a>
                    </li> --%>
                     <li>
                   		<a href="${cp}/member/detail.action"> Welcome ${ loginuser.email }</a>
                   		<!-- <span class="glyphicon glyphicon-bell" aria-hidden="true"></span> -->
                    </li>
                   
            	</c:otherwise>
            </c:choose>
                    
                    
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    
		  