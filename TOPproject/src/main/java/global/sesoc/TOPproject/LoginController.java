package global.sesoc.TOPproject;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.User;

@Controller
public class LoginController {
	
	private final static Logger logger= LoggerFactory.getLogger(JoinController.class);
	
	
	@Inject
	UserDAO userDao;
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(User user, Model m, HttpSession hs){
		logger.info("로그인 시도 : " + user);
		
		User loginedUser = userDao.searchUser(user.getId());
		
		if( (loginedUser != null) && (user.getPw().equals(loginedUser.getPw())) ){ // 로그인
			hs.setAttribute("loginedId", loginedUser.getId() );
			hs.setAttribute("loginedNickname", loginedUser.getNickname() );
			
			System.out.println((String)hs.getAttribute("loginedId"));
			logger.info("로그인 성공");
			return "group";
		}else{ // 해당 ID가 없는 경우, ID와 PW의 불일치
			m.addAttribute("errorMsg", "입력하신 아이디와 비밀번호를 다시 확인해 주십시오.");
			
			logger.info("로그인 실패");
			return "home";
		} 
	}//login()
	
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout( HttpSession hs ){
		
		hs.invalidate();
		return "home";
	}//logout

}//class
