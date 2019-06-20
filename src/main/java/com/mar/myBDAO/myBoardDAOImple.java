package com.mar.myBDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

import com.mar.BVO.BoardVO;
import com.mar.UVO.UserVO;
import com.mar.chatVO.ChatVO;

@Repository
public class myBoardDAOImple implements myBoardDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	@Autowired
	private JavaMailSender javaMailSender;

    public void setJavaMailSender(JavaMailSender javaMailSender) {

        this.javaMailSender = javaMailSender;

    }

	@Override
	public UserVO myInfoList(String id) {		
		// TODO Auto-generated method stub
		UserVO myinfolist=sqlsession.selectOne("mylist", id);
		if(myinfolist==null){
			System.out.println("null 입니다");
		}
		System.out.println("myinfo :"+myinfolist);
		System.out.println("myinfo"+myinfolist.toString());
		return myinfolist;
	}

	@Override
	public void myInfoModi(UserVO vo) {
		// TODO Auto-generated method stub
		sqlsession.update("mymodi", vo);
	}

	@Override
	public int countFollow(String id) {
		// TODO Auto-generated method stub
		int follow=sqlsession.selectOne("follow", id);
		return follow;
	}

	@Override
	public int countFollower(String id) {
		// TODO Auto-generated method stub
		int follower=sqlsession.selectOne("follower", id);
		return follower;
	}

	@Override
	public List<BoardVO> myboardList(String id) {
		// TODO Auto-generated method stub
		List<BoardVO> myboardlist=sqlsession.selectList("myboardlist", id);
		return myboardlist;
	}

	@Override
	public List<UserVO> dualfollower(String id) {
		// TODO Auto-generated method stub
		List<UserVO> dualfollower = sqlsession.selectList("dualfollower",id);
		System.out.println("myBoardDAO"+dualfollower);
		return dualfollower;
	}



	@Override
	public List<ChatVO> getChatList(Map<String, Object> data) {
		// TODO Auto-generated method stub
		List<ChatVO> list = sqlsession.selectList("getChatList",data);
		System.out.println("getCharlist - "+list);
		return list;
	}



	public int myInfoDel(String id, String pwd) {
		// TODO Auto-generated method stub
		int x = -1; //비밀번호 비교
		String dbpw=sqlsession.selectOne("DelOk", id);//db상의 비밀번호
		
		if(dbpw.equals(pwd)){
			sqlsession.delete("myDel", id);
			 x=1;//삭제 성공
		}
		else{
			x=0;
		}
		
		return x;
	}



	@Override
	public UserVO FindAccount(String email) {
		// TODO Auto-generated method stub
		UserVO vo=sqlsession.selectOne("findAccount", email);
		return vo;
	}

	@Override
	public void updateInfo(UserVO vo) {
		// TODO Auto-generated method stub
		sqlsession.update("pwUpdate", vo);
	}


	@Override
	public List<UserVO> frlist(String id) {
		List<UserVO> data=sqlsession.selectList("frlist",id);
		return data;
	}


}
