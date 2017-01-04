<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="/hjscheduler/js/jquery-3.1.0.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous"> 
<style>
body{background-image: url('/hjscheduler/images/2.jpg');background-size:100%;}
#main{ min-height:750px; min-width:50%;} 
#mainContainer{width:100%; /* min-width:600px;  */min-height:1400px; overflow:visible; }
#main{position:relative; border:solid 1px white; max-height:80%; min-width:50%;width:80%; margin-left:13%; margin-right:20%;  margin-top:2%;background:white; opacity:0.7;}
#mainCalender{width:100%;min-width:400px;  font-size: 65px; color:#7B0091;text-align:center;margin-top:20px;}
#top{padding-left:70%;width:100%;height:70px;}
#dayCalender{max-height:80%;height:100%;width:100%;border:solid 1px white;}
#table{width:80%;height:80%;margin-left:10%;padding-top:40px;margin-top:25px;align:center;}
table,th,td{/* border:1px solid black; */}
th{border-bottom:2px solid gray;font-size:28px;height:40px;/* color:#4E4646; */}
th:first-child{color:#F73F48;}
th:last-child{color:#604EFF;}
td{height:180px;border-bottom:1px solid gray;font-size:28px;color:black;text-align:left;vertical-align:top}
td:HOVER{background-color: #C4C4C6;color:black;font-weight: bold;}
td:ntn-child(0):HOVER{background-color: #F2B9B9;color:black;font-weight: bold;}
td:ntn-child(0):HOVER{background-color: #CCC9FD;color:black;font-weight: bold;}
.glyphicon.glyphicon-chevron-left,.glyphicon.glyphicon-chevron-right { text-decoration: none;height:20px; color:#7B0091;}
.glyphicon.glyphicon-chevron-right{text-decoration: none;}
ul{box-sizing:border-box;min-width:400px;/* position:absolute; */width:550px;left:70%;height:40px;margin-top:10px;padding-left:180px;}
ul{float:right;}
li {float:left;list-style: none;}
ul>li>img:child(0){width:5px;}
</style>
	<%@ include file="/popUp.html" %>
<head>
<title>Insert title here</title>

</head>
<body>	
	<div id="mainContainer">
	<div id="dd"></div>
	<div id="main">
		<div id="top">
			<ul>
				<li><img src="/hjscheduler/images/today.jpg"> </li>
				<li><a href="/hjscheduler/schedule/day_schedule.do"><img src="/hjscheduler/images/day.jpg"></a></li>
				<li><img src="/hjscheduler/images/week.jpg"></li>
				<li><a href="/hjscheduler/schedule/month_schedule.do"><img src="/hjscheduler/images/month.jpg"></a></li>
			</ul>
		</div>
			<div id="mainCalender">
				<a href="#1" onclick="month('1')"><span class="glyphicon glyphicon-chevron-left"></span></a>
				<span id="cal"><span id="calYear"></span>년 <span id="calMonth"></span>월</span>
				<a href="#1" onclick="month('2')"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			<div id="dayCalender">
				<table id="table">
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">	
	
		var myYear;
		var myMonth;
		var Day;
		var monthDate;
		var lastDay;
		var currentDate;

		currentDate = new Date();
		myYear = currentDate.getFullYear();
		//현재 월
		myMonth = (currentDate.getMonth() + 1);
		//현재 일
		Day = currentDate.getDate();
		//해당월의 요일
		monthDate = new Date().getDay();
		lastDay = new Date(myYear, myMonth, "").getDate();
		
		function day() {

			if (myYear != null) {
				$("th,td").remove();
				//currentDate.setFullYear(myYear,myMonth,1);		
				/* 		myYear = currentDate.getFullYear();
				 myMonth = currentDate.getMonth();  */
				monthDate = new Date(myYear + '-' + myMonth + '-01').getDay();
				//현재 월의 마지막 달 구하기
	 			lastDay = new Date(myYear, myMonth, "").getDate();
	
			}
			var han_dayName = new Array('일요일','월요일','화요일','수요일','목요일','금요일', '토요일');

			var table = $("#table");
			//요일 출력
			for (var i = 0; i < han_dayName.length; i++) {
				$("tr:eq(0)").append("<th>" + han_dayName[i] + "</th>");
			}
			//날짜 출력
			var cnt = 1;
			var day = 1;
			
			for (var i = 1; i <= lastDay; i++) {
				if (i == 1) {
					for (var j = 0; j <= 7; j++) {
						if (j == monthDate)
							break;
						$("tr:eq(1)").append("<td id='day"+j+"'>");
					}
					while (true) {
						$("tr:eq(1)").append("<td class='pop' data-target='#layerpop' data-toggle='modal' id='day"+monthDate+"'>" + day + "일 </td>")
						monthDate++;
						day++;
						if (monthDate == 7)
							break;
					}
					cnt++;
				}
				if (i == 8 || i == 15 || i == 22 || i == 29) {
					cnt++;
				}
				day++;
				$("tr:eq(" + cnt + ")").append("<td class='pop' data-target='#layerpop' data-toggle='modal'>" + day + "일 </td>")
				if(cnt==6){
					$("#main").removeAttr("height");
				}
				if (day == lastDay)
					break;
				
			}
			
			MonthDAY(myYear, myMonth);
		}

		function month(pointer) {
			if (pointer == 1) {
				if (myMonth == 12) {
					myMonth = myMonth - 1;
				} else if (myMonth == 1) {
					myMonth = 12;
					myYear = myYear - 1;
				} else {
					myMonth = myMonth - 1
				}
				day(myYear, myMonth);
				MonthDAY(myYear, myMonth);
			}
			if (pointer == 2) {
				if (myMonth == 12) {
					myMonth = 1;
					myYear = myYear + 1;
				} else if (myMonth == 1) {
					myYear = myYear + 1;
					myMonth = myMonth + 1
				} else {
					myMonth = myMonth + 1;
				}
				day(myYear, myMonth);
				MonthDAY(myYear, myMonth);
			}

		};

		function MonthDAY(myYear, myMonth) {
			$("#calYear").html(myYear);
			$("#calMonth").html(myMonth);
		}

		MonthDAY(myYear, myMonth, monthDate);
		day();
		
	  $(".pop").click(function (){		  
			var cal=$("#cal").html();
			var day =$(this).html()
			$(".modal-header").html(cal+" "+day);  
	 });
		
	</script>
</body>
</html>