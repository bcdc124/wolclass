package com.wolclass.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.AlertVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;

@Repository
public class TJDAOImpl implements TJDAO {
	
	static final String NAMESPACE = "com.wolclass.mappers.TJMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addClass(ClassVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".addClass", vo);
	}

//	// 사용자 기반 추천 메서드
//	@Override
//	public List<ClassVO> getRecommendations(String m_id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	// 특정일 추천 메서드
//	@Override
//	public List<ClassVO> getRecommendations() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	// 회원정보 조회
	@Override
	public MemberVO getMemberInfo(String m_id) {
		MemberVO vo = sqlSession.selectOne(NAMESPACE+".getMemberInfo", m_id);;
		
		return vo;
	}

	@Override
	public List<ClassVO> findByCategory(String c_category) {
		
		return sqlSession.selectList(NAMESPACE+".findByCategory", c_category);
	}

	@Override
	public List<ClassVO> getCategoryClassList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".getCategoryClassList");
	}

	@Override
	public void insertAlert(AlertVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".insertAlert", vo);
		
	}

	@Override
	public List<AlertVO> selectAlertList(String m_id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectAlertList", m_id);
	}

	@Override
	public List<AlertVO> selectUnreadAlertList(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".selectUnreadAlertList", m_id);
	}

	@Override
	public void updateAlertReadStatus(Integer a_no) throws Exception {
		sqlSession.update(NAMESPACE+"updateAlertReadStatus", a_no);
	}

	
}
