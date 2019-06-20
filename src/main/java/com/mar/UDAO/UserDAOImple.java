package com.mar.UDAO;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mar.UVO.UserVO;

@Repository
public class UserDAOImple implements UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public boolean userCheck(String id, String pwd) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		 
	    String checkid=sqlSession.selectOne("checkid", map);   
	    boolean result=false;
	     
	    if(checkid!=null) result=true;
		
	    return result;
	}

	@Override
	public int userJoin(UserVO data) {
		String user_email=data.getMail1()+"@"+data.getMail2();
		data.setUser_email(user_email);
		return sqlSession.insert("userJoin",data);
	}

	@Override
	public UserVO dupliID(String id) {
		UserVO vo=sqlSession.selectOne("dupliID",id);
		return vo;
	}
}
