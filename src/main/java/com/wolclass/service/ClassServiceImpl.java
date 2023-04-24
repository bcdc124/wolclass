package com.wolclass.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.ClassVO;
import com.wolclass.persistance.ClassDAO;

@Service
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassDAO dao;
	
	// 클래스 리스트 조회 hj
	@Override
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception {
		// 데이터 전처리
		if(!map.containsKey("timestart") || ((String)map.get("timestart")).equals("")) map.put("timestart", "00:00");
		if(!map.containsKey("timeend") || ((String)map.get("timeend")).equals("")) map.put("timeend", "24:00");
		if(!map.containsKey("pricestart") || ((String)map.get("pricestart")).equals("")) map.put("pricestart", 0);
		if(!map.containsKey("priceend") || ((String)map.get("priceend")).equals("")) map.put("priceend", 1000000);
		if(!map.containsKey("lowlv")) map.put("lowlv", 0);
		if(!map.containsKey("midlv")) map.put("midlv", 0);
		if(!map.containsKey("highlv")) map.put("highlv", 0);  
		if(!map.containsKey("category")) map.put("category", "");
		if(!map.containsKey("addr")) map.put("addr", "");
		if(!map.containsKey("order") || ((String)map.get("order")).equals("")) map.put("order", 0);
		if(!map.containsKey("search")) map.put("search", "");
		if(!map.containsKey("pageNum")) map.put("pageNum", "1");
		// 데이터 전처리

		// 페이징 계산
		int count = dao.getClassListCnt(map);
		int pageSize = 12;
		int pageBlock = 10;
		int currentPage = Integer.parseInt((String)map.get("pageNum"));
		int startRow = (currentPage - 1) * pageSize + 1;
//		int endRow = currentPage * pageSize;
		List<ClassVO> list = new ArrayList<>();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		if(count > 0) list = dao.getClassList(map);
		int pageCount = count/pageSize + (count%pageSize==0? 0:1);
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		// 페이징 계산
		
		// 페이징 처리에 필요한 데이터 셋팅
		map.put("count", count);
		map.put("pageCount", pageCount);
		map.put("pageBlock", pageBlock);
		map.put("pageSize", pageSize);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		// 페이징 처리에 필요한 데이터 셋팅
		
		return list;
	}
	// 클래스 리스트 조회 hj

}
