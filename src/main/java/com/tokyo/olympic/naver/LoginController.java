package com.tokyo.olympic.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.tokyo.olympic.dao.MemberDAO;
import com.tokyo.olympic.vo.UserVO;

@Controller
public class LoginController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@Autowired
	MemberDAO dao;
	@RequestMapping(value = "/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		return "/member/loginForm";
	}
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state
			, HttpSession session , UserVO vo) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		System.out.println(response_obj);
		String userid = (String)response_obj.get("nickname");
		String userpw = (String)response_obj.get("id");
		String gender = (String)response_obj.get("gender");
		String email = (String)response_obj.get("email");
		String name = (String)response_obj.get("name");
		vo.setUserid(userid);
		vo.setGender(gender);
		vo.setEmail(email);
		vo.setUsername(name);
		vo.setUserpw(userpw);
		UserVO voo= dao.naverselect(vo);
		if(voo == null) {
		dao.naverinsert(vo);
		}
		session.setAttribute("userid",userid); 
		session.setAttribute("username",name);
		session.setAttribute("email",email); 
		session.setAttribute("gender",gender); 
		model.addAttribute("result", apiResult);
		return "index";
	}

}

