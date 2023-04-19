package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.ClassVO;

public interface ClassDAO {
	String NAMESPACE = "com.wolclass.mappers.ClassMapper.";
	
	// 페이징 처리를 위한 클래스 리스트 갯수 조회 hj
	public int getClassListCnt(Map<String, Object> map) throws Exception;

	// 클래스 리스트 조회 hj
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception;

}
