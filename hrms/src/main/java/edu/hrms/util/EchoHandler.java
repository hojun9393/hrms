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
	//�α��� �� �ο� ��ü
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1�� �� ���
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//Ŭ���̾�Ʈ�� ������ ����
		logger.info("Socket ����");
		sessions.add(session);
		logger.info(currentUserName(session));//���� ������ ���
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// �޽���
		logger.info("ssesion"+currentUserName(session));
		String msg = message.getPayload();//�ڹٽ�ũ��Ʈ���� �Ѿ�� Msg
		logger.info("msg="+msg);
		
		if(!StringUtils.isEmpty(msg)) {
			logger.info("if�� ����?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 6) {
				String type = strs[0];
				String signType = strs[1];
				String writerUserid = strs[2];
				String signUserid = strs[3];
				String contentNo = strs[4];
				String content = strs[5];
				logger.info("length ����?"+type);
				System.out.println(writerUserid+""+signUserid);
				WebSocketSession writerSession = userSessionsMap.get(writerUserid);
				WebSocketSession signUserSession = userSessionsMap.get(signUserid);
				logger.info("writerSession="+userSessionsMap.get(writerUserid));
				logger.info("writerSession"+writerSession);
				
				//���
				if ("doc".equals(type) && writerSession != null) {
					logger.info("onmessage�ǳ�?");
					TextMessage tmpMsg = new TextMessage(signUserid + "���� "
							+ content+" �� ���� �߽��ϴ�.</a>"
							+ "<a class='dropdown-item d-flex align-items-center' href='/controller/docu/view.do?docNo=47' onclick='alarmReadNavFn(52,this)'>"
							+ "	<div class='mr-3'>"
							+ "		<div class='icon-circle bg-success'>"
							+ "			<i class='fas fa-file-alt text-white'></i>	"
							+ "		</div>"
							+ "	</div>"
							+ "	<div>"
							+ "		<div class='small text-gray-500'>2024-04-11 16:11:33</div>"
							+ "		<span class='font-weight-bold'>"
							+ "			[���]"
							+ "			asdf...�� <br>"
							+ "			<span class='d-inline text-success text-center font-weight-bold'>����</span>�Ǿ����ϴ�."
							+ "		</span>"
							+ "	</div>"
							+ "</a>");
						
					writerSession.sendMessage(tmpMsg);
				}
				
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//���� ����
		logger.info("Socket ����");
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