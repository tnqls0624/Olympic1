package com.tokyo.olympic.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tokyo.olympic.vo.CashVO;
import com.tokyo.olympic.vo.SeatVO;
import com.tokyo.olympic.vo.TicketVO;

@Repository
public class TicketDAO {
	@Autowired
	private SqlSession session;

	public SeatVO getseatprice(SeatVO vo) {
		TicketMapper mapper = session.getMapper(TicketMapper.class);
		System.out.println(vo);
		System.out.println(mapper.getseatprice(vo));
		return mapper.getseatprice(vo);
	}

	public void refund(CashVO vo) {
		TicketMapper mapper = session.getMapper(TicketMapper.class);
		mapper.refund(vo);
	}

	public ArrayList<TicketVO> searchseat() {
		TicketMapper mapper = session.getMapper(TicketMapper.class);
		return mapper.searchseat();
	}
}
