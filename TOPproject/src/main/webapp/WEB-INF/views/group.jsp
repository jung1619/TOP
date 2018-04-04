<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
	<title>GROUP PAGE</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
<link href="https://fonts.googleapis.com/earlyaccess/notosansjapanese.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css"/>
<!-- 슬라이더, 풀캘린더  -->
<link rel="stylesheet" type="text/css" href="./resources/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/fullcalendar.min.css" />
<link rel="stylesheet" href='./resources/css/fullcalendar.print.min.css' media='print' />
<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/moment.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/resources/js/jquery.sliderPro.min.js'/>"></script> --%>
<script type="text/javascript" src="<c:url value='/resources/js/ko.js'/>"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.css" rel="stylesheet" />
<link rel="stylesheet" href='./resources/css/jquery.qtip.css' media='print' />
<script type="text/javascript" src="<c:url value='/resources/js/jquery.qtip.js'/>"></script>

<link href="http://www.mikesmithdev.com/shared/css/bootstrapmodal.css" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="./resources/js/script.js"></script>

<script type="text/javascript">

var dataset = [
    <c:forEach var="listview" items="${listview}" varStatus="status">
        <c:if test="${listview.startdate != ''}">
            {"id":'<c:out value="${listview.schedule_num}" />'
            ,"title":'<c:out value="${listview.content}" />'
            ,"start":"<c:out value="${listview.startdate}" />"
            <c:if test="${listview.enddate != ''}">
                ,"end":"<c:out value="${listview.enddate}" />"
        	</c:if>
            } 
            <c:if test="${!status.last}">,</c:if>
        </c:if>
    </c:forEach>
    ];

 $(document).ready(function() {
	 
	//$("#header").load("/stagestageList.jps")
	//달력 
	$('#calendar').css('width', '50%');
	$('#calendar').css('float', 'left');
	$('#calendar').css('padding', '10px');
	$('#calendar').css('border', '1px solid lightgray');
	//$('.fc-day-number.fc-sat').css('background-color', '#0000FF');
	$('#calendar').fullCalendar({
		customButtons: { 
	        myCustomButton: { 
	            text: '일정입력', 
	            click: function(event) { 
	            	 $('#fullCalNew').modal(); 
	            	} 
	        	}
			}, 	
    	 	header: {
    	        left: 'prev,next myCustomButton',
    	        center: 'title',
    	        right: 'month,agendaWeek,agendaDay,listWeek'
    	    },
    	      //defaultDate: '2017-12-12',
    	      navLinks: true, // can click day/week names to navigate views
    	      editable: true,
    	      eventLimit: true, // allow "more" link when too many events
    	      events: dataset,
    	      eventRender: function (event, element) {
    	    	  element.qtip({    
    	              content: {    
    	                  title: { text: event.title },
    	                  text: '<span class="title">Start: </span>' + ($.fullCalendar.formatDate(event.start, 'hh:mmtt')) + '<br><span class="title">Description: </span>' + event.description       
    	              },
    	              show: { solo: true },
    	              //hide: { when: 'inactive', delay: 3000 }, 
    	              style: { 
    	                  width: 200,
    	                  padding: 5,
    	                  color: 'black',
    	                  textAlign: 'left',
    	                  border: {
    	                  width: 1,
    	                  radius: 3
    	               },
    	                  tip: 'topLeft',
    	                  classes: { 
    	                      tooltip: 'ui-widget', 
    	                      tip: 'ui-widget', 
    	                      title: 'ui-widget-header', 
    	                      content: 'ui-widget-content' 
    	                  } 
    	              } 
    	          });
    	      },
    	      eventClick:  function(event, jsEvent, view) {
    	    	    $('#startTime').val(moment(event.start).format('YYYY-MM-DD')+'T'+moment(event.start).format('HH:mm'));
    	    	    $('#endTime').val(moment(event.end).format('YYYY-MM-DD')+'T'+moment(event.end).format('HH:mm'));
    	            
    	    	    $("#eventInfo").html(event.description);
    	            $("#eventLink").attr('href', event.url);
    	            $("#eventContent").dialog({ modal: true, title: event.title, width:350});
    	            $('.modalTitle').html(event.title);
    	            //$('#modalId').html(event.id);
    	            $('#modalId').attr('value', event.id);
    	            $('.modalTitle').attr('value', event.title);
    	            $('#modalBody').html(event.description);
    	            $('#eventUrl').attr('href',event.url);
    	            $('#fullCalModal').modal();
    	        }
    	    });
    	  });
 

 
 </script>

<style type="text/css">

</style>
</head>
<body>

<div id="fullCalNew" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                <h4 class="modal-title">새로운 일정 등록</h4>
            </div>
            <div id="modalBody" class="modal-body">
            <form action="insertSchedule" method="post">
	            <table>
	           		 <tr>
						<td>
							<input type="hidden" name="id" value="${sessionScope.loginedId}">
							<input type="text" name="content" required="required">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" name="startdate" required="required">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" name="enddate" required="required">
						</td>
					</tr>
				</table>
            	<input type="submit" id="eventUrl" class="btn btn-primary" value="등록">
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<div id="fullCalModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                <h4 class="modal-title modalTitle"></h4>
            </div>
            <div id="modalBody" class="modal-body">
            <form action="updateUserSchedule" method="post">
	            <table>
	           		 <tr>
						<td>
							<input type="hidden" name="schedule_num" id="modalId">
							<input type="text" name="content" class="modalTitle" required="required">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" id="startTime" name="startdate">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" id="endTime" name="enddate">
						</td>
					</tr>
				</table>
            	<input type="submit" id="eventUrl" class="btn btn-primary" value="수정">
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button class="btn btn-primary"><a id="eventUrl" target="_blank">일정 삭제</a></button>
            </div>
        </div>
    </div>
</div>

<div class="top">
	<span class="topspan1">TOP </span><span class="topspan2"> SMART GROUPWARE</span>
	
	
	${sessionScope.loginedId}님 
	<span class="logout"><a href="logout">LOGOUT</a></span>
		
</div>

<div class="one">
	<div class="two">
		<span class="center">회의하기</span>
	</div>
	<div class="groupName">
		<span class="center"> TOP <br> Take of Project </span>
	</div>
	<div class="groupMember">
		<div class="memberTitle"> MEMBER LIST </div>
		<div class="member">
			
			<div class="pm"><img src="./resources/img/pm.png" style="width:20px;"/> 정광철</div>
		</div>
	</div>
</div>

<div class="three">
	<table class="threeTable">
		<tr>
			<th class="th0">공지</th>
			<td></td>
		</tr>
		<tr>
			<th class="th1">다음 회의는 4월 3일 코엑스</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">클라우드 일괄 체크 부탁드립니다</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">수학 발표자료 수집 완료</th>
			<td>03/20</td>
		</tr>
		<tr>
			<th class="th1">금요 중간발표 시 과제 제출해주세요.</th>
			<td>03/18</td>
		</tr>

		<tr>
			<td colspan="2"><div class="paging"> 1 2 3 4 5 </div></td>
		</tr>
	</table>
</div>
<div id='calendar' class="calendar"></div>

<div class="four">
	<table class="fourTable">
		<tr>
			<th class="th0">파일리스트</th>
			<td></td>
		</tr>
		<tr>
			<th class="th1">파일1</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">파일2</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">파일3</th>
			<td>03/20</td>
		</tr>
		<tr>
			<th class="th1">파일4</th>
			<td>03/18</td>
		</tr>
		<tr>
			<th class="th1">파일5</th>
			<td>03/18</td>
		</tr>
		<tr>
			<th class="th1">파일6</th>
			<td>03/18</td>
		</tr>
	</table>
</div>


<div class="searchId">
	<h3>친구검색</h3>
	<form action="idSearch" method="POST">
		<input type="text" name="searchId" id="searchId" class="searchId" placeholder="ID Here...">
		<input type="submit" value="Search"> <br />
		
		<c:choose>
			<c:when test="${result != null}">
				${searchId} <input type="button" value="+">
			</c:when>
			<c:when test="${result == null}">
				없는 ID입니다.			
			</c:when>
		
		</c:choose>
		
	</form>
</div>

</body>
</html>
