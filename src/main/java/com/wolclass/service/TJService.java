package com.wolclass.service;

import java.util.List;

import com.wolclass.domain.AlertVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;

public interface TJService {
	public void addClass(ClassVO vo) throws Exception;
	
//	public List<ClassVO> getRecommendations(String m_id);
	
	// 회원 정보 조회
	public MemberVO getMemberInfo(String m_id) throws Exception;
	
	public List<ClassVO> findByCategory(String c_category) throws Exception;
	
	// 카테고리별 클래스 리스트
	public List<ClassVO> getCategoryClassList() throws Exception;
	
	// 알림 등록
	public void addAlert(AlertVO vo) throws Exception;
	
	// 알림 리스트
	public List<AlertVO> getAlertList(String m_id) throws Exception;
	
	// 안 읽은 알림 리스트
	public List<AlertVO> getUnreadAlertList(String m_id) throws Exception;
	
	// 읽음 안 읽음 상태
	public void markAlertAsRead(Integer a_no) throws Exception;
	

}
