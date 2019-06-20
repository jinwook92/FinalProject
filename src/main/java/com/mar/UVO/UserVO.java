package com.mar.UVO;

import org.hibernate.validator.constraints.NotEmpty;

public class UserVO {
	@NotEmpty(message="아이디를 입력하세요.")
	private String user_id;
	@NotEmpty(message="패스워드를 입력하세요.")
	private String user_pwd;
	private String user_pwd2;
	private String user_salt;
	private String user_name;
	private String USER_IMAGE;
	private String user_gen;
	private String user_intro;
	private String mail1;
	private String mail2;
	private String user_email;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getMail1() {
		return mail1;
	}
	public void setMail1(String mail1) {
		this.mail1 = mail1;
	}
	public String getMail2() {
		return mail2;
	}
	public void setMail2(String mail2) {
		this.mail2 = mail2;
	}
	public String getUSER_IMAGE() {
		return USER_IMAGE;
	}
	public void setUSER_IMAGE(String uSER_IMAGE) {
		USER_IMAGE = uSER_IMAGE;
	}
	public String getUser_pwd2() {
		return user_pwd2;
	}
	public void setUser_pwd2(String user_pwd2) {
		this.user_pwd2 = user_pwd2;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_salt() {
		return user_salt;
	}
	public void setUser_salt(String user_salt) {
		this.user_salt = user_salt;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUser_image() {
		return USER_IMAGE;
	}
	public void setUser_image(String user_image) {
		this.USER_IMAGE = user_image;
	}
	public String getUser_gen() {
		return user_gen;
	}
	public void setUser_gen(String user_gen) {
		this.user_gen = user_gen;
	}
	public String getUser_intro() {
		return user_intro;
	}
	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}	
}
