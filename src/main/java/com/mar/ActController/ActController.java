package com.mar.ActController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mar.ActService.ActService;
import com.mar.ActVO.ActVO;
import com.mar.BVO.BoardVO;

@Controller
public class ActController {
	@Autowired
	private ActService actservice;
	
	@RequestMapping(value = "/actlist", method = RequestMethod.GET)
	public String imageList(HttpServletRequest req, ActVO actVO, Model model) {
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("session_id");
		List<ActVO> actlist= actservice.actlist(id);

		//model.addAttribute("list", list);
		model.addAttribute("actlist", actlist);

		return "main/block/actlog";

	}
}
