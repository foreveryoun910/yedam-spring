package com.yedam.app.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.emp.domain.DepartmentsVO;
import com.yedam.app.emp.mapper.DepartmentsMapper;

@Service
public class DepartmentsServiceImpl implements DepartmentsService {

	@Autowired DepartmentsMapper departmentsMapper;
	
	@Override
	public List<DepartmentsVO> getDeptList() {
		return departmentsMapper.getDeptList();
	}

	@Override
	public DepartmentsVO readDept(DepartmentsVO vo) {
		return departmentsMapper.readDept(vo);
	}

	@Override
	public int insertDept(DepartmentsVO vo) {
		return departmentsMapper.insertDept(vo);
	}

	@Override
	public int updateDept(DepartmentsVO vo) {
		return departmentsMapper.updateDept(vo);
	}

	@Override
	public int deleteDept(DepartmentsVO vo) {
		return departmentsMapper.deleteDept(vo);
	}

}
