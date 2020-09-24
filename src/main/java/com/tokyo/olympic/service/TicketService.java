package com.tokyo.olympic.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tokyo.olympic.dao.TicketDAO;
import com.tokyo.olympic.vo.CashVO;
import com.tokyo.olympic.vo.SeatVO;
import com.tokyo.olympic.vo.TicketVO;
@Service
public class TicketService {
	@Autowired
	private TicketDAO dao;
	
	public SeatVO getseatprice(SeatVO vo) {
		SeatVO seat = dao.getseatprice(vo);
		return seat;
	}

	public void refund(CashVO vo) {
	dao.refund(vo);
		
	}

	public ArrayList<TicketVO> searchseat() {
		ArrayList<TicketVO> result = dao.searchseat();
		return result;
	}

}
