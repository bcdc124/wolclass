package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.ClassVO;

@Repository
public class ClassDAOImpl implements ClassDAO{

	@Autowired
	private SqlSession session;

	// 페이징 처리를 위한 클래스 리스트 갯수 조회 hj
	@Override
	public int getClassListCnt(Map<String, Object> map) throws Exception {
		return session.selectOne(NAMESPACE+"classListCnt", map);
	}
	// 페이징 처리를 위한 클래스 리스트 갯수 조회 hj
	
	// 클래스 리스트 조회 hj
	@Override
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+"classList", map);
	}
	// 클래스 리스트 조회 hj

}
