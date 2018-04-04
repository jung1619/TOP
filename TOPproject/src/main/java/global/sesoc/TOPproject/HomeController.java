package global.sesoc.TOPproject;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@Autowired
	UserDAO userDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String gohome() {

		return "home";
	}

	// 그룹 수정
	@RequestMapping(value = "group", method = RequestMethod.GET)
	public String group(HttpSession hs, ModelMap modelMap) {
		String id = (String) hs.getAttribute("loginedId");
		ArrayList<Schedule> scheduleListview = userDAO.selectSchedule(id);
		modelMap.addAttribute("listview", scheduleListview);
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

	@RequestMapping(value = "Notice", method = RequestMethod.GET)
	public String NoticePage() {
		return "notice";
	}

	// 친구검색
	@RequestMapping(value = "idSearch", method = RequestMethod.POST)
	public String idSearch(String searchId, Model model, HttpSession session) {
		logger.info("친구검색 시도 : " + searchId);

		boolean result = false;
		String sessionId = (String) session.getAttribute("loginedId");
		model.addAttribute("sessionId", sessionId);
		
		User loginedUser = userDAO.searchUser(searchId);
		model.addAttribute("searchId", loginedUser.getId());
		model.addAttribute("result", loginedUser);

		logger.info("친구검색 종료 : " + searchId);

		return "group";
	}

}// class
