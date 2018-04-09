package global.sesoc.TOPproject;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Schedule;
import global.sesoc.TOPproject.VO.User;

@Controller
public class LoginController {
	
	private final static Logger logger= LoggerFactory.getLogger(JoinController.class);
	
	
	@Inject
	UserDAO userDao;
	
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(User user, HttpSession hs,Model model){
		logger.info("로그인 시도 : " + user);
		
		User loginedUser = userDao.searchUser(user.getId());
		
		//세션을 담음
		hs.setAttribute("loginedId", loginedUser.getId());
		String groupList = loginedUser.getP_num_list();
		String [] groupArr = groupList.split("/");
	
		//모델로 보내줌
		model.addAttribute("groupList",groupArr);
		
		//켈린더 관련
		String id = (String) hs.getAttribute("loginedId");
		ArrayList<Schedule> scheduleListview = userDao.selectSchedule(id);
		model.addAttribute("listview", scheduleListview);
		
		//네비게이터에 임시로 값 담는 용도
		String personal = "personal";
		model.addAttribute("personal", personal);
		return "personal";
	}//login()
	
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout( HttpSession hs ){
		
		hs.invalidate();
		return "redirect:/";
	}//logout

}//class
