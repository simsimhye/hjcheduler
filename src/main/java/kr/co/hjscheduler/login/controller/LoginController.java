package kr.co.hjscheduler.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hjscheduler.login.service.LoginService;
import kr.co.hjscheduler.vo.LoginVO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/loginAuth.do")
	@ResponseBody
	public int insertLogin(@RequestParam(value="id")int id, HttpSession session) throws Exception{
		//session.setAttribute("user",id);
		int name =loginService.selectMember(id);			
		
		if(name==1){
			loginService.insertMember(id);
			
		}
			
		session.setAttribute("user", id);
		
		
		/*	@RequestMapping("/login/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}*/
			
		
	return name;
	}
	
	
}
