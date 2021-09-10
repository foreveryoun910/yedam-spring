package com.yedam.app;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.emp.domain.EmpVO;
import com.yedam.app.emp.mapper.EmpMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmpMapperClient {

	@Autowired EmpMapper empMapper;
	
	@Test @Ignore
	public void getList() {
		log.info(empMapper.getEmpList().toString());
	}
	
	@Test
	public void read() {
		// 존재하는 게시물 번호로 테스트
		EmpVO vo = new EmpVO();
		vo.setEmployeeId(100);
		vo = empMapper.readEmp(vo);
		
		log.info(vo.toString());
	}	
	
}
