package com.tokyo.olympic.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tokyo.olympic.dao.ChatDAO;
import com.tokyo.olympic.vo.AthleteVO;

@Service
public class ChatService {

	@Autowired
	private ChatDAO dao;
	
	public ArrayList<AthleteVO> loadath(String playnum) {
		ArrayList<AthleteVO> list = dao.loadath(playnum);
		
		for (AthleteVO athleteVO : list) {
			String name = athleteVO.getAthlete().replace(" ", "-");
			athleteVO.setBname(name);
		}
		return list;
	}

	public HashMap<String, String> loadsite(String bname, HashMap<String, String> map, String playnum) {
		
		if(playnum.equals("1")){
			
			String url = "https://www.worldbaseballclassic.com/teams/kor";
			Document doc = null;
			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Elements all = doc.getAllElements();
			String name = bname;
			String born = doc.select("td:contains(" + name +")").next().next().next().next().text();
			String country = doc.getElementsByClass("team-name").text();
			String img = doc.select("td:contains(" + name +")").prev().select("img").attr("data-original");
			map.put("sport", "Baseball");
			map.put("country", country);
			map.put("born", born);
			map.put("img", img);
			
		}else{
			String url = "https://www.olympic.org/" + bname.replace(" ", "-");
			Document doc = null;
			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Elements all = doc.getAllElements();
			String img = doc.select("article.profile-box > picture.image > img").attr("srcset");
			String profile = doc.select("section.id-card").text();
			
			int sportstart = profile.indexOf("Sport") + 6;
			int sportend = profile.indexOf("Country");
			String sport = profile.substring(sportstart,sportend);
			
			int countrystart = profile.indexOf("Country") + 8;
			int countryend = profile.indexOf("Born");
			String country = profile.substring(countrystart,countryend);
			
			int bornstart = profile.indexOf("Born") + 5;
			int bornend = profile.indexOf("Olympic");
			
			if(bornend < 0) bornend = profile.indexOf("Games");
			String born = profile.substring(bornstart,bornend);
			
			map.put("sport", sport);
			map.put("country", country);
			map.put("born", born);
			map.put("img", img);
		}
		
		return map;
	}

}
