package kr.co.hjscheduler.calender.service;

import java.util.List;

import kr.co.hjscheduler.vo.ScheduleVO;

public interface SchedulerService {
	
	/**이벤트 등록*/
	public void insertEvent() throws Exception;

	/**등록된 이벤트 가져오기*/
	public List<ScheduleVO> dayScheduler(int user) throws Exception;
	
}
