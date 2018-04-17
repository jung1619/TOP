package global.sesoc.TOPproject;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.TOPproject.DAO.ProjectDAO;
import global.sesoc.TOPproject.VO.Message;
import global.sesoc.TOPproject.VO.User;

@Controller
public class ChatController {
		
	
	@Autowired
	ProjectDAO projectDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	//chatroom이동 
	@RequestMapping(value="chat",method=RequestMethod.GET)
	public String Chatpage(int p_num,Model model){
		model.addAttribute("p_num",p_num);
		return "view_3";
	}
	
	//메시지 주고 받기
	@MessageMapping("/chat/{p_num}")
	@SendTo("/subscribe/chat/{p_num}")
	public Message sendChatMessage(@DestinationVariable("p_num") String p_num,Message message, SimpMessageHeaderAccessor headerAccessor){
		logger.info("채팅 컨트롤러 시작");
		User user =(User)headerAccessor.getSessionAttributes().get("user");//interceptor에 있는에 가져옴
		message.setId(user.getId());
		message.setNickName(user.getNickname());
		logger.info(message.toString());
		
		
		logger.info("채팅컨트롤러 종료");
		return message;
	}
	
	
}
