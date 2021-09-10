package com.yedam.app.emp.domain;

import lombok.Data;

@Data
public class DepartmentsVO {
	private int departmentId;
	private String departmentName;
	private int managerId;
	private int locationId;
}
