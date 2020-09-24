package com.tokyo.olympic.dao;

import java.util.ArrayList;

import com.tokyo.olympic.vo.PlayVO;
import com.tokyo.olympic.vo.TicketVO;
import com.tokyo.olympic.vo.UserVO;

public interface MemberMapper {

	void signup(UserVO vo);

	UserVO login(UserVO vo);

	void amount(UserVO vo);

	UserVO information(UserVO vo);

	void tiket(UserVO vo);

	void info(UserVO vo);

	ArrayList<TicketVO> myticket(TicketVO vo);

	UserVO loaduserinfo(String userid);

	ArrayList<TicketVO> ticketinfo(String userid);

	void naverinsert(UserVO vo);

	UserVO naverselect(UserVO vo);

	void insertticket(TicketVO vo);

	void amount2(UserVO voo);

	UserVO login1(UserVO vo);

	ArrayList<PlayVO> playinffo();

	

}
