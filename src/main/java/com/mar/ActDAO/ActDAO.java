package com.mar.ActDAO;

import java.util.List;
import java.util.Map;

import com.mar.ActVO.ActVO;

public interface ActDAO {
	public List<ActVO> actlist(String id);
	public void likeact(Map<String, Object> data);
	public void replyact(Map<String, Object> data);
	public void followact(Map<String, Object> data);
	public void replogdelete(int num);
	public void followlogdelete(Map<String, Object> data);
	public void likelogdelete(Map<String, Object> data);
}
