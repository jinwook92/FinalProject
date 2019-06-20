package com.mar.myBService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mar.BVO.BoardVO;
import com.mar.UVO.UserVO;
import com.mar.chatVO.ChatVO;
import com.mar.myBDAO.myBoardDAO;

@Service
public class myBoardService {
	@Autowired
	private myBoardDAO dao;
	
	public UserVO myInfoList(String id){

	 UserVO myinfolist=dao.myInfoList(id);
		
		return myinfolist;
	}
	public void myinfomodi(UserVO vo){
		dao.myInfoModi(vo);
	}
	public int countFollow(String id){
		int follow=dao.countFollow(id);
		
		return follow;
	}
	public int countFollower(String id){
		int follower=dao.countFollower(id);
		
		return follower;
	}
	public List<BoardVO> myBoardList(String id){
		List<BoardVO> myboardlist=dao.myboardList(id);
		return myboardlist;
	}

	public List<UserVO> dualfollower(String id) {
		// TODO Auto-generated method stub
		List<UserVO> dualfollower=dao.dualfollower(id);
		return dualfollower;
	}
	public List<ChatVO> getCharList(String id, String withId) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("withId", withId);
		List<ChatVO> getChatList = dao.getChatList(map);
		return getChatList;
	}
	public int myinfoDel(String id, String pwd){
		int x=dao.myInfoDel(id, pwd);
		return x;
	}
	public UserVO FindAccount(String email){
		UserVO vo=dao.FindAccount(email);
		return vo;
	}
	public void updateInfo(UserVO vo){
		dao.updateInfo(vo);
	}

	public List<UserVO> frlist(String id){
		return dao.frlist(id);
	}

}
