<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/hjscheduler/js/jquery-3.1.0.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->

 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous"> 
<style>
body{background-image: url('/hjscheduler/images/2.jpg');background-size:100%;}
#main{height:1200px; min-height:750px; min-width:50%;} 
#mainContainer{width:100%;min-height:1400px;}
#main{ border:solid 1px white; max-height:80%; min-width:50%;width:80%; margin-left:13%; margin-right:20%;margin-top:2%;background:white; opacity:0.7;}
#mainCalender{width:100%;min-width:400px;font-size: 65px; color:#7B0091;text-align:center;margin-top:20px;}
#top{padding-left:2%;width:100%;height:70px;margin-top:10px; overflow:hidden;}
#dayCalender{margin-top:40px;max-height:90%;width:100%;border:solid 1px white;overflow:hidden;overflow-y:scroll;}
#table{width:170%;height:100%;margin-left:5%;padding-top:40px;margin-top:25px;align:center;border-top:2px solid gray;overflow:scroll; height:150px;}
th:first-child{width:70px;}
td{height:60px;}
th{border-bottom:2px solid gray;font-size:28px;height:40px;}
td{border-bottom:1px solid gray;font-size:18px;color:black;text-align:left;vertical-align:top;}
.day{height:60px;}
td:last-child:HOVER{background-color:#CCC9FD;color:black;font-weight: bold;}
td{border-left:solid 1px gray;}
.glyphicon.glyphicon-chevron-left,.glyphicon.glyphicon-chevron-right {height:20px; color:#7B0091;}
ul{box-sizing:border-box;min-width:400px;/* position:absolute; */width:550px;left:70%;height:40px;padding-left:180px;}
span:child(0):HOVER{background-color: gray; font-weight: bold; color:black; }
span:child(1):HOVER{background-color: gray; font-weight: bold; color:black; }
ul{float:right;}
li{float:left;list-style:none;}
ul>li>img:child(0){height:1px;}
#one{padding-left:10px;font-size:40px;margin-top:20px;}
span{padding-left:5px;font-size:40px;color:gray;}
 /* .btn.btn-default{ width:50%;} */
</style>
	<%@ include file="/popUp.html" %>
<head>
<title>Insert title here</title>
</head>
<body>	
	<div id="mainContainer">
	<div id="main">
		<div id="top">
		<span><a href="#1" onclick="date(1);">&lt;</a></span><span><a href="#" onclick="date(2);">&gt;</a></span><span id="one"></span>
			<ul>
				<li><img src="/hjscheduler/images/today.jpg"> </li>
				<li><a href="/hjscheduler/schedule/day_schedule.do"><img src="/hjscheduler/images/day.jpg"></a></li>
				<li><a href="/hjscheduler/schedule/map.do"><img src="/hjscheduler/images/week.jpg"></a></li>
				<li><a href="/hjscheduler/schedule/month_schedule.do"><img src="/hjscheduler/images/month.jpg"></a></li>
			</ul>
		</div>
			<div id="dayCalender">
			
				<table id="table">
				</table>
			</div>
		</div>
	</div>
		
	
<script type="text/javascript">
window.onload = day();
date();

function date(value){
	var myYear;
	var myMonth;
	var Day;
	var day2;
	var monthDate;
	var lastDay;
	var currentDate;
	var nextDay;
	var dayArr = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
	
	//화살표 클릭했을경우 이벤트 발생
	if(value){
		var monthArr=$("#one").html();
		var tDay=$(".day").html();
		myYear=monthArr.substring(0,4);
		myMonth=monthArr.substring(5,8);
		myMonth=myMonth.trim();
		Day=tDay.substring(0,2);
		
		lastDay = new Date(myYear, myMonth, "").getDate();
		
		monthDate = new Date(myYear+"-"+myMonth+"-"+Day).getDay();		
			
			if (value ==2) {
				Day=parseInt(Day)+1;
				nextDay=Day+1; 
				if(monthDate==6){
					day2=0;		
				}else{
					day2 = monthDate + 1;			
				}
				if(lastDay==Day){
						myMonth=parseInt(myMonth)+1;
						Day=1;
						nextDay=Day+1
					}
					if(myMonth==12){
						myMonth=1;
						myYear=myYear+1;
					}
			}else if(value ==1){
				Day=parseInt(Day)-1;
				if(Day==0){
					myMonth=parseInt(myMonth)-1;
					nextDay = new Date(myYear, myMonth, "").getDate();
					Day=nextDay-1;
				}
				if(monthDate==0){
					day2=6;		
				}else{
					day2 = monthDate -1;			
				}
				nextDay =Day+1;
			}			

			} else {
				currentDate = new Date();
				myYear = currentDate.getFullYear();
				//현재 월
				myMonth = currentDate.getMonth() + 1;
				//현재 일
				Day = currentDate.getDate();
				//다음날
				nextDay =parseInt(Day)+1; 
				//해당월의 요일
				monthDate = new Date().getDay();
				//해당 일의 다음 날
				day2=monthDate+1;
				//마지막날
				lastDay = new Date(myYear, myMonth, "").getDate();
			}
				$("th").remove();
				$("tr").eq(1).remove();
				Day = Day < 10 ? '0' + Day : Day; 
				nextDay = nextDay < 10 ? '0' + nextDay : nextDay; 
				
				$("#table").prepend(
						"<tr><th></th><th id='hDay'>" + dayArr[monthDate]+ "</th><th>"
								+ dayArr[day2]
								+ "</th></tr><tr><td></td><td class='day'>" + Day
								+ "일</td><td class='day'>"+ nextDay+"일</td></tr>");

		myMonth = parseInt(myMonth);   
		myMonth = myMonth < 10 ? '0' + myMonth : myMonth; 
		$("#one").html(myYear + "년 " + myMonth + "월 ");
			
	}
	function day() {
		var ck = [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];	
		var cnt = 0;
		var cnt2 = 0; 
		var time ="오전";
		for (var i = 0; i < ck.length; i++) {
	
			if (i==12) {
				time = "오후";
			} 
			if(i==1){
			$("#table").append("<tr><td>"+time + ck[i]+ "</td><td id="+ 1 +" onclick='pop(1);' data-target='#layerpop' data-toggle='modal''></td><td id="+ 1 +" onclick='pop(2);' data-target='#layerpop' data-toggle='modal'></td></tr>");	
			}
			$("#table").append("<tr><td>"+time + ck[i]+ "</td><td id="+ cnt++ +" onclick='pop(1);'  data-target='#layerpop' data-toggle='modal''></td><td id="+ cnt2++ +" onclick='pop(2);' data-target='#layerpop' data-toggle='modal'></td></tr>");
			 			
		}
	}
	

  function pop(val){
	  //$("#layerpop").empty();
	  var day 
	  
	  if(val==1){
		day=$("#table").find(".day:eq(0)").html();
	  }else{
		day=$("#table").find(".day:eq(1)").html();
	  }
	
		var year=$("#one").html();
	
		$(".modal-header").html(year+day);  
		var cnt=$(this).attr('id'); 
		$("#select1 option:eq("+ cnt + ")").prop("selected", true);
		$("#select2 option:eq("+ ++cnt +")").prop("selected", true);	
	  
	  
  }




</script>
</body>

</html>