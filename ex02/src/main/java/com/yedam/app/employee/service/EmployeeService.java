package com.yedam.app.employee.service;

import java.util.List;

import com.yedam.app.employee.domain.EmployeeVO;

public interface EmployeeService {
	
	// 등록
	public int insertEmp(EmployeeVO vo);
	
	// 수정
	public int updateEmp(EmployeeVO vo);
	
	// 삭제
	public int deleteEmp(EmployeeVO vo);
	
	// 단건조회
	public EmployeeVO readEmp(EmployeeVO vo);
	
	// 전체조회
	public List<EmployeeVO> getListEmp();
	
}
