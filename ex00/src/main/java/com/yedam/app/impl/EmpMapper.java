package com.yedam.app.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yedam.app.Departments;

@Repository // DAO 역할
public interface EmpMapper {
	List<Map> getEmp();
	List<Departments> getDept();
}
