<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
<div class="w3-top">
  <div class="w3-bar w3-card w3-animate-top w3-white" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="<c:url value='/'/>" class="w3-bar-item w3-button">TOP</a>
    <a href="<c:url value='/group'/>" class="w3-bar-item w3-button">그룹</a>
    <a href="<c:url value='/edit'/>" class="w3-bar-item w3-button">에디터</a>
	<%-- <a href="<c:url value='/user/login'/>" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> LOGIN </a> --%>


	<form class="top" action="login" method="POST">
	    <c:choose>
	    	<c:when test="${sessionScope.loginedId == null}">
			    <input type="text" placeholder=" ID" name="id" id="loginID">
			    <input type="password" placeholder=" PW" name="pw" id="loginPW">
			    <input type="submit" value="login">
			    <!-- 로그아웃 -->
	    	</c:when>
	    	<c:otherwise>
	    	 <a href="logout">logout</a>
	    		${sessionScope.loginedId}
	    	</c:otherwise>
	    </c:choose>
	</form>


    <div class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">
    </div>
  </div>
 <!-- Navbar on small screens -->
 	 <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
     <a href="<c:url value='/stage/list'/>" class="w3-bar-item w3-button" onclick="toggleFunction()">STAGE LIST</a>
     <a href="<c:url value='/trade/tradeList'/>" class="w3-bar-item w3-button" onclick="toggleFunction()">TRADING LIST</a>
  </div>
</div>
</body>
