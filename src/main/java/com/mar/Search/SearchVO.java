package com.mar.Search;

public class SearchVO {
	private String user_id;
	private String user_name;
	private String user_intro;
	private int board_num;
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	private String board_content;
	private String board_image;
	private String user_image;
	private String search;
	private String send_id;
	private String get_id;
	private String movielink;
	public String getMovielink() {
		return movielink;
	}
	public void setMovielink(String movielink) {
		this.movielink = movielink;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getGet_id() {
		return get_id;
	}
	public void setGet_id(String get_id) {
		this.get_id = get_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_intro() {
		return user_intro;
	}
	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
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
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
