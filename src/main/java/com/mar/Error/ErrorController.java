package com.mar.Error;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController { 
	@RequestMapping(value="/error",method=RequestMethod.GET)
	public String error(HttpServletResponse res, Model model){
		res.setStatus(HttpServletResponse.SC_OK);
		return "error/error";		
	}

}
