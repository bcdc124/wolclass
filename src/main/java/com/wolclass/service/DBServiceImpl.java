package com.wolclass.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.MemberVO;
import com.wolclass.persistance.DBDAO;

@Service
public class DBServiceImpl implements DBService{
	private static final Logger logger = LoggerFactory.getLogger(DBServiceImpl.class);
	
	@Autowired
	private DBDAO dbdao;
	
	// 회원가입 - 다빈
	@Override
	public void memberJoin(Map<String,Object> map) throws Exception {
		dbdao.memberJoin(map);
	}
	
	// 아이디 중복검사
	@Override
	public Integer idCheck(String m_id) throws Exception {
		return dbdao.idCheck(m_id);
	}
	// 로그인 - 다빈
	@Override
	public MemberVO memberLogin(MemberVO vo) throws Exception {
		MemberVO loginResultVO = dbdao.memberLogin(vo);
		return loginResultVO;
	}
	
}