package com.wolclass.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.TimetableVO;
import com.wolclass.persistance.THDAO;

@Service
public class THServiceImpl implements THService {
	
	

	private static final Logger logger = LoggerFactory.getLogger(THServiceImpl.class);

	@Inject
	private	THDAO dao;
		
	@Override
	public String getTime() {
		
		return dao.getDBTime();
	}
	
	@Override
	public ClassVO getClassDetail(Integer c_no) throws Exception {
		logger.info("service-dao호출");
		return dao.selectClass(c_no);
	}

	@Override
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception {
		List resultVO = dao.getTimetable(c_no);
		return resultVO;
	}

	@Override
	public List<TimetableVO> getTime(TimetableVO vo) throws Exception {
		logger.info("service도착");
		List resultVO = dao.getTime(vo);
		return resultVO;
	}
	
	
	
}
