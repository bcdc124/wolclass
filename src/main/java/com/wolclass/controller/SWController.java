package com.wolclass.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	  public void listAllGET(@ModelAttribute("result") String result, Model model, 
			  BoardVO vo) throws
	  Exception { logger.info(" listAllGet() 글전체 조회"); logger.info(" result : " +
	  result);
	  
	  // 페이징 처리 글 전체 개수
		
		  int total = service.selectPageNumBoTotal(vo); 
		  int totalPage =  (int)Math.ceil((double)total/2);
		  int viewPage;
	  
	  List<BoardVO> boardList = service.getBoardListAll(); 
	  logger.info(" total : " + boardList.size());
		
		  logger.info("total :" + total); logger.info("totalPage :" + totalPage);
		  
		  
		  model.addAttribute("total", total); 
		  model.addAttribute("totalPage", totalPage);
		  model.addAttribute("boardList", boardList);
	  }
	   
	  // sw/community }
	  
	  /*// 페이징 처리 
	  @RequestMapping(value = "/community", method = requestMethod/)
	  public String selectPageNumBo(BoardVO vo, Model) throws Exception {
	  	
	  	int total = boardService.selectPageNumBoTotal(vo);
	  	List<BoardVO> boardList = service.getBoardListAll();
	  
	  
	  
	  }*/
	  
	  
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
