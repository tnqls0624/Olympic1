package com.tokyo.olympic.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tokyo.olympic.vo.AthleteVO;

@Repository
public class ChatDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<AthleteVO> loadath(String playnum) {
		ChatMapper mapper = sqlSession.getMapper(ChatMapper.class);
		return mapper.loadath(playnum);
	}

}
