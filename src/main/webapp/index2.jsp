<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a href="#" onclick ='login()'>dddd</a>
<script src="./js/jquery-3.1.0.js"></script>
<script>
function login(){

	$.ajax({
		url:"/hjscheduler/loginAuth.do",
		type:"POST", 
		data:{id : 1234},
		dataType:"json"
	})
	.done(function(result){
		link();
		
	
	});	


}

function link(){		
	window.location.href=("/hjscheduler/schedule/day_schedule.do"); 
	}	

</script>