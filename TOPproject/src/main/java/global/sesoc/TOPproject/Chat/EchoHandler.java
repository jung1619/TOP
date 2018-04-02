package global.sesoc.TOPproject.Chat;

import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



public class EchoHandler extends TextWebSocketHandler{
	private ArrayList<WebSocketSession> sessionList;
	private static Logger logger = Logger.getLogger(EchoHandler.class);
	
	
	
	public EchoHandler(){
		this.logger.info("create SocketHandler instance!");
		sessionList = new ArrayList<WebSocketSession>();
	}
	
	
	
	
	//클라이언트와 연결 된 후
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("접속확인");
		sessionList.add(session);//ArrayList<WebSocketSession> sessionList에 넣어줌
		session.sendMessage(new TextMessage(session.getId()));//session아이디를 session로 보냄
	}
	//웹 소켓 서버로 데이터를 전송했을 경우
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("메시지 보냄");
		super.handleTextMessage(session, message);
		for(WebSocketSession sess:sessionList){
			
			//sessionList에서 add했던 id를 꺼내고 메시지를 출력
			sess.sendMessage(new TextMessage(session.getId()+" 가 하나시마쓰 :"+message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		System.out.println("종료");
		//List삭제
		sessionList.remove(session);
		for(WebSocketSession webSocketSession : sessionList){
			if(session.getId().equals(webSocketSession.getId())){
				webSocketSession.sendMessage(new TextMessage(webSocketSession.getRemoteAddress().getHostName()+"퇴장했습니다."));
			}
		}
	}

	
	
	
}
