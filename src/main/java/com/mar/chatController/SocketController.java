package com.mar.chatController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mar.BService.BoardService;
import com.mar.BVO.BoardVO;
import com.mar.Follow.FollowService;
import com.mar.UVO.UserVO;
import com.mar.chatVO.ChatVO;
import com.mar.myBService.myBoardService;
import com.mar.simsimi.developer.RequestParam1;
import com.mar.simsimi.developer.SimsimiAPI;

@Controller
public class SocketController {

	@Autowired
	private myBoardService service;
	@Autowired
	private FollowService fsevice;
	@Autowired
	private myBoardService detailservice;
	@Autowired
	private BoardService Boardservice;

	@RequestMapping("/chatList")
	public String chatlist(HttpServletRequest req, BoardVO boardVO, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("session_id");
		List<String> UserList = (List<String>) session.getAttribute("UserList");
		for (int i = 0; i < UserList.size(); i++) {
			System.out.println("접속한 유저들" + UserList.get(i));

		}

		UserVO myinfolist = service.myInfoList(id);
		List<UserVO> dualfollowUser = service.dualfollower(id);
		List<BoardVO> myboardlist = service.myBoardList(id);

		int follow = service.countFollow(id);
		int follower = service.countFollower(id);

		model.addAttribute("mydualfollower", dualfollowUser);
		model.addAttribute("myinfolist", myinfolist);
		model.addAttribute("myboardlist", myboardlist);
		model.addAttribute("UserList", UserList);
		System.out.println("index.jsp 로 gogo");
		return "chatting/index";
	}

	@RequestMapping("/chatWith")
	public String chatwith(HttpServletRequest request, Model model, @RequestParam(value = "id") String withId) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_id");
		session.setAttribute("id", id);

		System.out.println("withId : " + withId);

		UserVO friendvo = detailservice.myInfoList(withId);

		UserVO myinfolist = service.myInfoList(id);
		List<UserVO> dualfollowUser = service.dualfollower(id);
		List<BoardVO> myboardlist = service.myBoardList(id);
		List<ChatVO> chatList = service.getCharList(id, withId);
		int follow = service.countFollow(id);
		int follower = service.countFollower(id);

		model.addAttribute("chatList", chatList);
		model.addAttribute("mydualfollower", dualfollowUser);
		model.addAttribute("myinfolist", myinfolist);
		model.addAttribute("myboardlist", myboardlist);

		model.addAttribute("friendvo", friendvo);

		return "chatting/chatWith";
	}

	@RequestMapping("InsertDB/{userId}/{withId}/{ddd}")
	public String chatinsertDB(HttpServletRequest req, @PathVariable String userId,
			@PathVariable(name = "withId") String withId, Model model, @PathVariable(name = "ddd") String data) {
		System.out.println("socketControlloer for DBinsert");
		System.out.println(userId + ":" + withId);
		HttpSession session = req.getSession();
		// System.out.println(content);
		/* String data =""; */
		String id = (String) session.getAttribute("session_id");

		System.out.println(data);
		Boardservice.chatinsertDB(userId, withId, data);

		return "OkOk";
	}

	
}
