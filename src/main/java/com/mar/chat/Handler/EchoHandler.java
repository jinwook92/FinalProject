package com.mar.chat.Handler;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{

	
	/*private final Logger logger = LogManager.getLogger(getClass());*/
	
	
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

   private List<WebSocketSession> connectedUsers;
    public EchoHandler (){
    	   super();
    
       
          this.logger.info("create SocketHandler instance!");
          connectedUsers= new ArrayList<WebSocketSession>();
    }

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		
		
		super.handleTextMessage(session, message);
		
		logger.info(session.getId()+"님이 메세지 전송"+ message.getPayload());
		System.out.println(session.getId()+"id!!!!");
		System.out.println(message.getPayload()+"load!!!!");
		for(WebSocketSession webSocketSession : connectedUsers){
			
			if(!session.getId().equals(webSocketSession)){
				webSocketSession.sendMessage(new TextMessage(message.getPayload()+","+session.getId()));
				
			}
			
		}
		
	}

	  @Override
      public void afterConnectionClosed(WebSocketSession session,
                   CloseStatus status) throws Exception {
            super.afterConnectionClosed(session, status);

            System.out.println("afterConnectionClosed");
            this.logger.info(session.getId()+" 님 접속 종료");
            connectedUsers.remove(session);
      }

      @Override
      public void afterConnectionEstablished(WebSocketSession session)
                   throws Exception {
            super.afterConnectionEstablished(session);
            System.out.println("연결되었습니다");
            System.out.println("afterConnectionEstablished");
            //sessionSet.add(session);
            this.logger.info(session.getId()+"님 접속");
            connectedUsers.add(session);
            
      }

      @Override
      public void handleMessage(WebSocketSession session,
                   WebSocketMessage<?> message) throws Exception {
            super.handleMessage(session, message);
            System.out.println("handleMessage");
            this.logger.info("receive message:"+message.toString());
            System.out.println(session+":"+message);
      }

      @Override
      public void handleTransportError(WebSocketSession session,
                   Throwable exception) throws Exception {
    	  System.out.println("handleTransportError");
            this.logger.error("web socket error!", exception);
      }

      @Override
      public boolean supportsPartialMessages() {
            this.logger.info("call method!");
            System.out.println("supportParitailMessages");
            return super.supportsPartialMessages();
      }
     
      public void sendMessage (String message){
            for (WebSocketSession session: this.sessionSet){
                   if (session.isOpen()){
                          try{
                                session.sendMessage(new TextMessage(message));
                                System.out.println("sendMessage");
                          }catch (Exception ignored){
                                this.logger.error("fail to send message!", ignored);
                          }
                   }
            }
      }


      public void afterPropertiesSet() throws Exception {

            Thread thread = new Thread(){

                   int i=0;
                   @Override
                   public void run() {
                          while (true){

                                try {
                                       sendMessage ("send message index "+i++);
                                       Thread.sleep(1000);
                                } catch (InterruptedException e) {
                                       e.printStackTrace();
                                       break;
                                }
                          }
                   }

            };

            thread.start();
      }
}
