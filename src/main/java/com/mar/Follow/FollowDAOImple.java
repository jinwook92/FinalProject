package com.mar.Follow;

import java.awt.Checkbox;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mar.Search.SearchVO;
import com.mar.UVO.UserVO;
import com.mar.myBVO.FollowVO;

@Repository
public class FollowDAOImple implements FollowDAO {

	@Autowired
	private SqlSessionTemplate session;
	@Override
	public void follow(String sendid, String getid) {

		FollowVO vo = new FollowVO();
		vo.setSend_id(sendid);
		vo.setGet_id(getid);
		session.insert("dofollow", vo);

	}
	@Override
	public List<FollowVO> getFollow(String id) {
		List<FollowVO> follow = session.selectList("getfollow", id);
		return follow;
	}
	@Override
	public List<FollowVO> getFollower(String id) {
		List<FollowVO> follower = session.selectList("getfollower", id);
		return follower;
	}
	@Override
	public String checkFollow(String sendid, String getid) {
		
		FollowVO vo = new FollowVO();
		vo.setSend_id(sendid);
		vo.setGet_id(getid);
		
		String list = session.selectOne("checkfollow", vo);
		
		return list;
	}
	@Override
	public void delFollow(String sendid, String getid) {
		FollowVO vo = new FollowVO();
		vo.setSend_id(sendid);
		vo.setGet_id(getid);
		session.delete("doDelete", vo);
	}
	@Override
	public List<UserVO> getfollowdata(String id) {
		return session.selectList("getfollowdata", id);
	}
	@Override
	public List<UserVO> getfollowerdata(String id) {
		
		return session.selectList("getfollowerdata", id);
	}
}
