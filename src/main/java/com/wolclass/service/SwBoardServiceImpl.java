package com.wolclass.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.wolclass.domain.BoardVO;
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
	public List<BoardVO> getBoardListAll() throws Exception {
		
		return bdao.getBoardListAll();
	}

	// 페이징 처리
	@Override
	public int selectPageNumBoTotal(BoardVO vo) throws Exception{
		return bdao.selectPNBT(vo);
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
