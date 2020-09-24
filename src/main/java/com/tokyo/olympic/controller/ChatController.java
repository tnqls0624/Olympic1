package com.tokyo.olympic.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tokyo.olympic.service.ChatService;
import com.tokyo.olympic.vo.AthleteVO;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	
	@RequestMapping(value = "/chatting/loadath", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<AthleteVO> loadath(HttpSession session, String playnum) {
		ArrayList<AthleteVO> list = service.loadath(playnum);
		return list;
	}
	
	@RequestMapping(value = "/chatting/loadsite", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> loadsite(String bname, String playnum) {
		HashMap<String, String> map = new HashMap<>();
		map = service.loadsite(bname, map, playnum);
		return map;
	}
	
}
