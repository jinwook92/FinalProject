package com.mar.UController;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mar.UService.UserService;
import com.mar.UVO.UserVO;
@Controller
public class UserController {
	
	static final List<String> UserList = Collections.synchronizedList(new ArrayList<String>()); 
			
	@Autowired
	UserService service;
  
	@RequestMapping("/login")
	public String login(UserVO vo){       
		return "main/login"; 
	} 
	@RequestMapping("/loginOK")
	public String loginOK(@Validated UserVO vo, Errors error, HttpServletRequest request){
		
		int tt = 0;
		if(error.hasErrors()){
			return "redirect:login";
		}else{
			String id=vo.getUser_id();
			String pwd=vo.getUser_pwd();
			if(id!=null && pwd!=null){
				boolean result= service.userCheck(id, pwd);
				
				HttpSession session=request.getSession();
				
				if(result){
					
					for(int i=0;i<UserList.size();i++){
						if(UserList.get(i)==id){
						tt=1;	
						}
					}
					if(tt==0)UserList.add(id);
					UserList.add(id);
					session.setAttribute("session_id", id);
					session.setAttribute("UserList", UserList);
					return "redirect:list";
				}
				return "redirect:login";
			}
			return "redirect:login";
		}      
	}
	@RequestMapping("joinOK")
	public String joinOK(@Validated UserVO data, Errors error, HttpServletRequest req,
			Model model,@RequestParam("UImg") MultipartFile UImg){
		if(error.hasErrors()){
			return "redirect:login";
		}else{
			OutputStream out=null;
			try{
				String fname=UImg.getOriginalFilename();
				System.out.println(fname);
				byte[] bytes=UImg.getBytes();  
				
				String path="resources/upload/"+fname;
				if(UImg.isEmpty()){
					path="resources/images/user.png";
				}
				String uploadPath=req.getSession().getServletContext().getRealPath("/"+path);               
				File file=new File(uploadPath);
				out=new FileOutputStream(file);
				out.write(bytes);
				data.setUser_image(path);
			}catch(IOException e){
				System.out.println(e);
			}finally{
				if(out!=null)try{out.close();}catch(IOException e){}
			} 
			int result=service.userJoin(data);
			if(result==1)
				return "redirect:login";
			else return "redirect:login";
		}
	}
	@RequestMapping("dupliID/{id}")
	public @ResponseBody String checkID(@PathVariable String id){
		UserVO vo=service.dupliID(id);
		String result="";
		if(vo==null || vo.getUser_id()==null || vo.getUser_id().equals(""))
			result="";
		else
			result=vo.getUser_id();
		return result;
	}
	

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		
		return "redirect:login";
	}

	
}