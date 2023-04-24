package com.wolclass.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.TimetableVO;
import com.wolclass.service.THService;

@Controller
@RequestMapping("/th/*")
public class THController {
	
	private static final Logger logger = LoggerFactory.getLogger(THController.class);
	


	// 서비스 객체 주입
	@Autowired
	private THService service;
	
	// http://localhost:8080/th/main
	@RequestMapping(value = "/main")
	public void mainGET() {
		logger.info(" mainGET() 호출 ");
	}
	
	// 클래스 상세정보 TH
	// http://localhost:8080/th/detail?c_no=1
	@RequestMapping(value = "/detail")
	public void detailGET(@RequestParam("c_no")int c_no, Model model) throws Exception {
		logger.info(" detailGET() 호출 ");
		ClassVO cvo = service.getClassDetail(c_no);
		List<TimetableVO> ttvo = service.getTimetable(c_no);
		logger.info("cvo : "+cvo );
		logger.info("tvo.size  : "+ttvo.size());
		model.addAttribute(cvo);
		model.addAttribute("dateList", ttvo);
	}
	// 클래스 상세정보 TH
	
	// 클래스 예약 가능한 시간 가져오기 TH
	@RequestMapping(value = "/getTime", method = RequestMethod.POST)
	@ResponseBody
	public List<TimetableVO> timePost(@RequestBody TimetableVO vo) throws Exception{
		logger.info(" timePost() 호출 ");
		//logger.info("t_date:"+t_date);
		//logger.info("c_no:"+c_no);
		logger.info("vo:"+vo);
		List<TimetableVO> tvo = service.getTime(vo);
		//logger.info("cvo : "+cvo );
		logger.info("tvo : "+tvo);
	
		return tvo;
	}
	// 클래스 예약 가능한 시간 가져오기 TH
	
	
	// http://localhost:8080/th/calender
	@RequestMapping(value = "/calender")
	public void calenderGET() {
		logger.info(" calenderGET() 호출 ");
	}
	
	
	
	
}
