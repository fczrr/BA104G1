package com.message.controller;
import java.io.*;
import java.util.*;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONException;
import org.json.JSONObject;

import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.websocket.CloseReason;

@ServerEndpoint("/MessageServlet/{myName}")
public class MessageServlet {
	
// 線程安全Set，用来存放每個客户端對應的Session。
// 与某个客户端的连接会话，需要通过它来给客户端发送数据
// 若要實現服務端與單一客戶端通信的化，可以使用Map来存放，其中Key可以為客戶標示
private static final Map<String,Session> allSessions = new HashMap();
private static final List<String> empList = new ArrayList<String>();
	// 連接建立成功時調用的方法  @param 前後端傳值
	// userSession 為與某個客戶端的連接會話，需要通過它來給客戶端發送數據
	@OnOpen
	public void onOpen(@PathParam("myName") String myName, Session userSession) throws IOException {
		allSessions.put(myName,userSession);
		System.out.println(userSession.getId() + ": 已連線");
		System.out.println(myName + ": 已連線");
		
		if(myName.substring(0,3).equals("EMP")){
			System.out.println("員工連線"+myName);
			empList.add(myName);
		}else{
			if(empList.size()!=0){
				System.out.println("會員連線"+myName);
				String empName = empList.get(0);
				JSONObject jsonobj = new JSONObject();
				try {
					jsonobj.append("receiver", empName);
					jsonobj.append("type", "firstConnect");
					System.out.println(jsonobj.toString());
					userSession.getAsyncRemote().sendText(jsonobj.toString());
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}
		}

		System.out.println(userSession.getId() + ": 已連線");
		System.out.println(myName + ": = Myname已連線");
//		userSession.getBasicRemote().sendText("WebSocket 連線成功");
	}

	// 收到客戶端消息後調用的方法 ====== @param message 客戶端發送過來的消息
	@OnMessage
	public void onMessage(Session userSession, String message, @PathParam("myName") String myName) throws JSONException {
		
		System.out.println("接收訊息");
		
		JSONObject jsonobj = new JSONObject(message);
		String receiver = (String) jsonobj.get("receiver");
		System.out.println("receiver"+receiver);
		System.out.println("message"+jsonobj.getString("message"));
		Session receiverSession  = allSessions.get(receiver);
		if(receiverSession!=null && receiverSession.isOpen()){
			receiverSession.getAsyncRemote().sendText(message);
		}
		System.out.println("發送訊息");
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
		System.out.println("離線");
		System.out.println(userSession.getId() + ": Disconnected: " + Integer.toString(reason.getCloseCode().getCode()));
	}
	
 
}
