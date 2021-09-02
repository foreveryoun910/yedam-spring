package com.yedam.app.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yedam.app.Departments;

@Repository // DAO 역할
public interface EmpMapper {
	List<Map> getEmp(String deptId);
	List<Departments> getDept();
	
	// 어노테이션으로도 Mapping 가능.
	@Select("SELECT sysdate FROM dual")
	public String getTime();
}
