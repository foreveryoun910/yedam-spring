package com.yedam.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.impl.EmpMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class EmpMapperClient {

	// Mapper Test 책 p.97
	@Autowired EmpMapper dao;
	
	@Test
	public void test() {
		log.info(dao.getEmp().toString());
		log.info(dao.getDept().toString());
	}
	
}
