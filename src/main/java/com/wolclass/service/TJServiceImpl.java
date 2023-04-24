package com.wolclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.AlertVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.persistance.TJDAO;

@Service
public class TJServiceImpl implements TJService{
	
	@Autowired
	TJDAO dao;

	@Override
	public void addClass(ClassVO vo) throws Exception {
		dao.addClass(vo);
	}

//	@Override
//	public List<ClassVO> getRecommendations(String m_id) {
//		
//	
//		
//		return null;
//	}
//
	@Override
	public MemberVO getMemberInfo(String m_id) throws Exception {

		return dao.getMemberInfo(m_id);
	}

	@Override
	public List<ClassVO> findByCategory(String c_category) throws Exception {

		return dao.findByCategory(c_category);
	}

	@Override
	public List<ClassVO> getCategoryClassList() throws Exception{
		return dao.getCategoryClassList();
	}

	@Override
	public void addAlert(AlertVO vo) throws Exception {
		dao.insertAlert(vo);
	}

	@Override
	public List<AlertVO> getAlertList(String m_id) throws Exception {
		return dao.selectAlertList(m_id);
	}

	@Override
	public List<AlertVO> getUnreadAlertList(String m_id) throws Exception {
		return dao.selectUnreadAlertList(m_id);
	}

	@Override
	public void markAlertAsRead(Integer a_no) throws Exception {
		dao.updateAlertReadStatus(a_no);
	}

	
	
}
