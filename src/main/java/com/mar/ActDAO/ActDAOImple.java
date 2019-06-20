package com.mar.ActDAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mar.ActVO.ActVO;

@Repository
public class ActDAOImple implements ActDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void likeact(Map<String, Object> data) {
		sqlSession.insert("likeact", data);		
	}

	@Override
	public void replyact(Map<String, Object> data) {
		sqlSession.insert("replyact", data);
	}

	@Override
	public void followact(Map<String, Object> data) {
		// TODO Auto-generated method stub
		sqlSession.insert("followact", data);
	}

	@Override
	public List<ActVO> actlist(String id) {
		
		List<ActVO> actlist = sqlSession.selectList("actlist", id);
		return actlist;
		}

	@Override
	public void replogdelete(int num) {
		// TODO Auto-generated method stub
		System.out.println("로그삭제3");
		int result=sqlSession.delete("replogdelete", num);
		System.out.println(result);
		System.out.println("로그삭제4");
	}

	@Override
	public void followlogdelete(Map<String, Object> data) {
		sqlSession.delete("followlogdelete", data);
		
	}

	@Override
	public void likelogdelete(Map<String, Object> data) {
		// TODO Auto-generated method stub
		sqlSession.delete("likelogdelete", data);
	}	
	
	
	
	
	
	
}
