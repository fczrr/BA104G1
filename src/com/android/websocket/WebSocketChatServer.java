package com.android.websocket;

import java.io.*;
import org.apache.commons.codec.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.websocket.CloseReason;

@ServerEndpoint("/WebSocketChatServer/{userName}")
public class WebSocketChatServer {
	
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();

	private static final Gson gson = new Gson();
	
	private void sendNotify(String userName){
		//通知
		String userType = userName.substring(0, 3);
		System.out.println(userType);
		List<EmpServiceDetailVO> list = null;
		Set<String> users = sessionsMap.keySet();
		EmpServiceDetailSvc detailSvc = new EmpServiceDetailSvc();
		
		if ("EMP".equals(userType)) {
			list = detailSvc.getByEmpNo(userName);
			
System.out.println("找到筆聊天記錄:"+list.size());
			
			if(list!=null && !list.isEmpty()){
				for(EmpServiceDetailVO empServiceDetailVO:list){
					if(users.contains(empServiceDetailVO.getMemNo())){
						
System.out.println("正在線上的對象:"+empServiceDetailVO.getMemNo());
						
						Session session  = sessionsMap.get(empServiceDetailVO.getMemNo());
						if(session.isOpen()){
							session.getAsyncRemote().sendText("");
						}
					}
				}
			}
			
		} else if ("MEM".equals(userType)) {
			list = detailSvc.getByMemNo(userName);
			
System.out.println("找到筆聊天記錄:"+list.size());

			if(list!=null && !list.isEmpty()){
				for(EmpServiceDetailVO empServiceDetailVO:list){
					if(users.contains(empServiceDetailVO.getEmpNo())){
						
System.out.println("正在線上的對象:"+empServiceDetailVO.getEmpNo());

						Session session  = sessionsMap.get(empServiceDetailVO.getEmpNo());
						if(session.isOpen()){
							session.getAsyncRemote().sendText("");
						}
					}
				}
			}
		}
	}
	

	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {
		sessionsMap.put(userName, userSession);
		
		sendNotify(userName);
		
		System.out.println("Session id:"+userSession.getId()+"  UserName:"+userName+"已經連線");
	}
	

	@OnMessage
	public void onMessage(Session userSession, String message) {
		MyChatMessage chatMessage = gson.fromJson(message, MyChatMessage.class);
		
		System.out.println(gson.toJson(chatMessage));
		
		if("getToken".equals(chatMessage.getType())){
			
			String token = GenerateToken.getToken(chatMessage.getSender());
			MyChatMessage tokenMessage = new MyChatMessage("receiveToken",chatMessage.getSender(),chatMessage.getReceiver(),token);
			userSession.getAsyncRemote().sendText(gson.toJson(tokenMessage));
			System.out.println("Message received: " + gson.toJson(tokenMessage));
			return;
		}
		String receiver = chatMessage.getReceiver();
		Session receiverSession = sessionsMap.get(receiver);
		if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		String userNameClose = null;
		Set<String> userNames = sessionsMap.keySet();
		for (String userName : userNames) {
			if (sessionsMap.get(userName).equals(userSession)) {
				userNameClose = userName;
				sessionsMap.remove(userName);
				break;
			}
		}

		if (userNameClose != null) {
			StateMessage stateMessage = new StateMessage("close", userNameClose, userNames);
			String stateMessageJson = gson.toJson(stateMessage);
			Collection<Session> sessions = sessionsMap.values();
			for (Session session : sessions) {
				session.getAsyncRemote().sendText(stateMessageJson);
			}
		}

		
	}
}
