package com.mar.BVO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int board_num;
	private String user_id;
	private byte[] board_img;
	private String board_content;
	private Date board_date;
	private int like_count;
	private MultipartFile file;
	private int board_repcount;
	private String board_image;
	private String user_image;
	private String movielink;
	private int like_on;
	private String loc;
	private String board_content_tag;
	
	
	public String getBoard_content_tag() {
		return board_content_tag;
	}
	public void setBoard_content_tag(String board_content_tag) {
		this.board_content_tag = board_content_tag;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getMovielink() {
		return movielink;
	}
	public void setMovielink(String movielink) {
		this.movielink = movielink;
	}
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public byte[] getBoard_img() {
		return board_img;
	}
	public void setBoard_img(byte[] board_img) {
		this.board_img = board_img;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getBoard_repcount() {
		return board_repcount;
	}
	public void setBoard_repcount(int board_repcount) {
		this.board_repcount = board_repcount;
	}
	public String getBoard_image() {
		return board_image;
	}
	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public int getLike_on() {
		return like_on;
	}
	public void setLike_on(int like_on) {
		this.like_on = like_on;
	}

}
