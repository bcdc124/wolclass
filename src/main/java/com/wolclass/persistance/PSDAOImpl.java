package com.wolclass.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PSDAOImpl implements PSDAO{

	@Autowired
	private SqlSession session;
	
	
	// 인기검색어 조회 hj
	@Override
	public List<String> getPSList() throws Exception {
		return session.selectList(NAMESPACE+"pslist");
	}
	// 인기검색어 조회 hj

}
