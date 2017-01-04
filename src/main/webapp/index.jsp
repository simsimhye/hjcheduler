<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user")!=null){
		response.sendRedirect("schedule/day_schedule.do");
	}else{
	response.sendRedirect("login.do");		
	}
%>