package global.sesoc.TOPproject.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.TOPproject.HomeController;
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.Schedule;

@Repository
public class ProjectDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sqls;
	
	
	// I N S E R T ------------------------------------------------------------------
	
	
	public int insertProject(Project project){
		logger.info("프로젝트 생성 : " + project);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertProject(project);
			logger.info("프로젝트 생성 성공");
		}catch(Exception e){ logger.info("프로젝트 생성 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int insertProjectSchedule(Schedule schedule){
		logger.info("프로젝트 스케쥴 등록 : " + schedule);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertProjectSchedule(schedule);
			logger.info("프로젝트 스케쥴 등록 성공");
		}catch(Exception e){ logger.info("프로젝트 스케쥴 등록 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int insertProjectNotice(Memo memo){
		logger.info("프로젝트 공지 등록 : " + memo);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.insertProjectNotice(memo);
			logger.info("프로젝트 공지 등록 성공");
		}catch(Exception e){ logger.info("프로젝트 공지 등록 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	// U P D A T E ------------------------------------------------------------------
	
	
	public int updateProject(Project project){
		logger.info("프로젝트 수정 : " + project);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateProject(project);
			logger.info("프로젝트 수정 성공");
		}catch(Exception e){ logger.info("프로젝트 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateProjectSchedule(Schedule schedule){
		logger.info("프로젝트 스케쥴 수정 : " + schedule);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateProjectSchedule(schedule);
			logger.info("프로젝트 스케쥴 수정 성공");
		}catch(Exception e){ logger.info("프로젝트 스케쥴 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	public int updateProjectNotice(Memo memo){
		logger.info("프로젝트 공지 수정 : " + memo);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.updateProjectNotice(memo);
			logger.info("프로젝트 공지 수정 성공");
		}catch(Exception e){ logger.info("프로젝트 공지 수정 실패"); e.printStackTrace(); }
		return result;
	}
	
	
	// D E L E T E ------------------------------------------------------------------
	
	
	public int deleteProjectNotice(Memo memo){
		logger.info("프로젝트 공지 삭제 : " + memo);
		
		ProjectMapperInterface mapper = sqls.getMapper(ProjectMapperInterface.class);
		int result = 0;
		
		try{
			result = mapper.deleteProjectNotice(memo);
			logger.info("프로젝트 공지 삭제 성공");
		}catch(Exception e){ logger.info("프로젝트 공지 삭제 실패"); e.printStackTrace(); }
		return result;
	}
	

}