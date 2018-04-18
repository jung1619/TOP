<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="resources/css/view_3.css">
		
		<title>conference</title>
			
	<script type="text/javascript" src="<c:url value='resources/js/jquery-3.2.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='resources/js/sockjs.js'/>"></script>
	<script type="text/javascript" src="<c:url value='resources/js/stomp.js'/>"></script>
	
	
	<script type="text/javascript">
	var myId = '<%=(String)session.getAttribute("loginedId")%>';
	$(function (){
		
		connect();
		$("#send").on("click",function(){
			sendMessage();
		})		
		document.onkeydown = function (event){
			if(event.keyCode==116
				||event.ctrlKey==true && (event.keyCode == 82)){
				
				disconnect();
				event.cancleBubble=true;
				event.returnValue=false;
				setTimeout(function(){
					window.location.reload();
				},100);
				return false;
				
			}
		}
	});
	
	var stompClient= null;
	
	function connect(){
		var socket = new SockJS('/TOPproject/endpoint');
		stompClient = Stomp.over(socket);
		stompClient.connect({},function(frame){
			
			stompClient.subscribe('/subscribe/chat/${p_num}',function(message){
				var data = JSON.parse(message.body);
				if( data.id == myId ){
					$('#chatLogView').append('<div class="mine">'+data.message+"</div><br>");
				}else
					$('#chatLogView').append('<div class="other">'+data.nickName+ "님 ->"+data.message+"</div><br>");
			});
			
		});
	}
	
	
	function sendMessage(){
		var str = $('#message').val();
			stt = str.replace(/ /gi, '&nbsp;')
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
			
			if(str.length>0){
				stompClient.send("/chat/${p_num}",{}, JSON.stringify({
							message :str	
				}));
				
			};
			$("#message").val("");
		
	}
	
	</script>
	<style type="text/css">
		
		.outer{
			margin: 0 auto;
			padding: 0 auto;
		}
		.outer_editor{
			width: 80%;
		}
		.outer_chat{
			width: 20%;
		}
		.outer_editor, .outer_chat{
			margin: 0 auto;
			padding: 0 auto;
			height: auto;
		}
		
		.mine{
			text-align: right;
			background-color: yellow;
			float: right;
		}
		.other{
			text-align: left;
			background-color: blue;
			float: left;
		}
		.mine, .other{
			display: inline-block;
			-webkit-border-radius: 7px;
			padding: 4px;
			margin: 5px;
			clear: both;
		}
		
		.chatEditor_textView{
			text-align: center;
		}
		.message{
			resize: none;
		}
		.send{
			width: 300px;
			height: auto;
		}
		
		
		#iconList{
			border-top: 1px solid #EAEAEA;
			border-bottom: 1px solid #EAEAEA;
			height: 40px;
		}
		
		.gap{
			width: 30px;
			height: 40px;
			float: left;
		}
		
		.editor_menubar input[type="image"]{
			margin: 6px 6px 1px 6px;
			width: 17px;
		}
		
		.paint{
			background-color: black;
		}
		
		#editR{
			margin: 10px;
		}
	
	</style>
</head>
<body>
	
	
	<div class="outer">
	
	
	<!-- EDITOR -->
	<div class="outer_editor">
		<%@include file="edit.jsp" %>
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
		</div>
		
		<div class="outer_chatEditor">
			<div class="chatEditor_menubar">
				<!-- if sessionScope.ID == P_M_ID -->
				<button type="button" class="test">notice</button>
				<button type="button">forceout</button>
				
				<button type="button">memberList</button>
			</div>
			
			<div class="chatEditor_textView">
				<textarea rows="5" cols="44" id="message" class="message"></textarea><br>
				<input type="button" value="SEND" id="send" class="send">
			</div>
			
		</div>
		
	</div>
	
	</div>
</body>
</html>