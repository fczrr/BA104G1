package com.carorder.controller;
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

class MemChatRoom{
	
	public static Map<String ,String> emp_room = Collections.synchronizedMap(new HashMap<>());
	public static Map<String , OrderEchoServer>emp_session = Collections.synchronizedMap(new HashMap<>());
	
}

@ServerEndpoint("/OrderEchoServer/{myName}/{myRoom}")
public class OrderEchoServer {

	private String userName;	//會員編號
	private String roomNo;		//房間號碼	
	private Session session;	//哪條連線
//private static final Set<Session> allSessions = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(@PathParam("myName") String myName, @PathParam("myRoom") String myRoom, Session userSession) throws IOException {
	
		System.out.println(userSession.getId() + ": 已連線");
		System.out.println(myName + ": 已連線");
		System.out.println(myRoom + ": 房號");

		
		this.roomNo = myRoom;
		this.session = userSession;
		MemChatRoom.emp_room.put(myName, myRoom);
		MemChatRoom.emp_session.put(myName, this);
	}

	
	@OnMessage
	public void onMessage(Session userSession, String message) {

	
	
		
		for(String loop : MemChatRoom.emp_room.keySet()){
			if(MemChatRoom.emp_room.get(loop).equals(roomNo)){
				if(MemChatRoom.emp_session.get(loop) != null && MemChatRoom.emp_session.get(loop).session.isOpen()){
					MemChatRoom.emp_session.get(loop).session.getAsyncRemote().sendText(message);
				}
			}
		}

		System.out.println("Message received: " + message);
	}
	


	@OnError
	public void onError(Session userSession, Throwable e){
		e.printStackTrace();
	}
	
	
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {

		MemChatRoom.emp_session.remove(userName);
		System.out.println(userSession.getId() + ": Disconnected: " + Integer.toString(reason.getCloseCode().getCode()));
	}

 
}

