package com.mar.Follow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mar.UVO.UserVO;
import com.mar.myBVO.FollowVO;

@Service
public class FollowService {

	@Autowired
	private FollowDAO dao;

	public void follow(String sendid, String getid) {
		dao.follow(sendid,getid);
	}

	public List<FollowVO> getFollow(String id)
	{
		return dao.getFollow(id);
	}

	public List<FollowVO> getFollower(String id) {

		return dao.getFollower(id);
	}

	public String checkFollow(String sendid, String getid) {
	
		return dao.checkFollow(sendid,getid);
	}

	public void delFollow(String sendid, String getid) {
	 dao.delFollow(sendid,getid);
		
	}

	public List<UserVO> getfollowdata(String id) {
		
		return dao.getfollowdata(id);
	}

	public List<UserVO> getfollowerdata(String id) {

		return dao.getfollowerdata(id);
	}
}
