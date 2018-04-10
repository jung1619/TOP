package global.sesoc.TOPproject;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Notice;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	ArrayList<Notice> n_list= new ArrayList<Notice>();

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	//@Autowired 따로따로 사용해야함
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	ProjectDAO projectDAO;

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
	public String group(HttpSession hs, ModelMap modelMap,HttpServletRequest req,Model model) {
		
		//켈린더 관련
		String id = (String) hs.getAttribute("loginedId");
		ArrayList<Schedule> scheduleListview = userDAO.selectSchedule(id);
		modelMap.addAttribute("listview", scheduleListview);
		
		
		
		
		//공지사항 
		String p_num = req.getParameter("groupNum");
		
		System.out.println("get으로 받아온 파라미터: "+p_num);
		//p_num을 받아다가 다오로 넣어서 끌어와야함
		ArrayList<Notice> n_list = projectDAO.noticeList(p_num);
		
		System.out.println("보내짐");
		
		for(Notice n  : n_list){
			System.out.println(n+"받아온 노티스 출력");
		}
		model.addAttribute("n_list", n_list);
		model.addAttribute("p_num",p_num);
		return "group";
	}
	
	@RequestMapping(value="personal",method=RequestMethod.GET)
	public String personal(){
		
		return "personal";
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
	
	//친구추가
	@RequestMapping(value = "addFriend", method = RequestMethod.GET)
	public String addFriend(String sessionId, String friendId, Model model) {
		logger.info("친구추가 시도 : " + sessionId + friendId);
		
		int result = userDAO.updateFriendList(sessionId, friendId);
		
		model.addAttribute("addedFriend", friendId);
		
		logger.info("친구추가 종료 : " + sessionId + friendId);
		
		return "group";
	}
	
	
	

}// class
