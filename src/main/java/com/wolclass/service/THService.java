package com.wolclass.service;

import java.util.List;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.TimetableVO;

public interface THService {

	// 디비 시간정보 조회
	public String getTime();
	
	// 상세페이지 조회 TH
	public ClassVO getClassDetail(Integer c_no) throws Exception;
	
	// 예약가능한 타임테이블 가져오기 TH
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception;
	
	// 예약가능한 시간 가져오기 TH
	public List<TimetableVO> getTime(TimetableVO vo) throws Exception;
	
	// 예약가능한 최대 인원 가져오기 TH
	public TimetableVO getRemainNum(TimetableVO vo) throws Exception;
}
