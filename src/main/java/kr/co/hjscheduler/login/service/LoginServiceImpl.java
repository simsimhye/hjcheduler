package kr.co.hjscheduler.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hjscheduler.mapper.LoginDAO;



@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO dao;
	
	public int selectMember(int userNo) throws Exception {
		return dao.selectMember(userNo);
	}
	
	public void insertMember(int userNo) throws Exception {
		dao.insertMember(userNo);
		
	}
}