package kr.co.hjscheduler.mapper;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hjscheduler.vo.ScheduleVO;

@Repository
public class CalenderDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<ScheduleVO> selectEvent(int user) {
		
		if( session.selectList("schedulerDAO.selectSC",user)!=null){
			List<ScheduleVO> list  =session.selectList("schedulerDAO.selectSC",user);

			}else{
				return null;
			}
			
		return null;
	
	}

}
