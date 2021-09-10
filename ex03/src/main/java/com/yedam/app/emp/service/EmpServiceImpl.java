package com.yedam.app.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.emp.domain.EmpVO;
import com.yedam.app.emp.mapper.EmpMapper;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired EmpMapper empMapper;
	
	@Override
	public List<EmpVO> getEmpList() {
		return empMapper.getEmpList();
	}

	@Override
	public EmpVO readEmp(EmpVO vo) {
		return empMapper.readEmp(vo);
	}

	@Override
	public int insertEmp(EmpVO vo) {
		return empMapper.insertEmp(vo);
	}

	@Override
	public int updateEmp(EmpVO vo) {
		return empMapper.updateEmp(vo);
	}

	@Override
	public int deleteEmp(EmpVO vo) {
		return empMapper.deleteEmp(vo);
	}

}
