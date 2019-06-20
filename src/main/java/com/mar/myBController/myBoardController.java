package com.mar.myBController;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mar.myBService.myBoardService;
import com.mar.BVO.BoardVO;
import com.mar.UVO.UserVO;
import com.mar.email.MailService;

@Controller
public class myBoardController {
 
	@Autowired
	private myBoardService service;
	@Autowired
	private MailService mailService;


	@RequestMapping("/test")
	public String test(){
		return "myBoard/test";
	}

	@RequestMapping("/myBoardList")
	public String myBoardList(HttpServletRequest request,Model model/*, FollowVO fvo, SessionAttribute attr*/){

		/*String sessionID=attr.name();*/
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("session_id");
		
		UserVO myinfolist=service.myInfoList(id);
		List<BoardVO> myboardlist= service.myBoardList(id);

		int follow=service.countFollow(id);
		int follower=service.countFollower(id);
		
		List<UserVO> frlist=service.frlist(id);
		model.addAttribute("frlist", frlist);
		
		model.addAttribute("myinfolist", myinfolist);
		model.addAttribute("follow", follow);
		model.addAttribute("follower", follower);
		model.addAttribute("myboardlist", myboardlist);
       
       return "myBoard/myBoardList";
    }
	@RequestMapping("/myInfoModi")
	public String myInfoModi(HttpServletRequest request, Model model){
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("session_id");
		
		UserVO myinfolist=service.myInfoList(id);
		model.addAttribute("myinfolist", myinfolist);
		
		return "myBoard/myInfoModi";
	}
	@RequestMapping("/myInfoModiOk")
	public String myInfoModiOk(@ModelAttribute("myinfolist") UserVO vo, Errors error,MultipartHttpServletRequest multireq, @RequestParam("UImg") MultipartFile UImg){
		
		if(error.hasErrors()){
			System.out.println(error.getObjectName()+"!!!!");
			return "redirect:myInfoModi";
		}
		else{
			OutputStream out=null;
			try{
				String fname=UImg.getOriginalFilename();
				byte[] bytes=UImg.getBytes();			  
				String path="resources/upload/"+fname;
				String uploadPath=multireq.getSession().getServletContext().getRealPath("/"+path);				   
				File file=new File(uploadPath);
				out=new FileOutputStream(file);
				out.write(bytes);
				vo.setUser_image(path);
			}catch(IOException e){
				System.out.println(e);
			}finally{
				if(out!=null)try{out.close();}catch(IOException e){}
			} 
			service.myinfomodi(vo);
			return "redirect:/myBoardList";
		}
		
	}
	@RequestMapping("/myInfoDel")
	public String myinfoDel(){
		return "myBoard/myInfoDel";
	}
	@RequestMapping("/myInfoDelOk")
	public String myInfoDelOk(HttpServletRequest request, @RequestParam("userpwd") String pwd ){
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("session_id");
		
		int check=service.myinfoDel(id, pwd);
		
		if(check==1){
			session.removeAttribute("session_id");
			return "redirect:/login";
		}else{
			System.out.println("회원삭제실패");
			return "redirect:/myInfoDel";
		}
	}
	
	@RequestMapping("/findPwd")
	public String FindmyPwd(){
		return "myBoard/findPwd";
	}
	
	// 비밀번호 찾기

    @RequestMapping("/sendMail")
    public String sendMailPassword(@RequestParam("uid") String id, @RequestParam("uemail") String email, HttpServletRequest request) {

        UserVO user = service.FindAccount(email);

        if (user != null) {

            if (!user.getUser_id().equals(id)) {

               request.setAttribute("resultMsg", "0");

                return "myBoard/findPwd";

            }

            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999

            String ranpwd = String.valueOf(ran);
            user.setUser_pwd(ranpwd);
            
            service.updateInfo(user);// 해당 유저의 DB정보 변경

            String subject = "임시 비밀번호 발급 안내 입니다.";

            StringBuilder sb = new StringBuilder();

            sb.append("귀하의 임시 비밀번호는 " + ranpwd + " 입니다.");

            mailService.send(subject, sb.toString(), "guemse265@gmail.com", email);

            //request.setAttribute("resultMsg", "-1");
            
            return "myBoard/findPwdOk";

        } else {

        	 request.setAttribute("resultMsg", "1");
            return "myBoard/findPwd";
        }

        

    }

	
}
