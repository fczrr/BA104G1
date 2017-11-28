package com.message.controller;
import java.io.*;
import java.util.*;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.websocket.CloseReason;

@ServerEndpoint("/MessageServlet/{myName}/{myRoom}")
public class MessageServlet {

// 與某個客戶端的連接會話，需要通過Session來給客戶端發送訊息

private static final Set<Session> allSessions = Collections.synchronizedSet(new HashSet<Session>()); //線程安全Set，用來存放每個客戶端對應的Session
private static final List<String> names = Collections.synchronizedList(new ArrayList<String>()); // 儲存上線聯繫人名字

//每个用户对应多个终端，多个终端用Set来记录，用户使用Map来记录，
private static final Map<String, Set<Session>> sessionMap = Collections.synchronizedMap(new HashMap<String, Set<Session>>());
//若要實現服務端與單一客戶端通信的化，可以使用Map来存放，其中Key可以為客戶標示，將聯繫人與Session同時保存
private static final Map<String, Session> sessionUsername = Collections.synchronizedMap(new HashMap<String, Session>());

private Session session;
private String userName;
	
	// 連接建立成功時調用的方法  @param 前後端傳值
	// userSession 為與某個客戶端的連接會話，需要通過它來給客戶端發送數據
	@OnOpen
	public void onOpen(@PathParam("userName") String userName, @PathParam("myRoom") String myRoom, Session userSession) throws IOException {
		
		allSessions.add(userSession);
		System.out.println(userSession.getId() + ": 已連線");
		System.out.println(userName + ": 已連線");
		System.out.println(myRoom + ": 房號");
//		userSession.getBasicRemote().sendText("WebSocket 連線成功");
		
		// 这块会实现自己业务，比如，当用户登录后，会把离线消息推送给用户
		// TextMessage returnMessage = new TextMessage("你将收到的离线");
		// session.sendMessage(returnMessage);
	}

	// 收到客戶端消息後調用的方法 ====== @param message 客戶端發送過來的消息
	@OnMessage
	public void onMessage(Session userSession, String message) {
//		JSONObject jsonTo = JSONObject.fromObject(message);
//		if (!jsonTo.get("To").equals("All")){
//			sendMessageTo("给一个人", jsonTo.get("To").toString());
//		}else{
//			sendMessageAll("给所有人");
//		}
//		
		for (Session session : allSessions) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}
	
	
	// 發生錯誤時調用  @param session & @param error
	@OnError
	public void onError(Session userSession, Throwable e){
//		e.printStackTrace();
	}
	
	
	// 連線關閉調用的方法
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		allSessions.remove(userSession);
		System.out.println(userSession.getId() + ": Disconnected: " + Integer.toString(reason.getCloseCode().getCode()));
	}
	
	
//	public void sendMessageTo(String message, String To) throws IOException {
//		// session.getBasicRemote().sendText(message);
//		//session.getAsyncRemote().sendText(message);
//		for (WebSocket item : clients.values()) {
//			if (item.username.equals(To) )
//				item.session.getAsyncRemote().sendText(message);
//		}
//	}
//	
//	public void sendMessageAll(String message) throws IOException {
//		for (WebSocket item : clients.values()) {
//			item.session.getAsyncRemote().sendText(message);
//		}
//	}
	
 
}
