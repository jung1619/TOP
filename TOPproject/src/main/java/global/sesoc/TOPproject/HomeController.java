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
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String gohome() {
		
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
	
	
	
}//class
