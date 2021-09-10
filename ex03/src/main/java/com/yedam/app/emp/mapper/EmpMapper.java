package com.yedam.app.emp.mapper;

import java.util.List;

import com.yedam.app.emp.domain.EmpVO;

public interface EmpMapper {

	// 전체조회
	public List<EmpVO> getEmpList();
	
	// 단건조회
	public EmpVO readEmp(EmpVO vo);
	
	// 등록
	public int insertEmp(EmpVO vo);
	
	// 수정
	public int updateEmp(EmpVO vo);
	
	// 삭제
	public int deleteEmp(EmpVO vo);
	
}
