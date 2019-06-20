package com.mar.ActService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mar.ActDAO.ActDAO;
import com.mar.ActVO.ActVO;

@Service
public class ActService {
	@Autowired
	private ActDAO dao;
	
	public void likeact(String id, int num){
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("num", num);
	    map.put("id", id);
		dao.likeact(map);
	}
	public List<ActVO> actlist(String id){
		List<ActVO> list=dao.actlist(id);
		return list;
	}
	
	public void replyact(int num, String repid, int replynum) {
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("replynum", replynum);
		map.put("num", num);
	    map.put("repid", repid);
	    dao.replyact(map);
	}
	
	public void followact(String sendid, String getid) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("sendid", sendid);
		 map.put("getid", getid);
		 dao.followact(map);
	}
	
	public void replydelete(int num) {
		
	    System.out.println("로그삭제2");
	    dao.replogdelete(num);
	}
	
	public void followlogdelete(String sendid, String getid) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("sendid", sendid);
		 map.put("getid", getid);
		dao.followlogdelete(map);
	}
	
	public void likelogdelete(String id, int num) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("id", id);
		 map.put("boardnum", num);
		dao.likelogdelete(map);
	}
	
	
}
