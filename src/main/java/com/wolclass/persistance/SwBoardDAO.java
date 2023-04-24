package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;

public interface SwBoardDAO {

		// 디비 시간정보 
		public String getDBTime();
		
		// 글쓰기
		public void createBoard(BoardVO vo) throws Exception;
		
		// 글 전체 목록
		public List<BoardVO> getBoardListAll(Map<String, Object> map) throws Exception;

		// 페이징처리
		public int selectPNBT(Map<String, Object> map) throws Exception;
		
		// 글 조회수 1증가
		public void updateViewcnt(Integer b_no) throws Exception;
		
		// 글 정보 조회 (특정글)
		public BoardVO getBoard(Integer b_no) throws Exception;
		
		// 글 수정
		public Integer updateBoard(BoardVO uvo) throws Exception;
		
		// 글 삭제  
		public Integer deleteBoard(Integer b_no) throws Exception;

}
