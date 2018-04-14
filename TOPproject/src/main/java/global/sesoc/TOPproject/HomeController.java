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
	public String group(HttpSession hs, ModelMap modelMap,HttpServletRequest req,Model model, String groupNum) {
		
		//켈린더 관련
		String p_num = req.getParameter("groupNum");
		logger.info("p_num : " + p_num);
		if(p_num == null){
			p_num = groupNum;
			logger.info("p_num1 : " + p_num);
		}
		ArrayList<Schedule> scheduleListview = projectDAO.selectProjectSchedule(p_num);
		logger.info("스케쥴 : " + scheduleListview);
		modelMap.addAttribute("listview", scheduleListview);
		
		//공지사항 
		
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
	public String personal(User user, HttpSession hs, Model model){
		
		String id = (String) hs.getAttribute("loginedId");
		User loginedUser = userDAO.searchUser(id);
			
		hs.setAttribute("loginedId", loginedUser.getId());
			
		String groupList = loginedUser.getP_num_list();
		if( groupList != null ){				
			String [] groupArr = groupList.split("/");
			logger.info("groupArr : " + groupArr);
			model.addAttribute("groupList", groupArr);
		}
		ArrayList<Schedule> scheduleListview = userDAO.selectSchedule(id);
		model.addAttribute("listview", scheduleListview);
		
		//네비게이터에 임시로 값 담는 용도
		String personal = "personal";
		model.addAttribute("personal", personal);
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
	@ResponseBody
	@RequestMapping(value = "idSearch", method = RequestMethod.POST)
	public String idSearch(String searchId, HttpSession session) {
		logger.info("친구검색 시도 : " + searchId);
		User user = userDAO.searchUser(searchId);
		logger.info("친구검색 종료 : " + searchId);
		logger.info("sessionId : " + session.getAttribute("loginedId"));

		if(user != null && !(session.getAttribute("loginedId").equals(searchId))) {
			logger.info("success");
			return user.getId();
		}
		else {
			logger.info("failed");
			return "failed";
		}
		
	}
	
	//친구추가
	@ResponseBody
	@RequestMapping(value = "friendAdd", method = RequestMethod.POST)
	public String friendAdd(String searchId, HttpSession session) {
		logger.info("친구추가 시도 : " + searchId);

		String sessionId = (String) session.getAttribute("loginedId");
		logger.info(sessionId);
		logger.info(searchId);
		//친구목록꺼내기
		userDAO.updateFriendList(sessionId, searchId);
		String fList = userDAO.searchUserFL(sessionId);
		logger.info(fList);
		logger.info("친구추가 종료 : " + searchId);
		
		
		return fList;
	}


}// class
