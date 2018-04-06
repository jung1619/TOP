<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	<link href="https://fonts.googleapis.com/earlyaccess/notosansjapanese.css" rel="stylesheet" />

	<style type="text/css">
		body { margin: 0px; }
		.top { width: 100%; height: 40px; background-color: #999999; }
		.join { margin: 10px 0px 0px 800px; }
		.topspan1 { margin: 10px 0px 0px 30px; font-size: 25px; font-weight: bold; }
		.topspan2 { margin: 10px 0px 0px 5px; font-size: 15px; }
	</style>

	<script type="text/javascript" src="<c:url value='resources/js/home.js'/>"></script>

</head>
<body>
	<form action="login" method="POST">
	<div class="top">
		<span class="topspan1">TOP </span>
		<span class="topspan2"> SMARTGROUPWARE</span>
	    <span class="join"> 
	    <c:choose>
	    	<c:when test="${sessionScope.loginedId == null}">
			    <input type="text" placeholder="ID" name="id" id="loginID">
			    <input type="password" placeholder="PW" name="pw" id="loginPW">
			    <input type="submit" value="login">
			   
			    <a href="join">JOIN</a> 
			    <!-- 로그아웃 -->
	    	</c:when>
	    	<c:otherwise>
	    	 <a href="logout">logout</a>
	    		${sessionScope.loginedId}
	    	</c:otherwise>
	    </c:choose>
		</span>
	</div>
	</form>

</body>
</html>