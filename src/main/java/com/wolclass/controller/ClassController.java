package com.wolclass.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wolclass.domain.ClassVO;
import com.wolclass.service.ClassService;
import com.wolclass.service.PSService;

@Controller
@RequestMapping("/class/*")
public class ClassController {
	private static final Logger logger = LoggerFactory.getLogger(ClassController.class);
	
	@Autowired
	private ClassService cservice;
	@Autowired
	private PSService psservice;
	
	//클래스리스트 검색결과 출력 hj
	//http://localhost:8080/class/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(@RequestParam Map<String,Object> map, Model model) throws Exception {
		logger.info(" ClassController-listGET() 호출 ");
		model.addAttribute("psList", psservice.getPSList());
		List<ClassVO> list =  cservice.getClassList(map);
		logger.info(list.toString());
		model.addAttribute(list);
		model.addAttribute("map", map);
	}
	//클래스리스트 검색결과 출력 hj
}
