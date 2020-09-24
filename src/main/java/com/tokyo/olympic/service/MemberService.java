package com.tokyo.olympic.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.tokyo.olympic.dao.MemberDAO;
import com.tokyo.olympic.vo.PlayVO;
import com.tokyo.olympic.vo.TicketVO;
import com.tokyo.olympic.vo.UserVO;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	
	public void signup(UserVO vo) {
	dao.signup(vo);
		
	}


	public UserVO login(UserVO vo, HttpSession session) {
		if(dao.login(vo) != null) {
			session.setAttribute("userid", vo.getUserid());
		return dao.login(vo);
		}
		return null;
	}


	public void amount(UserVO vo) {
		  dao.amount(vo);
		
	}


	public UserVO information(UserVO vo) {
		return dao.information(vo);
	}


	public void tiket(UserVO vo) {
		  dao.tiket(vo);
	}


	public void info(UserVO vo) {
		dao.info(vo);
		
	}


	public ArrayList<TicketVO> myticket(TicketVO vo) {
		return dao.myticket(vo);
		
	}


	public UserVO loaduserinfo(String userid) {
		return dao.loaduserinfo(userid);
	}


	public ArrayList<TicketVO> ticketinfo(String userid, HttpServletRequest request) {
		ArrayList<TicketVO> list = dao.ticketinfo(userid);
		
		for (TicketVO ticketVO : list) {
			String pathSet = request.getSession().getServletContext().getRealPath("/");
			
			File file = null;
			String filepath0 = "C:/Users/kita/Dropbox/프로젝트/Olympic/src/main/webapp/resources/qrcode/"; //드롭박스용
			String filepath = pathSet + "resources/qrcode/";
			
			file = new File(filepath);
			//File file0 = new File(filepath0); //드롭박스용
			if(!file.exists()){
				file.mkdirs();
			}
			QRCodeWriter writer = new QRCodeWriter();
			String filename = String.valueOf(ticketVO.getTicketnum());
			try {
				BitMatrix matrix = writer.encode(filename, BarcodeFormat.QR_CODE, 100, 100);
				int qrColor = 0xFF2e4e96; MatrixToImageConfig config = new MatrixToImageConfig(qrColor,0xFFFFFFFF);
				BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(matrix,config);
				ImageIO.write(qrImage, "png", new File(filepath + filename + ".png"));
				ImageIO.write(qrImage, "png", new File(filepath0 + filename + ".png")); //드롭박스용
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}


	public void insertticket(TicketVO vo) {
		dao.insertticket(vo);
		
	}


	public void amount2(UserVO voo) {
		dao.amount2(voo);
		
		
	}


	public UserVO login1(UserVO vo, HttpSession session) {
		if(dao.login1(vo) != null) {
			session.setAttribute("userid", vo.getUserid());
		return dao.login1(vo);
		}
		return null;
	}


	public ArrayList<PlayVO> playinffo() {
		ArrayList<PlayVO> result = dao.playinffo();
		return result;
	}
	

}
