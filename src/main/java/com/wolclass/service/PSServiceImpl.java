package com.wolclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.PSDAO;

@Service
public class PSServiceImpl implements PSService{

	@Autowired
	private PSDAO dao;
	
	// 인기검색어 조회 hj
	@Override
	public List<String> getPSList() throws Exception {
		return dao.getPSList();
	}
	// 인기검색어 조회 hj

}
