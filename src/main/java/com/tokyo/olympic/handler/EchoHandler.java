package com.tokyo.olympic.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.ognl.JJTOgnlParserState;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	private String randomcheck;
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        sessionList.add(session);
        logger.info("{} 連結されました。", session.getId());
        
        randomcheck = UUID.randomUUID().toString();
        
        Map<String, Object> map = session.getAttributes();
    	String userid = (String)map.get("userid");
    	
    }
    /**
     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
        TextMessage message) throws Exception {
        logger.info("{}から {} 受ける", session.getId(), message.getPayload());
        for(WebSocketSession sess : sessionList){
            //sess.sendMessage(new TextMessage(session.getId() +" : "+ message.getPayload()));
        	
        	Map<String, Object> map = session.getAttributes();
        	String userid = (String)map.get("userid");
        	
        	if(message.getPayload().equals("8abdc9e7-674e-4161-b1ef-d3c3d6844da3")){
        		sess.sendMessage(new TextMessage("<div class='entrancechat'>" + userid + "様が入場しました。</div>"));
        		return;
        	}
        	if(message.getPayload().equals("3aa12a98-9ea1-4434-8a6f-fd475552d5ef")){
        		sess.sendMessage(new TextMessage("<div class='entrancechat'>" + userid + "様が退場しました。</div>"));
        		return;
        	}
        	
        	sess.sendMessage(new TextMessage(userid +" : "+ message.getPayload()));
        }
    }
    /**
     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 連結が切れました。", session.getId());
    }
}

