package com.mar.Follow;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mar.ActService.ActService;
import com.mar.BVO.BoardVO;
import com.mar.UVO.UserVO;
import com.mar.myBService.myBoardService;
import com.mar.myBVO.FollowVO;

@Controller
public class FollowController {

	@Autowired
	private FollowService service;

	@Autowired
	private ActService actservice;
	@Autowired
	private myBoardService boardservice;

	@Autowired
	private myBoardService detailservice;

	@RequestMapping(value = "follow")
	public String follow(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		session.getAttribute("session_id");
		return "follow/blocktile/follow";
	}

	@RequestMapping(value = "follow", method = RequestMethod.GET)
	public String getfollow(Model model, @RequestParam(value = "id") String id) {
		List<FollowVO> follow = service.getFollow(id);
		model.addAttribute("follow", follow);
		List<UserVO> list = service.getfollowdata(id);
		model.addAttribute("getfollowdata", list);
		return "follow/blocktile/follow";
	}

	@RequestMapping(value = "follower", method = RequestMethod.GET)
	public String getfollower(Model model, @RequestParam(value = "id") String id) {
		List<FollowVO> follower = service.getFollower(id);
		model.addAttribute("follower", follower);

		List<UserVO> list = service.getfollowerdata(id);
		model.addAttribute("getfollowerdata", list);

		return "follow/blocktile/follower";
	}

	@RequestMapping(value = "followok", method = RequestMethod.POST)
	public String followok(HttpServletRequest request, Model model, @RequestParam(value = "id") String sendid,
			@RequestParam(value = "getid") String getid) {

		if (sendid == null) {
			return "redirect:login";
		}

		service.follow(sendid, getid);
		actservice.followact(sendid, getid);
		return "redirect:userdetail?id=" + getid;
	}

	@RequestMapping(value = "userdetail", method = RequestMethod.GET)
	public String getFollow(HttpServletRequest request, Model model, @RequestParam(value = "id") String getid) {

		HttpSession session = request.getSession();
		String sendid = (String) session.getAttribute("session_id");

		session.setAttribute("sendid", sendid);
		session.setAttribute("getid", getid);

		UserVO myinfolist = detailservice.myInfoList(getid);

		String userid = myinfolist.getUser_id();

		int follow = boardservice.countFollow(getid);
		int follower = boardservice.countFollower(getid);

		List<BoardVO> myboardlist = boardservice.myBoardList(userid);

		List<FollowVO> followlist = service.getFollow(userid);
		List<FollowVO> followerlist = service.getFollower(userid);

		String checkfollow = service.checkFollow(sendid, getid);

		model.addAttribute("checkfollow", checkfollow);
		model.addAttribute("follow", follow);
		model.addAttribute("follower", follower);
		model.addAttribute("myboardlist", myboardlist);
		model.addAttribute("followlist", followlist);
		model.addAttribute("followerlist", followerlist);
		model.addAttribute("myinfolist", myinfolist);

		if (sendid == null) {
			return "redirect:login";
		}
		if (userid.equals(sendid)) {
			return "redirect:myBoardList";
		}
		return "follow/userdetail";
	}

	@RequestMapping(value = "del", method = RequestMethod.GET)
	public String del(HttpServletRequest request, Model model, @RequestParam(value = "getid") String getid,
			@RequestParam(value = "sendid") String sendid) {
		service.delFollow(sendid, getid);
		actservice.followlogdelete(sendid, getid);
		return "redirect:/userdetail?id=" + getid;
	}

}
