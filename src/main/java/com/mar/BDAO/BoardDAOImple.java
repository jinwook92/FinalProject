package com.mar.BDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mar.BDAO.BoardDAO;
import com.mar.BVO.BoardVO;
import com.mar.BVO.ReplyBoardVO;

/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")*/
@Repository(value = "boardDAO")
public class BoardDAOImple implements BoardDAO {

	@Resource(name = "sqlsession")
	private SqlSessionTemplate sqlsession;

	@Override
	public void insert(BoardVO data) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.insert(data);
	}

	@Override
	public List<BoardVO> boardlist(String id) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		List<BoardVO> list = dao.boardlist(id);
		return list;
	}

	@Override
	public BoardVO imgdata(int num) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		BoardVO data = dao.imgdata(num);
		System.out.println("imple");
		return data;
	}

	@Override
	public void delete(int num) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.delete(num);
	}

	@Override
	public BoardVO detail(Map<String, Object> data) {
		BoardVO vo = sqlsession.selectOne("detail", data);
		return vo;
	}

	@Override
	public void repwrite(Map<String, Object> data) {
		sqlsession.insert("repwrite", data);
	}
	@Override
	public void chatinsertDB(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlsession.insert("chatinsertDB",map);
	}
	@Override
	public List<ReplyBoardVO> replist(int num) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		List<ReplyBoardVO> list = dao.replist(num);
		return list;
	}

	@Override
	public void subdelete(int num) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.subdelete(num);
	}

	@Override
	public void modify(BoardVO data) {
		int result = 0;
		result = sqlsession.update("modify", data);
		System.out.println(result);
	}

	@Override
	public Map<String, Object> like(Map<String, Object> data) {	
	    int check=sqlsession.selectOne("checkLike", data);
	    int allcount=sqlsession.selectOne("alllike",data);
	   
	    Map<String, Object> map=new HashMap<String, Object>();
	    map.put("check", check);
		if(check==0 ){
			sqlsession.insert("like",data);
			allcount=sqlsession.selectOne("alllike",data);
			map.put("allcount", allcount);			
		}else{ 
			sqlsession.delete("dellike",data);
			allcount=sqlsession.selectOne("alllike",data);
			map.put("allcount", allcount);		
		}		
		return map;
	}


	@Override
	public int selectreplynum(Map<String, Object> data) {
		int replynum=sqlsession.selectOne("selectreplynum", data);
		
		return replynum;
	}
	
	
	
	
	
	
}
