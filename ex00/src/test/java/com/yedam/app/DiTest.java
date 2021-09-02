package com.yedam.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class DiTest {

	// IoC(역제어) : 객체관리를 개발자가 아닌 컨테이너가 한다.
	// DI : dependency Injection
	// new 키워드로 객체 생성하지 않고 컨테이너에서 주입받음.
	@Autowired Employees emp;
	
	@Test
	public void test1() {
		log.info(emp.getEmployeeId());
	}
}
