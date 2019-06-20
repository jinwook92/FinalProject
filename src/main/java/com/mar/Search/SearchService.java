package com.mar.Search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mar.UVO.UserVO;

@Service
public class SearchService {

 @Autowired
 private SearchDAO dao;

 public List<SearchVO> getResult(String search) {
  
  return dao.getResult(search);
 }

public List<UserVO> getResult2(String search) {
	// TODO Auto-generated method stub
	return dao.getResult2(search);
}

}
