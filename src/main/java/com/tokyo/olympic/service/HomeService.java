package com.tokyo.olympic.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tokyo.olympic.dao.HomeDAO;
import com.tokyo.olympic.vo.TicketVO;

@Service
public class HomeService {
	
	@Autowired HomeDAO dao;

	public ArrayList<TicketVO> searchticket(String userid) {
		return dao.searchticket(userid);
	}


}
