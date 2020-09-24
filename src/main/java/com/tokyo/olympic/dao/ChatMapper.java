package com.tokyo.olympic.dao;

import java.util.ArrayList;

import com.tokyo.olympic.vo.AthleteVO;

public interface ChatMapper {

	public ArrayList<AthleteVO> loadath(String playnum);

}
