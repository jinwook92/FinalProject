package com.mar.BService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mar.BDAO.BoardDAO;
import com.mar.BVO.BoardVO;
import com.mar.BVO.ReplyBoardVO;


@Service
public class BoardService {
	
	@Resource(name="boardDAO")
	private BoardDAO dao;
	
	public BoardVO insert(BoardVO data) {
		dao.insert(data);
		return data;
	}
	
	public List<BoardVO> boardlist(String id) {
		// TODO Auto-generated method stub
		List<BoardVO> list = dao.boardlist(id);
		return list;
	}
	public BoardVO getimage(int num) {
		BoardVO data=dao.imgdata(num);
		return data;
	}
	
	public void delete(int num) {
		dao.delete(num);
	}
	
	public BoardVO detail(int num, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		BoardVO data=dao.detail(map);
		return data;	
	}
	
	public void repwrite(int num, String repid ,String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("repid", repid);
		map.put("content", content);
		dao.repwrite(map);
	}
	public void chatinsertDB(String user_id, String with_id, String content) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id",user_id);
		map.put("with_id", with_id);
		map.put("content", content);
		dao.chatinsertDB(map);
		
	}
	public List<ReplyBoardVO> replist(int num) {
		List<ReplyBoardVO> list=dao.replist(num);
		return list;
	}
	
	public void subdelete(int num) {
		dao.subdelete(num);
	}
	
	
	public BoardVO modify(BoardVO data) {
		System.out.println("service");
		dao.modify(data);
		return data;
	}
	
	public Map<String,Object> like(int num, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		Map<String, Object> result = new HashMap<String, Object>();
		result=dao.like(map);
		return result;
	}

	
	
	public int selectreplynum(int num, String repid ,String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("repid", repid);
		map.put("content", content);
		int replynum=dao.selectreplynum(map);
		return replynum;
		
	}
	
	
	
}
