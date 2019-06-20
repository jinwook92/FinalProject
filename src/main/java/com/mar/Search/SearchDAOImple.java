package com.mar.Search;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mar.UVO.UserVO;

@Repository
public class SearchDAOImple implements SearchDAO {

 @Autowired
 private SqlSessionTemplate session;

 @Override
 public List<SearchVO> getResult(String search) {
	 List<SearchVO> list = session.selectList("searchboard", search);
  return list;
 }

@Override
public List<UserVO> getResult2(String search) {
	List<UserVO> list = session.selectList("searchuser", search);
	return list;
}

}
