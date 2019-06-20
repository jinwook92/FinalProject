package com.mar.chatVO;

import java.sql.Date;

public class ChatVO {

private String chat_sender;
private String chat_receiver;
private String chat_content;
private Date chat_date;
public String getChat_sender() {
	return chat_sender;
}
public void setChat_sender(String chat_sender) {
	this.chat_sender = chat_sender;
}
public String getChat_receiver() {
	return chat_receiver;
}
public void setChat_receiver(String chat_receiver) {
	this.chat_receiver = chat_receiver;
}
public String getChat_content() {
	return chat_content;
}
public void setChat_content(String chat_content) {
	this.chat_content = chat_content;
}
public Date getChat_date() {
	return chat_date;
}
public void setChat_date(Date chat_date) {
	this.chat_date = chat_date;
}
	
}
