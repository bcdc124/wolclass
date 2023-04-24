package com.wolclass.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.service.ClassService;
import com.wolclass.service.TJService;

@Controller
@RequestMapping("/tj/*")
public class TJController {

	private static final Logger logger = LoggerFactory.getLogger(TJController.class);
	@Autowired
	private ClassService service;

	@Autowired
	private TJService tjService;

	// main 페이지 - tj
	// http://localhost:8080/tj/main
	@RequestMapping(value = "/main")
	public void mainGET(@RequestParam Map<String, Object> map, Model model, HttpServletRequest request)
			throws Exception {
		logger.info(" mainGET() 호출 ");
		
		// 카테고리별 리스트 출력
		Map<String, List<ClassVO>> classMap = new HashMap<String, List<ClassVO>>();
		List<ClassVO> categoryClassList = tjService.getCategoryClassList();
		
		for (ClassVO classVO : categoryClassList) {
			String category = classVO.getC_category();
			List<ClassVO> categoryList = classMap.get(category);
			if(categoryList == null) {
				categoryList = new ArrayList<ClassVO>();
				classMap.put(category, categoryList);
			} 
			categoryList.add(classVO);
		}
		
		String id = (String) request.getSession().getAttribute("id");
		List<ClassVO> recommendedClass = new ArrayList<>();
		// 특정일 기준
//		List<ClassVO> list = service.getClassList(map);

		// 나이 기준
		if (id != null) {
			MemberVO vo = tjService.getMemberInfo(id);
			if (vo != null) {
				int age = calculateAge(vo.getM_dogbirth());
				if (age <= 8) { // 8살 이상일 경우 건강 카테고리 추천
					recommendedClass.add((ClassVO) tjService.findByCategory("건강"));
				} else { // 그 외의 경우 기본 추천(인기순?)
					recommendedClass.add((ClassVO) classMap);
				}
			}
		}
		model.addAttribute("categoryList", classMap);
		logger.info("classMap@@@@@@@@@@@@@@@@@ : "+classMap.size());
		model.addAttribute("recClass", recommendedClass);
	}

	// 나이 계산 메서드 - tj
	private int calculateAge(Timestamp timestamp) {
		Calendar birth = Calendar.getInstance();
		birth.setTime(timestamp);
		Calendar now = Calendar.getInstance();
		int age = now.get(Calendar.YEAR) - birth.get(Calendar.YEAR);
		if (now.get(Calendar.DAY_OF_YEAR) < birth.get(Calendar.DAY_OF_YEAR)) {
			age--;
		}
		return age;
	}

	@RequestMapping(value = "/addClass", method = RequestMethod.GET)
	public void addClassGET() {
		logger.info(" addClassGET() 호출 ");
	}

	@RequestMapping(value = "/addClass", method = RequestMethod.POST)
	public String addClassPOST(ClassVO vo) throws Exception {
		logger.info(" addClassPOST() 호출 ");
		tjService.addClass(vo);
		logger.info("클래스 등록 완료@@@@@@@@@@@@");
		return "redirect:/tj/main";
	}

}
