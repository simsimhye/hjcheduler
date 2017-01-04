package kr.co.hjscheduler.login.service;

public interface LoginService {
	
	/**사용자 유저 정보가져오기 */
	public int selectMember(int userNo)throws Exception;
	
	/**사용자 유저 정보 등록*/
	public void insertMember(int userNo) throws Exception;
}
