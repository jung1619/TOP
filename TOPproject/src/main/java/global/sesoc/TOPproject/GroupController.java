package global.sesoc.TOPproject;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.User;

@Controller
public class GroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Inject
	ProjectDAO pDao;
	@Inject
	UserDAO uDao;
	
	
	
	@RequestMapping(value="groupForm", method=RequestMethod.GET)
	public String groupForm(String id){
		
		return "group_form";
	}
	
	
	@ResponseBody
	@RequestMapping(value="loadFL", method=RequestMethod.GET)
	public String[] loadFL(String id){
		logger.info("친구목록 조회 : " + id);
		
		String fl = uDao.searchUserFL(id);
		String[] list = fl.split("/");
		
		logger.info("친구목록 조회 결과 : " + list);
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping(value="createProject", method=RequestMethod.POST)
	public String createProject(Project project){
		logger.info("프로젝트 생성 시도 : " + project);
		
		int result = pDao.insertProject(project);
		if( result == 1 )
			return "1";
		else
			return "2";
		
	//	return "group";
	}
	
	
	
}//class
