package global.sesoc.TOPproject.DAO;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import global.sesoc.TOPproject.HomeController;
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

@Repository
public class UserDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	SqlSession sqls;
	

	// I N S E R T ------------------------------------------------------------------
	
	
	public int insertUser(User user){
		logger.info("회원 등록 : " + user);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", user.getId());
		map.put("fl", "temp");
		int result = 0;
		
		try{
			result = mapper.insertUser(user);
			mapper.insertFriendList(map);
			logger.info("회원 등록 성공");
		}catch(Exception e){ logger.info("회원 등록 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	public int insertUserSchedule(Schedule schedule){
		logger.info("회원 스케쥴 등록 : " + schedule);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertUserSchedule(schedule);
			logger.info("회원 스케쥴 등록 성공");
		}catch(Exception e){ logger.info("회원 스케쥴 등록 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	public int insertUserMemo(Memo memo){
		logger.info("회원 메모 등록 : " + memo);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertUserMemo(memo);
			logger.info("회원 메모 등록 성공");
		}catch(Exception e){ logger.info("회원 메모 등록 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	// U P D A T E ------------------------------------------------------------------
	
	
	public int updateUser(User user){
		logger.info("회원 정보 수정 : " + user);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			mapper.updateUser(user);
			logger.info("회원 정보 수정 성공");
		}catch(Exception e){ logger.info("회원 정보 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateFriendList(String id, String fl){
		logger.info("회원 친구목록 수정 : " + id + ", " + fl);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("fl", fl);
		int result = 0;
		
		try{
			mapper.updateFriendList(map);
			logger.info("회원 친구목록 수정 성공");
		}catch(Exception e){ logger.info("회원 친구목록 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateUserSchedule(Schedule schedule){
		logger.info("회원 스케쥴 수정 : " + schedule);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			mapper.updateUserSchedule(schedule);
			logger.info("회원 스케쥴 수정 성공");
		}catch(Exception e){ logger.info("회원 스케쥴 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateUserMemo(Memo memo){
		logger.info("회원 메모 수정 : " + memo);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateUserMemo(memo);
			logger.info("회원 메모 수정 성공");
		}catch(Exception e){ logger.info("회원 메모 수정 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
	// D E L E T E ------------------------------------------------------------------
	
	
	public int deleteUserMemo(Memo memo){
		logger.info("회원 메모 삭제 : " + memo);
		
		UserMapperInterface mapper = sqls.getMapper(UserMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.deleteUserMemo(memo);
			logger.info("회원 메모 삭제 성공");
		}catch(Exception e){ logger.info("회원 메모 삭제 실패"); e.printStackTrace(); }
		
		return result;
	}
	
	
}
