package com.wolclass.persistance;

import java.util.List;

public interface PSDAO {
	String NAMESPACE = "com.wolclass.mappers.PSMapper.";
	
	// 인기검색어 조회 hj
	public List<String> getPSList() throws Exception;
}
