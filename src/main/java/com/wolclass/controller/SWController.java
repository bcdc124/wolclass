package com.wolclass.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wolclass.domain.BoardVO;
import com.wolclass.service.SwBoardService;

@Controller
@RequestMapping("/sw/*")
public class SWController {

	private static final Logger logger = LoggerFactory.getLogger(SWController.class);

	// 서버 시간
	@Autowired
	private SwBoardService service;

	
	// http://localhost:8080/sw/swWrite
	// 글쓰기 정보 입력
	@RequestMapping(value = "/swWrite", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.info(" registGET() - 글정보 입력! ");
		logger.info(" 연결된 view페이지 이동 ");
		// /boards/regist.jsp
	}

	// 글쓰기 정보 처리
	@RequestMapping(value = "/swWrite", method = RequestMethod.POST)
	public String registPOST(BoardVO vo, RedirectAttributes rttr /* Model model */) throws Exception {
		logger.info(" registPOST()  - 글쓰기처리! ");
		logger.info(" 글쓰기 정보: " + vo);
		service.writeBoard(vo);

		rttr.addFlashAttribute("result", "ok");

		return "redirect:/sw/community";
	}

	
	  // http://localhost:8080/sw/community 
	  // 글 전체 조회	  
	  @RequestMapping(value = "/community", method = RequestMethod.GET ) 
	  public void listAllGET(@RequestParam Map<String,Object> map, Model model) throws	Exception { 
		  logger.info(" listAllGet() 글전체 조회"); 
	  
		  List<BoardVO> boardList = service.selectPageNumBoTotal(map); 
		  logger.info(" boardList {}",boardList.size()); 
		  
		  model.addAttribute("map", map);
		  model.addAttribute("boardList", boardList);
	  }
	   
	  
	
	  
	  
	/*
	 * // http://localhost:8080/sw/swRead // 특정글 글정보 보기
	 * 
	 * @RequestMapping(value = "/swRead", method = RequestMethod.GET) public void
	 * readGET(@RequestParam("b_no") int b_no, Model model) throws Exception {
	 * logger.info(" readGET()  ");
	 * 
	 * logger.info(" �������� b_no : " + b_no);
	 * 
	 * service.incrementViewCnt(b_no); BoardVO resultVO = service.getBoard(b_no);
	 * logger.info(resultVO.toString()); model.addAttribute("resultVO", resultVO); }
	 * 
	 * // http://localhost:8080/sw/swUpdateBo
	 * 
	 * @RequestMapping(value = "/swUpdateBo", method = RequestMethod.GET) public
	 * void modifyGET(@RequestParam("b_no") int b_no, Model model) throws Exception
	 * {
	 * 
	 * logger.info(" b_no : " + b_no); BoardVO vo = service.getBoard(b_no);
	 * logger.info(vo.toString()); model.addAttribute(vo);
	 * 
	 * }
	 * 
	 * // 글 수정하기
	 * 
	 * @RequestMapping(value = "/##", method = RequestMethod.POST) public String
	 * modifyPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
	 * logger.info(vo.toString());
	 * 
	 * int result = service.modifyBoard(vo); if (result == 1) {
	 * rttr.addFlashAttribute("result", "updOK"); }
	 * 
	 * return "redirect:/sw/community"; }
	 * 
	 * // 글삭제하기
	 * 
	 * @RequestMapping(value = "/remove", method = RequestMethod.POST) public String
	 * removePOST(@ModelAttribute("b_no") int b_no, RedirectAttributes rttr) throws
	 * Exception {
	 * 
	 * logger.info(" b_no : " + b_no);
	 * 
	 * int result = service.removeBoard(b_no);
	 * 
	 * if (result == 1) { rttr.addFlashAttribute("result", "delOK"); }
	 * 
	 * return "redirect:/sw/community"; }
	 * 
	 * // http://localhost:8080/sw/admin // 관리자페이지
	 * 
	 * @RequestMapping(value = "/admin") public void adminGET() {
	 * logger.info(" admin() 호출!"); }
	 * 
	 * // http://localhost:8080/sw/review // 리뷰
	 * 
	 * @RequestMapping(value = "/review") public void reviewGET() {
	 * logger.info(" reviewGET() 호출! "); }
	 * 
	 */
	  }
