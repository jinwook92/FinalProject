package com.mar.UDAO;

import com.mar.UVO.UserVO;

public interface UserDAO {
	public boolean userCheck(String id, String pwd);
	public int userJoin(UserVO data);
	public UserVO dupliID(String id);
}
