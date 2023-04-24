package com.wolclass.persistance;



import java.sql.Date;
import java.util.List;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.TimetableVO;

public interface THDAO {
	// 디비 시간정보 조회
	public String getDBTime();
	
	// 상세페이지 조회 TH
	public ClassVO selectClass(Integer c_no) throws Exception;
	
	// 예약 가능한 타임테이블 TH
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception;
	
	// 예약 가능한 시간 TH
	public List<TimetableVO> getTime(TimetableVO vo) throws Exception;
}
