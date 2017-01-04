package kr.co.hjscheduler.calender.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hjscheduler.calender.service.SchedulerService;
import kr.co.hjscheduler.vo.ScheduleVO;


@Controller("kr.co.hjscheduler.calender.controller.CalenderController")
@RequestMapping("/schedule")
public class CalenderController {

	@Autowired
	private SchedulerService service;
	
	@RequestMapping("/day_schedule.do")
	public void dayScheduler(HttpSession session,Model model) throws Exception{
		int user=(Integer)session.getAttribute("user");
		List<ScheduleVO> list =service.dayScheduler(user);
		System.out.println(list);
		model.addAttribute("list",list);
		
	}
	@RequestMapping("/month_schedule.do")
	public void monthScheduler(HttpSession session,Model model) throws Exception{
		int user=(Integer)session.getAttribute("user");
		List<ScheduleVO> list =service.dayScheduler(user);
		System.out.println(list);
		model.addAttribute("list",list);
		
	}
}
