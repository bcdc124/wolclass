package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.WishVO;

public interface TJDAO {
	// 클래스 등록 tj
	public int addClass(ClassVO vo) throws Exception;

	// 클래스 시간 등록
	public void addTime(Map<String, Object> map) throws Exception;

	// 등록 완료 클래스 리스트
	public List<ClassVO> registerClassList(String m_id) throws Exception;

	// 회원 조회
	public MemberVO getMemberInfo(String m_id) throws Exception;

	// 키워드별 추천 - tj
	public List<ClassVO> findByKeyword(String keyword) throws Exception;

	// 생일 1주일 전 - tj
	public int oneWeekBeforeBirth(String m_id) throws Exception;

	// 메인 카테고리별 리스트 - tj
	public List<ClassVO> getCategoryClassList() throws Exception;

	// 위시리스트 c_no, m_id 가져오기
	public List<WishVO> getWishInfo(WishVO vo) throws Exception;
	
	// 위시리스트에 있는 클래스 시간 등록시 알림 테이블에 insert
//	public void insertAlert() throws Exception;

}
