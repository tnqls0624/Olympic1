package com.tokyo.olympic.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tokyo.olympic.vo.TicketVO;


@Repository
public class HomeDAO {

	@Autowired SqlSession sqlSession;

	public ArrayList<TicketVO> searchticket(String userid) {
		HomeMapper mapper = sqlSession.getMapper(HomeMapper.class);
		return mapper.searchticket(userid);
	} 
	
}
