package com.mar.Search;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mar.UVO.UserVO;

@Controller
public class SearchController {
 @Autowired
 private SearchService service;

 @RequestMapping(value = "search" , method = RequestMethod.GET)
 public String search(Model model, @RequestParam(value = "s")String search , HttpServletResponse response)throws IOException, SerialException, SQLException {
  List<SearchVO> boarddata = service.getResult(search);
  List<UserVO> userdata = service.getResult2(search);
  model.addAttribute("data", boarddata);
  model.addAttribute("data2", userdata);
  return "search/list";
 }
}
