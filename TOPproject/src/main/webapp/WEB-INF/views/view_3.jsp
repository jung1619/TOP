<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="resources/css/view_3.css">
		
		<title>Home</title>
	</head>
	<body>
	
	
	<div class="outer">
	
	
	<!-- EDITOR -->
	<div class="outer_editor">
	madamada
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
		
		
		<div class="chatLogView">
		</div>
		
		<div class="outer_chatEditor">
			<div class="chatEditor_menubar">
				<!-- if sessionScope.ID == P_M_ID -->
				<button type="button" class="test">notice</button>
				<button type="button">forceout</button>
				
				<button type="button">memberList</button>
			</div>
			
			<div class="chatEditor_textView">
				<textarea rows="3" cols="5"></textarea>
			</div>
		</div>
		
	</div>
	
	
	</div>
	</body>
</html>