package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.HJDAO;

@Service
public class HJServiceImpl implements HJService{

	@Autowired
	private HJDAO dao;
	

}
