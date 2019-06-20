package com.mar.Follow;

import java.util.List;
import java.util.Map;

import com.mar.UVO.UserVO;
import com.mar.myBVO.FollowVO;

public interface FollowDAO {

 void follow(String id, String getid);

 List<FollowVO> getFollow(String id);

 List<FollowVO> getFollower(String id);

String checkFollow(String sendid, String getid);

void delFollow(String sendid, String getid);

List<UserVO> getfollowdata(String id);

List<UserVO> getfollowerdata(String id);

}
