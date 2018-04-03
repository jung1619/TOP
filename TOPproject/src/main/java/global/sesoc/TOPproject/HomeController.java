package global.sesoc.TOPproject;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;
 
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value = "group", method = RequestMethod.GET)
	public String group() {
		
		return "group";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		
		return "join";
	}
	
	@RequestMapping(value = "view_3", method = RequestMethod.GET)
	public String view_3() {
		 
		return "view_3";
	}
	
	@RequestMapping(value="Notice",method= RequestMethod.GET)
	public String NoticePage(){
		return "notice";
	}
	
	
	// T E S T -----------------------------------------------------------
	
	@Inject
	UserDAO uDao;
	@Inject
	ProjectDAO pDao;
	
	@RequestMapping(value="test", method = RequestMethod.GET)
	public void test(){
		/*
		Project p = new Project();
		p.setP_m_id("test_id"); p.setP_name("테스트 프로젝트"); p.setP_memberlist("test_id/t1/t2/t3");
		Schedule ps = new Schedule();
		ps.setP_num(1); ps.setStart_date("18/3/31"); ps.setEnd_date("18/4/5"); ps.setContent("test입니다_그룹스케쥴"); 
		Memo pm = new Memo();
		pm.setP_num(1); pm.setN_content("test입니다_공지");
		
		pDao.insertProject(p);
		pDao.insertProjectSchedule(ps);
		pDao.insertProjectNotice(pm);
	
		User u = new User();
		u.setId("test_id"); u.setPw("test"); u.setEmail("test@test.com"); u.setName("테스트");
		Schedule us = new Schedule();
		us.setId("test_id"); us.setStart_date("18/3/31"); us.setEnd_date("18/4/5"); us.setContent("test입니다_개인스케쥴");
		Memo um = new Memo();
		um.setId("test_id"); um.setN_content("test입니다_메모");
		
		uDao.insertUser(u);
		uDao.insertUserSchedule(us);
		uDao.insertUserMemo(um);
		*/
		
		
		Project p = new Project();
		p.setP_num(1); p.setP_m_id("test_id"); p.setP_name("테스트 프로젝트2"); p.setP_memberlist("test_id/t1/t2/t3/t4/t5/t6");
		Schedule ps = new Schedule();
		ps.setP_num(1); ps.setStart_date("01/3/31"); ps.setEnd_date("01/4/5"); ps.setContent("test입니다_그룹스케쥴2"); 
		Memo pm = new Memo();
		pm.setP_num(1); pm.setN_content("test입니다_공지2");
		
		pDao.updateProject(p);
		pDao.updateProjectSchedule(ps);
		pDao.updateProjectNotice(pm);
		
		User u = new User();
		u.setId("test_id"); u.setPw("test"); u.setEmail("test2@test.com"); u.setName("테스트2");
		Schedule us = new Schedule();
		us.setId("test_id"); us.setStart_date("01/3/31"); us.setEnd_date("01/4/5"); us.setContent("test입니다_개인스케쥴2");
		Memo um = new Memo();
		um.setId("test_id"); um.setN_content("test입니다_메모2");
		
		uDao.updateUser(u);
		uDao.updateUserSchedule(us);
		uDao.updateUserMemo(um);
		uDao.updateFriendList("test_id", "t1/t2");
		
	}
	
	
	
	
	
}//class
