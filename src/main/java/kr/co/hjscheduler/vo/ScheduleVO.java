package kr.co.hjscheduler.vo;

import java.util.Date;

public class ScheduleVO {
	private int eventId;
	private int userNo;
	private String eventName;
	private Date eventDate;
	private int ap;
	private String startHours; 
	private String endHours;
	private int eventColor;
	
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public int getAp() {
		return ap;
	}
	public void setAp(int ap) {
		this.ap = ap;
	}
	public String getStartHours() {
		return startHours;
	}
	public void setStartHours(String startHours) {
		this.startHours = startHours;
	}
	public String getEndHours() {
		return endHours;
	}
	public void setEndHours(String endHours) {
		this.endHours = endHours;
	}
	public int getEventColor() {
		return eventColor;
	}
	public void setEventColor(int eventColor) {
		this.eventColor = eventColor;
	}
	
	
	
}
