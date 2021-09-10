package com.yedam.app.emp.mapper;

import java.util.List;

import com.yedam.app.emp.domain.DepartmentsVO;

public interface DepartmentsMapper {
	
	// 전체조회
	public List<DepartmentsVO> getDeptList();
	
	// 단건조회
	public DepartmentsVO readDept(DepartmentsVO vo);
	
	// 등록
	public int insertDept(DepartmentsVO vo);
	
	// 수정
	public int updateDept(DepartmentsVO vo);
	
	// 삭제
	public int deleteDept(DepartmentsVO vo);
}
