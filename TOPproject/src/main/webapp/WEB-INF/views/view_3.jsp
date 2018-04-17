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
				$('#chatLogView').append(data.nickName+ "님 ->"+data.message+"<br>");
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
	
		<!-- if DOC > 1 -->
		<!-- if DOC == 1 -->
		<div class="editor_menubar">
			<!-- if DOC == WORD -->
			<div class="gap"></div>
			<input type="image" src="./resources/icon/if_folder.png" role="button" onclick="javascript:alert('a')" data-tooltip="열기" aria-label="열기">
			<input type="image" src="./resources/icon/if_page.png" role="button" onclick="" data-tooltip="페이지" aria-label="페이지">
			<input type="image" src="./resources/icon/if_back.png" role="button" onclick="" data-tooltip="전단계로" aria-label="전단계로">
			<input type="image" src="./resources/icon/if_forward.png" role="button" onclick="" data-tooltip="앞단계로" aria-label="앞단계로">
			<input type="image" src="./resources/icon/if_save.png" role="button" onclick="" data-tooltip="저장하기" aria-label="저장하기">
			<input type="image" src="./resources/icon/if_history.png" role="button" onclick="" data-tooltip="파일저장히스토리" aria-label="파일저장히스토리">
			<input type="image" src="./resources/icon/if_download.png" role="button" onclick="" data-tooltip="클라우드" aria-label="클라우드">
			<input type="image" src="./resources/icon/if_print.png" role="button" onclick="" data-tooltip="인쇄" aria-label="인쇄">
			<input type="image" src="./resources/icon/if_array.png" role="button" onclick="" data-tooltip="정렬" aria-label="정렬">
			<input type="image" src="./resources/icon/if_find.png" role="button" onclick="" data-tooltip="검색" aria-label="검색">
			<input type="image" src="./resources/icon/if_copy.png" role="button" onclick="" data-tooltip="복사" aria-label="복사">
			<input type="image" src="./resources/icon/if_del.png" role="button" onclick="" data-tooltip="서식삭제" aria-label="서식삭제">
			<input type="image" src="./resources/icon/if_form.png" role="button" onclick="" data-tooltip="리스트" aria-label="리스트">
			<input type="image" src="./resources/icon/if_help.png" role="button" onclick="" data-tooltip="도움말" aria-label="도움말">
			<input type="image" src="./resources/icon/if_ite.png" role="button" onclick="" data-tooltip="기울이기" aria-label="기울이기">
			<input type="image" src="./resources/icon/if_line.png" role="button" onclick="" data-tooltip="셀 선" aria-label="셀 선">
			<input type="image" src="./resources/icon/if_merger.png" role="button" onclick="" data-tooltip="셀 병합/나누기" aria-label="셀 병합/나누기">
			<input type="image" src="./resources/icon/if_list.png" role="button" onclick="" data-tooltip="번호 리스트" aria-label="번호 리스트">
			<input type="image" src="./resources/icon/if_fontsize.png" role="button" onclick="" data-tooltip="글씨크기" aria-label="글씨크기">
			<input type="image" src="./resources/icon/if_bold.png" role="button" onclick="" data-tooltip="글씨 굵게" aria-label="글씨 굵게">
			<select>
				<option>6</option>
				<option>8</option>
				<option>10</option>
				<option>12</option>
			</select>
			<input type="image" src="./resources/icon/if_paint.png" role="button" onclick="" class="paint" data-tooltip="색채우기" aria-label="색채우기">
			<input type="image" src="./resources/icon/if_color.png" role="button" onclick="" class="paint" data-tooltip="글씨색" aria-label="글씨색">
			<input type="image" src="./resources/icon/if_strike.png" role="button" onclick="" data-tooltip="선긋기" aria-label="선긋기">
			<input type="image" src="./resources/icon/if_user.png" role="button" onclick="" data-tooltip="유저" aria-label="유저">
			<input type="image" src="./resources/icon/if_zoom.png" role="button" onclick="" data-tooltip="확대축소" aria-label="확대축소">
		
			<!-- if DOC == PPT -->
			<!-- if DOC == EXCEL -->
		</div>
		
		<!-- 에디터(임시) -->
		<textarea id="editR" rows="50" cols="170">
	
		</textarea>
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
				<textarea rows="3" cols="5" id="message"></textarea>
				<input type="button" value="SEND" id="send">
			</div>
			
		</div>
		
	</div>
	
	
	</div>
	</body>
</html>