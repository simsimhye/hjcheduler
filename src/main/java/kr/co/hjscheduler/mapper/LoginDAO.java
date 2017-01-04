package kr.co.hjscheduler.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hjscheduler.vo.LoginVO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectMember(int id) {
		
		/*int no =sqlSessionTemplate.selectOne("loginDAO.selectMember",id);*/
		
		
		if(sqlSessionTemplate.selectOne("loginDAO.selectMember",id)!=null){
			int no =sqlSessionTemplate.selectOne("loginDAO.selectMember",id);
			if(no==id){
				return id;
			}else{
				return no;
			}
				
		}else{
			return 1;			
		}
		
		
	}

	public void insertMember(int id) {
		sqlSessionTemplate.insert("loginDAO.insertMember",id);
	
	}	
}
