<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="resources/css/view_3.css">
		
		<title>conference</title>
		
<script type="text/javascript" src="<c:url value='resources/js/jquery-3.2.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='resources/js/sockjs.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sendBtn").click(function(){
			sendMessage();
		});
	});
	
	var sock;
	//웹소켓을 지정한 url로 연결한다.
	sock = new SockJS("<c:url value="/echo"/>");
	//자바스크립트 안에 function을 집어 놓을  수 있음
	//데이터가 나한테 전달되었을 때 자동으로 실행되는 function
	sock.onmessage = onMessage;
	//데이터를 끊고 싶을 때 실행하는 메소드
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	
	
	function onOpen(){
		
		$("#chatLogView").append("채팅에 입장하였습니다.<br>");
		
	}
	
	
	//버튼을 클릭할때마다 sock으로 보낸다.
	function sendMessage(){
		var message = $("#message").val();
		sock.send(message);//핸들러의 Textmessage로감
		$("#message").val("");
		console.log("send확인");
	}
	
	//evt파라미터는 웹소켓을 보내준다 데이터다. (자동으로 들어옴)
	function onMessage(evt){
		var data= evt.data;
		console.log("접속확인");
		$("#chatLogView").append(data+"<br>");
		
	}
	
	//채팅 종료
	function onClose(evt){
		$("#data").append("연결끊김");
	}
	
	
	</script>
	</head>
	<body>
	
	
	<div class="outer">
	
	
	<!-- EDITOR -->
	<div class="outer_editor">
	
		<!-- if DOC > 1 -->
		<!-- if DOC == 1 -->
		<div class="editor_menubar">
			<!-- if DOC == WORD -->
			
			<!-- if DOC == PPT -->
			<!-- if DOC == EXCEL -->
		</div>
	</div>
	
	
	<!-- CHAT -->
	<div class="outer_chat">
		<!-- if !(NOTICE.isempty) && STATUS == NOTICE on -->
		<div class="notice">
			<div class="notice_content">
				<!-- content -->
			</div>
			<div class="notice_btn">
				<button type="button">close</button>
				<button type="button">folding</button>
			</div>
		</div>
		
		
		<div class="chatLogView" id="chatLogView">
			채팅내용
		</div>
		
		<div class="outer_chatEditor">
			<div class="chatEditor_menubar">
				<!-- if sessionScope.ID == P_M_ID -->
				<button type="button" class="test">notice</button>
				<button type="button">forceout</button>
				
				<button type="button">memberList</button>
			</div>
			
			<div class="chatEditor_textView">
				<textarea rows="3" cols="5" id="message"></textarea>
				<input type="button" value="SEND" id="sendBtn">
			</div>
			
		</div>
		
	</div>
	
	
	</div>
	</body>
</html>