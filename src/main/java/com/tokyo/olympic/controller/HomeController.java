package com.tokyo.olympic.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tokyo.olympic.service.HomeService;
import com.tokyo.olympic.vo.TicketVO;

@Controller
public class HomeController {
	
	@Autowired HomeService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "gamepage", method = RequestMethod.GET)
	public String gamepage() {
		return "gamepage";
	}
		
	@RequestMapping(value = "/chatting/chatpage", method = RequestMethod.GET)
	public String chatpage(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		ArrayList<TicketVO> list = service.searchticket(userid);
		boolean flag = list.isEmpty();
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		return "/chatting/chatpage";
	}
	
	@RequestMapping(value = "/chatting/chatroom01", method = RequestMethod.GET)
	public String chatroom01(String playnum, Model model) {
		String number = null;
		if(playnum.equals("BASEBALL")){
			number = "1";
		}else if(playnum.equals("BASKETBALL")){
			number = "2";
		}
		model.addAttribute("play", number);
		return "/chatting/chatroom01";
	}
	
	@RequestMapping(value = "/chatting/chatroom02", method = RequestMethod.GET)
	public String chatroom02(String playnum, Model model) {
		String number = null;
		if(playnum.equals("BASEBALL")){
			number = "1";
		}else if(playnum.equals("BASKETBALL")){
			number = "2";
		}
		model.addAttribute("play", number);
		return "/chatting/chatroom02";
	}	
	
	@RequestMapping(value = "ticketing", method = RequestMethod.GET)
	public String playList() {
		return "tickeeting";
	}
	
	@RequestMapping(value= "playList2", method = RequestMethod.GET)
	public String play() {
		return "playList2";
	}
	
	@RequestMapping(value= "mypage", method = RequestMethod.GET)
	public String mypage() {
		return "/member/mypage";
	}
	
	@RequestMapping(value= "/contacts", method = RequestMethod.GET)
	public String contacts() {
		return "contacts";
	}
	
}
