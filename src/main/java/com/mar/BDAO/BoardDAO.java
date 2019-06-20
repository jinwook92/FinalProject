package com.mar.BDAO;

import java.util.List;
import java.util.Map;

import com.mar.BVO.BoardVO;
import com.mar.BVO.ReplyBoardVO;

public interface BoardDAO {
	public void insert(BoardVO data);
	public List<BoardVO> boardlist(String id);
	public BoardVO imgdata(int num);
	public void delete(int num);
	public BoardVO detail(Map<String, Object> data);
	public void repwrite(Map<String, Object> data);
	public List<ReplyBoardVO> replist(int num);
	public void subdelete(int num);
	public void modify(BoardVO data);
	public Map<String, Object> like(Map<String, Object> data);

	public void chatinsertDB(Map<String, Object> map);
	public int selectreplynum(Map<String, Object> data);

}
