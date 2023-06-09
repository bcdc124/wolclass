package com.wolclass.service;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.ClassVO;

public interface ClassService {
	
	// 클래스 리스트 조회 HJ
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception;

	// 주변 검색 리스트 HJ
	public List<ClassVO> getNearbyClassList(Object lat, Object lng, Object addr) throws Exception;
	
	// 상세페이지 조회 TH
	public ClassVO getClassDetail(Integer c_no) throws Exception;
	
	// 등록 완료 클래스 리스트 TJ
	public List<ClassVO> registerClassList(String m_id) throws Exception;
	
	// 클래스 등록 TJ
	public void addClass(ClassVO vo) throws Exception;
	
	// 사용자 기반 카테고리별 추천 리스트 TJ
	public List<ClassVO> findByKeyword(String keyword) throws Exception;
	
	// 카테고리별 클래스 리스트 TJ
	public List<ClassVO> getCategoryClassList() throws Exception;

	// 온라인 리스트
	public List<ClassVO> getOnlineList() throws Exception;
	
}
