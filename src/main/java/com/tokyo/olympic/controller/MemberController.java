package com.tokyo.olympic.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tokyo.olympic.dao.MemberDAO;
import com.tokyo.olympic.service.MemberService;
import com.tokyo.olympic.vo.PlayVO;
import com.tokyo.olympic.vo.SeatVO;
import com.tokyo.olympic.vo.TicketVO;
import com.tokyo.olympic.vo.UserVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired
	MemberService service;
	MemberDAO dao;

	@RequestMapping(value="/signup" , method = RequestMethod.POST)
	public String signup(UserVO vo) {
		service.signup(vo);

		return"/member/loginForm";
	}

	@RequestMapping(value="/signupForm" , method = RequestMethod.GET)
	public String signupForm() {
		return"/member/signupForm";
	}
	
	@RequestMapping(value="/mypage" , method = RequestMethod.GET)
	public String mypage() {
		return"/member/mypage";
	}
	
	@RequestMapping(value="/map1" , method = RequestMethod.GET)
	public String map1() {
		return"/payment/map1";
	}
	@RequestMapping(value="/map2" , method = RequestMethod.GET)
	public String map2() {
		return"/payment/map2";
	}
	@RequestMapping(value="/ticketting" , method = RequestMethod.GET)
	public String selectplay() {
		return"/member/ticketting";
	}

	@RequestMapping(value="/stadium1" , method = RequestMethod.GET)
	public String stadium(SeatVO vo , Model model) {
		System.out.println(vo);
		model.addAttribute("stadium", vo.getStadium());
		model.addAttribute("playdate", vo.getPlaydate());

		return"playList";
	}
	
	@RequestMapping(value="/stadium2" , method = RequestMethod.GET)
	public String stadium2(SeatVO vo , Model model) {
		System.out.println(vo);
		model.addAttribute("stadium", vo.getStadium());
		model.addAttribute("playdate", vo.getPlaydate());

		return"playList2";
	}

	@RequestMapping(value="/findidpwForm" , method = RequestMethod.GET)
	public String find() {
		return"/member/findidpwForm";
	}

	@RequestMapping(value="/loginForm" , method = RequestMethod.GET)
	public String loginForm(Model model) {
		return"/member/loginForm";

	}

	@RequestMapping(value="/infoForm" , method ={ RequestMethod.POST ,RequestMethod.GET })
	public String infoForm() {
		return"/member/infoForm";
	}

	@RequestMapping(value="/info" , method = { RequestMethod.POST ,RequestMethod.GET })
	public String info(UserVO vo) {
		service.info(vo);


		return"redirect:/";
	}


	@RequestMapping(value="/buyticket" , method = RequestMethod.GET)
	public String buyticket(TicketVO vo , Model model , HttpSession session ) {
		System.out.println(vo);
		UserVO voo = new UserVO();
		voo.setUserid(vo.getUserid());
		String userid = (String) session.getAttribute("userid");
		voo.setUserid(userid);
		UserVO result= service.login1(voo , session);
		model.addAttribute("play", vo.getPlay());
		model.addAttribute("sit", vo.getSit());
		model.addAttribute("sitlevel", vo.getSitlevel());
		model.addAttribute("amount", vo.getAmount());
		System.out.println(result);
		model.addAttribute("pay", result.getPay());
		model.addAttribute("stadium", vo.getStadium());
		model.addAttribute("playdate", vo.getPlaydate());
		return"/payment/Ticket";
	}
	@RequestMapping(value="/login" , method = { RequestMethod.POST ,RequestMethod.GET })
	@ResponseBody
	public UserVO login(UserVO vo , HttpSession session , Model model) {
		System.out.println(vo+"입렵값");
		UserVO result= service.login(vo , session);
		System.out.println(result+"로그인 테스트 규진");
		if(result!=null) {
		session.setAttribute("username", result.getUsername());
		session.setAttribute("email", result.getEmail());
		session.setAttribute("tel", result.getTel());
		session.setAttribute("userid", result.getUserid());
		session.setAttribute("pay", result.getPay());
		}
		return result;
	}

	@RequestMapping(value="/logout" , method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return"redirect:/";
	}
	@RequestMapping(value="information" , method = { RequestMethod.POST ,RequestMethod.GET })
	@ResponseBody
	public UserVO information(UserVO vo , HttpSession session) {


		UserVO result = service.information(vo);

		session.setAttribute("mypay", result.getPay());
		return result;
	}

	@RequestMapping(value="amount")
	@ResponseBody
	public void amount(UserVO vo) {
		service.amount(vo);

	}

	@RequestMapping(value="myticket" , method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ArrayList<TicketVO> myticket(TicketVO vo) {

		ArrayList<TicketVO> list = new ArrayList<TicketVO>();

		list = service.myticket(vo);
		return list;
	}

	@RequestMapping(value="tiket" , method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public void tiket(TicketVO vo , HttpSession session) {
		UserVO voo = new UserVO();
		voo.setUserid(vo.getUserid());
		voo.setPay(vo.getAmount());

		String userid = (String) session.getAttribute("userid");
		vo.setUserid(userid);
		System.out.println(vo);
		service.insertticket(vo);

		service.amount2(voo);

	}

	@RequestMapping(value="/loaduserinfo" , method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public UserVO loaduserinfo(String userid) {
		UserVO user = service.loaduserinfo(userid);
		return user;
	}

	@RequestMapping(value="/ticketinfo" , method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ArrayList<TicketVO> ticketinfo(String userid, HttpServletRequest request) {
		ArrayList<TicketVO> list  = service.ticketinfo(userid, request);
		return list;
	}

	@RequestMapping(value="/playinffo", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<PlayVO> playinffo(){
		ArrayList<PlayVO> result = service.playinffo();
		return result;
	}
	
	@RequestMapping(value="/duplicate", method = RequestMethod.GET)
	@ResponseBody
	public boolean duplicate(UserVO vo){
		UserVO user = service.information(vo);
		if(user == null) return false;
		return true;
	}

}
