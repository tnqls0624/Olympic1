package com.tokyo.olympic.dao;

import java.util.ArrayList;

import com.tokyo.olympic.vo.CashVO;
import com.tokyo.olympic.vo.SeatVO;
import com.tokyo.olympic.vo.TicketVO;

public interface TicketMapper {

	SeatVO getseatprice(SeatVO vo);

	void refund(CashVO vo);

	public ArrayList<TicketVO> searchseat();
	
}
