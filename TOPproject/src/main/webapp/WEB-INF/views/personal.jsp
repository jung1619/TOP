<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>personal</title>
</head>
<body>
	
	<a href="groupForm">프로젝트 생성</a><p />
	
	<div class="groupList">
	<c:forEach var="group" items="${groupList}">
			<a href="group?groupNum=${group}">${group}그룹</a><br>
	</c:forEach>
	</div>

		
</body>
</html>