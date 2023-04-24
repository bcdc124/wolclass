package com.wolclass.persistance;

import java.util.List;

import com.wolclass.domain.AlertVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;

public interface TJDAO {
	// 클래스 등록(보류) tj
	public void addClass(ClassVO vo) throws Exception;
	
//	public List<ClassVO> getRecommendations(String m_id);
//	
//	public List<ClassVO> getRecommendations();
	
	// 회원 조회
	public MemberVO getMemberInfo(String m_id) throws Exception;
	
	// 카테고리별 추천 - tj
	public List<ClassVO> findByCategory(String c_category) throws Exception;
	
	// 메인 카테고리별 리스트 - tj
	public List<ClassVO> getCategoryClassList() throws Exception;
	
	// 알림 등록
	public void insertAlert(AlertVO vo) throws Exception;
	// 알림 리스트
	public List<AlertVO> selectAlertList(String m_id) throws Exception;
	// 안 읽은 알림 리스트
	public List<AlertVO> selectUnreadAlertList(String m_id) throws Exception;
	// 읽음 안 읽음 상태
	public void updateAlertReadStatus(Integer a_no) throws Exception;
}
