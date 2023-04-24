package com.wolclass.service;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;

public interface SwBoardService {

	// 디비 시간정보 조회
	public String itwillbs_getTime();
	
	// 게시판 글쓰기
	public void writeBoard(BoardVO vo) throws Exception;
	
	// 모든 게시판 글목록 가져오기
	public List<BoardVO> getBoardListAll(Map<String, Object> map) throws Exception;
	
	// 페이징처리
	public List<BoardVO> selectPageNumBoTotal(Map<String, Object> map) throws Exception;
	
	// 게시판 글 조회수 1증가
	public void incrementViewCnt(Integer b_no) throws Exception;
	
	// 글정보 조회 (특정글)
	public BoardVO getBoard(Integer b_no) throws Exception;
	
	// 글정보 수정 
	public Integer modifyBoard(BoardVO uvo) throws Exception;
	
	// 글 정보 삭제 
	public Integer removeBoard(Integer b_no) throws Exception;	
	
		
	
}
