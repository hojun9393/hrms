package edu.hrms.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import edu.hrms.vo.UserVO;

@EnableWebSocket
@Configuration
public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		logger.info("Socket 연결");
		sessions.add(session);
		logger.info(currentUserName(session));//현재 접속한 사람
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		logger.info("ssesion"+currentUserName(session));
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		logger.info("msg="+msg);
		
		if(!StringUtils.isEmpty(msg)) {
			logger.info("if문 들어옴?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 6) {
				String type = strs[0];
				String signType = strs[1];
				String writerUserid = strs[2];
				String signUserid = strs[3];
				String contentNo = strs[4];
				String content = strs[5];
				logger.info("length 성공?"+type);
				System.out.println(writerUserid+""+signUserid);
				WebSocketSession writerSession = userSessionsMap.get(writerUserid);
				WebSocketSession signUserSession = userSessionsMap.get(signUserid);
				logger.info("writerSession="+userSessionsMap.get(writerUserid));
				logger.info("writerSession"+writerSession);
				
				//댓글
				if ("doc".equals(type) && writerSession != null) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(signUserid + "님이 "
							+ content+" 을 결재 했습니다.</a>"
							+ "<a class='dropdown-item d-flex align-items-center' href='/controller/docu/view.do?docNo=47' onclick='alarmReadNavFn(52,this)'>"
							+ "	<div class='mr-3'>"
							+ "		<div class='icon-circle bg-success'>"
							+ "			<i class='fas fa-file-alt text-white'></i>	"
							+ "		</div>"
							+ "	</div>"
							+ "	<div>"
							+ "		<div class='small text-gray-500'>2024-04-11 16:11:33</div>"
							+ "		<span class='font-weight-bold'>"
							+ "			[기안]"
							+ "			asdf...가 <br>"
							+ "			<span class='d-inline text-success text-center font-weight-bold'>승인</span>되었습니다."
							+ "		</span>"
							+ "	</div>"
							+ "</a>");
						
					writerSession.sendMessage(tmpMsg);
				}
				
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO)httpSession.get("login");
		
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		
		String mid = loginUser.getUserid();
		return mid;
		
	}
	
}