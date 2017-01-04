package kr.co.hjscheduler.calender.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hjscheduler.mapper.CalenderDAO;
import kr.co.hjscheduler.vo.ScheduleVO;

@Service
public class SchedulerServiceImpl implements SchedulerService {

	@Autowired
	private CalenderDAO calenderDAO;

	public void insertEvent() throws Exception {
		
	}

	public List<ScheduleVO> dayScheduler(int user) throws Exception {
		List<ScheduleVO> list=calenderDAO.selectEvent(user);
		return list;
	}
	
	
	
	
	
}
