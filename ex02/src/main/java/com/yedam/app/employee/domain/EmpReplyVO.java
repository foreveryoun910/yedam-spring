package com.yedam.app.employee.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EmpReplyVO {
	private long rno;
	private long bno;
	private String reply;
	private String replyer;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date replyDate;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date updateDate;
}