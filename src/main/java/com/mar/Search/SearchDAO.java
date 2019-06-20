package com.mar.Search;

import java.util.List;

import com.mar.UVO.UserVO;

public interface SearchDAO {

 List<SearchVO> getResult(String search);

List<UserVO> getResult2(String search);
}
