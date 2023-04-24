package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	private Integer b_no;
	private String b_category;
	private String b_title;
	private String b_writer;
	private String b_content;
	private String b_reciver;
	private Timestamp b_regdate;
	private Integer b_viewcnt;
}
