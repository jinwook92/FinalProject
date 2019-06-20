package com.mar.UService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mar.UDAO.UserDAO;
import com.mar.UVO.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO dao;
	
	public boolean userCheck(String id, String pwd){		
		return dao.userCheck(id, pwd);
	}
	public int userJoin(UserVO data){
		return dao.userJoin(data);
	}
	public UserVO dupliID(String id){
		return dao.dupliID(id);
	}
}
