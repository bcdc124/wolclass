package com.wolclass.domain;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class TimetableVO {
	private Integer t_no;
	private Time t_start;
	private Time t_end;
	private Date t_date;
	private int t_rem_p;
	private Integer c_no;
}
