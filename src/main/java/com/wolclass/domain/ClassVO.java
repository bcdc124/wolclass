package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ClassVO {
	private Integer c_no;
	private String c_name;
	private String m_id;
	private Integer c_maxperson;
	private String c_addr1;
	private String c_addr2;
	private String c_addrdetails;
	private Double c_lati;
	private Double c_longi;
	private Integer c_level;
	private String c_time;
	private String c_category;
	private String c_content;
	private String c_img;
	private Integer c_price;
	private String c_confirm;
	private Timestamp c_regdate;
	
	// 출력용 평점
	private Double score;
}
