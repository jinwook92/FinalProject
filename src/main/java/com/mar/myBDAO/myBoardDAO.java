package com.mar.myBDAO;

import java.util.List;
import java.util.Map;

import com.mar.BVO.BoardVO;
import com.mar.UVO.UserVO;
import com.mar.chatVO.ChatVO;

public interface myBoardDAO {
	public UserVO myInfoList(String id);
	
	public void myInfoModi(UserVO vo);
	
	public int countFollow(String id);
	
	public int countFollower(String id);
	
	public List<BoardVO> myboardList(String id);

	public List<UserVO> dualfollower(String id);

	public List<ChatVO> getChatList(Map<String, Object> map);

	public int myInfoDel(String id, String pwd);
	
	public UserVO FindAccount(String email);
	public void updateInfo(UserVO vo);

	public List<UserVO> frlist(String id);
	
}
