<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>



	<script src="https://cdn.ckeditor.com/4.9.1/full-all/ckeditor.js"></script>
	
	
	<script type="text/javascript">
		function test1(){
			var testT = $("#editor1").val();
			alert(testT);
			return true;
		}
		
		/* 드디어 성공이다!!!!! */
		$(document).ready(function(){
		var editor = CKEDITOR.instances.editor1;
		
		editor.on('change',function(evt){
			sendContext();			
		})
		
		
		/* 추가 */
		function sendContext(){
			var context = CKEDITOR.instances.editor1.getData();
			console.log("끌어올림:"+context);
			
			stompClient.send("/chat/${p_num}/context",{}, JSON.stringify({
						context :context		
			}))	;
		}
		
			
		});
	</script>
	
	<style type="text/css">
	
		body {
			padding: 0px;
			display: flex;
			align-items: center;
			text-align: center;
		}
		
		.container {
			margin: 0 auto;
			padding: 0 auto;
		}
	
	</style>

	<div class="container">
		<form action="testUP" method="post" onsubmit="return test1()">
			<textarea name="text" id="editor1">
				
				test
				
			</textarea>
			<input type="submit" value="저장">
		</form>
	</div>
	
	<%@include file="editorSetting.jsp" %>
	
</html>

