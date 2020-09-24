package com.tokyo.olympic.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tokyo.olympic.vo.PlayVO;
import com.tokyo.olympic.vo.TicketVO;
import com.tokyo.olympic.vo.UserVO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSession session;

	public void signup(UserVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		mapper.signup(vo);
	}

	public UserVO login(UserVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		 return mapper.login(vo);
	}

	public void amount(UserVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		 mapper.amount(vo);
	}

	public UserVO information(UserVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.information(vo);
		
	}

	public void tiket(UserVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		 mapper.tiket(vo);
		
	}

	public void info(UserVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		mapper.info(vo);
	}

	public ArrayList<TicketVO> myticket(TicketVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.myticket(vo);
	}

	public UserVO loaduserinfo(String userid) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.loaduserinfo(userid);
	}

	public ArrayList<TicketVO> ticketinfo(String userid) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.ticketinfo(userid) ;
	}



	public void naverinsert(UserVO vo) {
		System.out.println("1");
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		 mapper.naverinsert(vo) ;
	}

	public UserVO naverselect(UserVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return  mapper.naverselect(vo) ;
	}

	public void insertticket(TicketVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		mapper.insertticket(vo);
	}

	public void amount2(UserVO voo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		 mapper.amount2(voo);
	}

	public UserVO login1(UserVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		 return mapper.login1(vo);
	}

	public ArrayList<PlayVO> playinffo() {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.playinffo();
	}

	
}
