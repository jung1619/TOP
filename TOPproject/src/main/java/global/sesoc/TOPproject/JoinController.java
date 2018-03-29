package global.sesoc.TOPproject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {
	
	private final static Logger logger= LoggerFactory.getLogger(JoinController.class);
	
	
	
	// ajax로 유저이름 체크
	@RequestMapping(value="UserNameCheck",method=RequestMethod.GET)
	@ResponseBody
	public String userNameCheck(String username){
		String result="result";
		
		logger.info("username"+username);
	
		System.out.println("입력된 username : "+username);
				
		return result;
	}
	
	// ajax로 email 체크
	@RequestMapping(value="emailCheck",method=RequestMethod.GET)
	@ResponseBody
	public String emailCheck(String email){
		String result = "result";
		
		logger.info("email:"+email);
		
		return result;
		
	}
}
