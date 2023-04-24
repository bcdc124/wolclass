package com.wolclass.persistance;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.MemberVO;

@Repository
public class DBDAOImpl implements DBDAO{
	private static final Logger logger = LoggerFactory.getLogger(DBDAOImpl.class);
	
	private static final String NAMESPACE ="com.wolclass.mapper.DbMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void memberJoin(Map<String,Object> map) throws Exception {
		sqlSession.insert(NAMESPACE+".memberJoin",map);
	}
	
	@Override
	public Integer idCheck(String m_id) {
		return sqlSession.selectOne(NAMESPACE+".idCheck",m_id);
	}
	
	@Override
	public MemberVO memberLogin(MemberVO vo) throws Exception {
		MemberVO resultVO = sqlSession.selectOne(NAMESPACE+".loginMember", vo);
		return resultVO;
	}
}