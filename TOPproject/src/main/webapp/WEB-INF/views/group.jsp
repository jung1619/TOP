<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="false" %>
<html>
<head>
	<title>GROUP PAGE</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
<link href="https://fonts.googleapis.com/earlyaccess/notosansjapanese.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css"/>
<!-- �����̴�, ǮĶ����  -->
<link rel="stylesheet" type="text/css" href="./resources/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/fullcalendar.min.css" />
<link rel="stylesheet" href='./resources/css/fullcalendar.print.min.css' media='print' />
<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/moment.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.sliderPro.min.js'/>"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="./resources/js/script.js"></script>

<script type="text/javascript">
 $(document).ready(function() {
     //$("#header").load("/stagestageList.jps")
	//�޷� 
	$('#calendar').css('width', '50%');
	$('#calendar').css('float', 'left');
	$('#calendar').css('padding', '10px');
	$('#calendar').css('border', '1px solid lightgray');
	//$('.fc-day-number.fc-sat').css('background-color', '#0000FF');
	$('#calendar').fullCalendar({
    	 	header: {
    	        left: 'prev,next today',
    	        center: 'title',
    	        right: 'month,agendaWeek,agendaDay,listWeek'
    	    },
    	      //defaultDate: '2017-12-12',
    	      navLinks: true, // can click day/week names to navigate views
    	      editable: true,
    	      eventLimit: true, // allow "more" link when too many events
    	      events: [
    	        {
    	          title: '1',
    	          start: '2018-03-16T12:00:00',
    	          end: '2018-03-19T18:00:00',
    	          url: '/',
    	          color: 'hsl(0, 20%, 30%)'
    	        }, {
    	          title: '2',
    	          start: '2018-03-18T12:00:00',
    	          end: '2018-03-21T18:00:00',
    	          url: '/',
    	          color: 'hsl(0, 100%, 75%)'
    	        },  {
    	          title: '3',
    	          start: '2018-03-23T12:00:00',
    	          end: '2018-03-26T18:00:00',
    	          url: '/',
    	          color: 'hsl(0, 100%, 75%)'
    	        },  {
    	          title: '4',
    	          start: '2018-03-05T12:00:00',
    	          end: '2018-03-05T18:00:00',
    	          url: '/',
    	          color: 'hsl(0, 50%, 75%)'
    	        },  {
    	          title: '5',
    	          start: '2018-03-01T12:00:00',
    	          end: '2018-03-03T18:00:00',
    	          url: '/',
    	          color: 'rgb(0, 204, 255)'
    	        }, 

    	      ]
    	    });

    	  });
</script>

<style type="text/css">
.top{
	width : 100%;
	height : 40px;
	background-color: #999999;
}

.topspan1 {
	margin : 10px 0px 0px 30px;
	font-size: 25px;
	font-weight : bold;
}
.topspan2 {
	margin : 10px 0px 0px 5px;
	font-size: 15px;
}

.one {
	background-color: #f2f5f5;
	width : 15%;
	height : 100%;
	float: left;
	margin-right: 10px;
	text-align: center;
}

.two {
	width : 100%;
	height: 50px;
	background-color: #000042;
	color:white;
	float: left;
	font-weight : bold;
	display:table;
	margin-top: 10px;
}

.groupName {
	height: 150px;
	width:95%;
	margin:10px auto 10px auto;
	/* �۾� ���߾� ���� 1 */
	display:table;
}

	/* �۾� ���߾� ���� 2 */
.center {
	display:table-cell;
	margin:auto;
	text-align:center;
	vertical-align:middle;
	font-weight : bold;
}

.three {
	margin : 10px 0px 10px 0px;
}

.threeTable {
	padding-left: 20px;
	width: 50%;
}

.threeTable tr {
	height : 30px;
}

.threeTable .th0 {
	text-align: left;
	font-weight: normal;
	font-size: 25px;
	color : gray;
}

.threeTable .th1 {
	text-align: left;
	font-weight: normal;
	font-size: 13px;
}

.threeTable td {
	width : 50px;
}

.paging {
	text-align: center;
}

.memberTitle{
	margin-bottom: 20px;
	font-size : 20px;
}

.fourTable {
	float: right;
}

body {
	margin : 0px;
}

</style>
</head>
<body>

<div class="top">
	<span class="topspan1">TOP </span><span class="topspan2"> SMART GROUPWARE</span>
</div>

<div class="one">
	<div class="two">
		<span class="center">ȸ���ϱ�</span>
	</div>
	<div class="groupName">
		<span class="center"> TOP <br> Take of Project </span>
	</div>
	<div class="groupMember">
		<div class="memberTitle"> MEMBER LIST </div>
		<div class="member">
			
			<div class="pm"><img src="./resources/img/pm.png" style="width:20px;"/> ����ö</div>
		</div>
	</div>
</div>

<div class="three">
	<table class="threeTable">
		<tr>
			<th class="th0">����</th>
			<td></td>
		</tr>
		<tr>
			<th class="th1">���� ȸ�Ǵ� 4�� 3�� �ڿ���</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">Ŭ���� �ϰ� üũ ��Ź�帳�ϴ�</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">���� ��ǥ�ڷ� ���� �Ϸ�</th>
			<td>03/20</td>
		</tr>
		<tr>
			<th class="th1">�ݿ� �߰���ǥ �� ���� �������ּ���.</th>
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
			<th class="th0">���ϸ���Ʈ</th>
			<td></td>
		</tr>
		<tr>
			<th class="th1">����1</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">����2</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">����3</th>
			<td>03/20</td>
		</tr>
		<tr>
			<th class="th1">����4</th>
			<td>03/18</td>
		</tr>
		<tr>
			<th class="th1">����5</th>
			<td>03/18</td>
		</tr>
		<tr>
			<th class="th1">����6</th>
			<td>03/18</td>
		</tr>
	</table>
</div>

</body>
</html>
