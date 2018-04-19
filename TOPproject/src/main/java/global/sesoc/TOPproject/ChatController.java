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
import global.sesoc.TOPproject.VO.Context;
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
	
	@MessageMapping("/chat/{p_num}/context")
	@SendTo("/subscribe/chat/{p_num}/context")
	public Context sendContext(@DestinationVariable("p_num") String p_num,Context context){
		
		logger.info("context시작");
		context.setP_num(p_num);
		logger.info("chatcotroller에서 받음+p_num추가: "+context);
		
		
		if(projectDAO.selectContext(p_num)==null){
			
			logger.info("DB에 존재 하지 않을 경우");
			//임시 제목
			context.setTitle("title");
			logger.info("new context="+context);
			
			//context가 없을 경우 생성 
			projectDAO.insertContext(context);
			
			
		}else{
			//context가 있으면 update함 
			logger.info("DB에 존재하는 경우");
			projectDAO.upDateContext(context);
		}
		
		//여기서 저장한것을 다시 불러옴 context를 새롭게 불러온겁니다.
		logger.info("selectContext parameter P_num in ChatController = "+p_num);
		context = projectDAO.selectContext(p_num);
		
		return context;
	}
	
	
	
	
	
}
