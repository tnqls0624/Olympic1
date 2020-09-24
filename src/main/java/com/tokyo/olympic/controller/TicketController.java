package com.tokyo.olympic.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tokyo.olympic.service.TicketService;
import com.tokyo.olympic.vo.CashVO;
import com.tokyo.olympic.vo.SeatVO;
import com.tokyo.olympic.vo.TicketVO;

@Controller
@RequestMapping("/tiket")
public class TicketController {
	@Autowired
	TicketService service;
	
	@RequestMapping(value="/seatprice", method=RequestMethod.POST)
	@ResponseBody
	public SeatVO getseatprice(SeatVO vo) {
			SeatVO result = service.getseatprice(vo);
			
		return result;
	}
	
	@RequestMapping(value="/selectseat", method=RequestMethod.GET)
	public String selectseat(SeatVO vo, Model model) {
		model.addAttribute("vo" , vo);
		if(vo.getSitlevel().equals("A")) {
			return "/ticketing/tickeetinga";
		}else if(vo.getSitlevel().equals("B")) {
			return "/ticketing/tickeetingb";
		}else if(vo.getSitlevel().equals("C")) {
			return "/ticketing/tickeetingc";
		}else if(vo.getSitlevel().equals("D")) {
			return "/ticketing/tickeetingd";
		}else return "index";
	}
	
	@RequestMapping(value="/selectseat2", method=RequestMethod.GET)
	public String selectseat2(SeatVO vo, Model model) {
		model.addAttribute("vo" , vo);
		if(vo.getSitlevel().equals("A")) {
			return "/ticketing/ticketinga";
		}else if(vo.getSitlevel().equals("B")) {
			return "/ticketing/ticketingb";
		}else if(vo.getSitlevel().equals("C")) {
			return "/ticketing/ticketingc";
		}else return "index";
	}
	
	@RequestMapping(value="/seatinfo", method=RequestMethod.POST)
	@ResponseBody
	public SeatVO selectseat(SeatVO vo) {
		SeatVO result = service.getseatprice(vo);
		return result;
	}
	
	@RequestMapping(value="/searchseat", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<TicketVO> searchseat() {
		ArrayList<TicketVO> result = service.searchseat();
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/refund", method=RequestMethod.POST)
	@ResponseBody
	public void refund(CashVO vo) {
		
			service.refund(vo);
		
	}
	
}