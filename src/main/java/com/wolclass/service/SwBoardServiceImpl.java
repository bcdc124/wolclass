package com.wolclass.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.persistance.SwBoardDAO;

@Service
public class SwBoardServiceImpl implements SwBoardService {

	  

	private static final Logger logger 
	= LoggerFactory.getLogger(SwBoardServiceImpl.class);


	
	@Inject
	private SwBoardDAO bdao;
	
	// 디비 시간 정보 조회
	@Override
	public String itwillbs_getTime() {
		return bdao.getDBTime();
	}

	// 글쓰기 
	@Override
	public void writeBoard(BoardVO vo) throws Exception {
		bdao.createBoard(vo);
	}

	// 전체 글목록 조회
	@Override
	public List<BoardVO> getBoardListAll(Map<String, Object> map) throws Exception {
		
		return bdao.getBoardListAll(map);
	}

	// 페이징 처리 및 검색
	@Override
	public List<BoardVO> selectPageNumBoTotal(Map<String, Object> map) throws Exception{
		
		if(!map.containsKey("b_category")) map.put("b_category", "");
		if(!map.containsKey("search")) map.put("search", "");
		if(!map.containsKey("pageNum")) map.put("pageNum", "1");
		
		// 리스트 총 개수
		int count = bdao.selectPNBT(map);
		int pageSize = 10;
		int pageBlock = 10;
		int currentPage = Integer.parseInt((String)map.get("pageNum"));
		int startRow = (currentPage - 1) * pageSize + 1;
		logger.info("cnt {}",count);
		List<BoardVO> list = new ArrayList<>();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		if(count > 0)  list = bdao.getBoardListAll(map);
		int pageCount = (count/pageSize) + (count%pageSize==0? 0:1);
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		// 페이징 계산
		
		// 페이징 처리에 필요한 데이터 셋팅
		map.put("count", count);
		map.put("pageCount", pageCount);
		map.put("pageBlock", pageBlock);
		map.put("pageSize", pageSize);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		// 페이징 처리에 필요한 데이터 셋팅
		return list;
	}
	
	// 조회수 1씩 증가
	@Override
	public void incrementViewCnt(Integer b_no) throws Exception {
		bdao.updateViewcnt(b_no);
	}

	
	// 특정글 정보 확인
	@Override
	public BoardVO getBoard(Integer b_no) throws Exception {
		return bdao.getBoard(b_no);
	}

	
	// 글 수정하기 
	@Override
	public Integer modifyBoard(BoardVO uvo) throws Exception {
		return bdao.updateBoard(uvo);	
	}

	// 글 삭제하기 
	@Override
	public Integer removeBoard(Integer b_no) throws Exception {
		return bdao.deleteBoard(b_no);
	}



	
	
	
	
	
	
	
	
}
