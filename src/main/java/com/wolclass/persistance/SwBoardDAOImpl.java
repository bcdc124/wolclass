package com.wolclass.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.BoardVO;

@Repository
public class SwBoardDAOImpl implements SwBoardDAO{

	
	    //디비연결 정보 객체 <- SqlSessionTemplate주입
		@Inject
		private SqlSession sqlSession;
	
		
		private static final Logger logger = LoggerFactory.getLogger(SwBoardDAOImpl.class);

		// mapper Namespace정보
		private static final String NAMESPACE ="com.wolclass.mapper.swBoardMapper";
		
		
		// 시간정보 
		@Override
		public String getDBTime() {
			logger.info(" 디비 연결 정보 : "+sqlSession);
								
			return sqlSession.selectOne(NAMESPACE + ".getTime");
		}
		
		// 글쓰기 
		@Override
		public void createBoard(BoardVO vo) throws Exception {
			
			sqlSession.insert(NAMESPACE + ".create", vo);
		}

		
		// 전체 글 정보 가져오기 
		@Override
		public List<BoardVO> getBoardListAll() throws Exception {
			// 서비스 호출로 DAO는 mapper의 쿼리 호출 정보 저장
			
			return sqlSession.selectList(NAMESPACE + ".listAll");
		}
		
		// 페이징 처리 
		@Override
		public int selectPNBT(BoardVO vo) {
			return (int)sqlSession.selectOne(NAMESPACE +".boardPageNum", vo);
		}
		
		// 조회수 1증가
		@Override
		public void updateViewcnt(Integer b_no) throws Exception {
			sqlSession.update(NAMESPACE + ".addViewcnt",b_no);
		}

		// 특정글 정보 조회 
		@Override
		public BoardVO getBoard(Integer b_no) throws Exception {
			return sqlSession.selectOne(NAMESPACE + ".getBoard",b_no);
		}

		// 글수정하기 
		@Override
		public Integer updateBoard(BoardVO uvo) throws Exception {
		
			 return sqlSession.update(NAMESPACE+".updateBoard",uvo);
		}

		// 글 삭제하기 
		@Override
		public Integer deleteBoard(Integer b_no) throws Exception {
			
			return sqlSession.delete(NAMESPACE+".deleteBoard", b_no);
		}
		
}
