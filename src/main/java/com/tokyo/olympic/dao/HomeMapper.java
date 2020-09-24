package com.tokyo.olympic.dao;

import java.util.ArrayList;
import java.util.List;

import com.tokyo.olympic.vo.TicketVO;


public interface HomeMapper {

	public ArrayList<TicketVO> searchticket(String userid);

}
