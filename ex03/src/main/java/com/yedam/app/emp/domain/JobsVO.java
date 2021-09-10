package com.yedam.app.emp.domain;

import lombok.Data;

@Data
public class JobsVO {
	private String jobId;
	private String jobTitle;
	private int minSalary;
	private int maxSalary;
}
