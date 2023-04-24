package com.wolclass.persistance;

import java.util.Map;

import com.wolclass.domain.MemberVO;

public interface DBDAO {
	
	// 회원가입
	public void memberJoin(Map<String,Object> map) throws Exception;
	
	// 아이디 중복검사
	public Integer idCheck(String m_id);
	
	// 로그인
	public MemberVO memberLogin(MemberVO vo) throws Exception;
}