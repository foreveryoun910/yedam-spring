package com.yedam.app.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.employee.domain.EmployeeVO;
import com.yedam.app.employee.mapper.EmployeeMapper;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired EmployeeMapper employeeMapper;
	
	@Override
	public int insertEmp(EmployeeVO vo) {
		return employeeMapper.insertEmp(vo);
	}

	@Override
	public int updateEmp(EmployeeVO vo) {
		return employeeMapper.updateEmp(vo);
	}

	@Override
	public int deleteEmp(EmployeeVO vo) {
		return employeeMapper.deleteEmp(vo);
	}

	@Override
	public EmployeeVO readEmp(EmployeeVO vo) {
		return employeeMapper.readEmp(vo);
	}

	@Override
	public List<EmployeeVO> getListEmp() {
		return employeeMapper.getListEmp();
	}

}
