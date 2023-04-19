package com.wolclass.service;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.ClassVO;

public interface ClassService {
	
	// 클래스 리스트 조회 hj
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception;
}
