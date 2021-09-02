package com.yedam.app;

import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.impl.EmpMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmpMapperClient {

	// Mapper Test 책 p.97
	@Autowired EmpMapper dao;
	@Autowired SqlSessionTemplate mybatis;
	
	
	// SqlSessionTemplate 사용 연습, mybatis.selectList("네임스페이스.아이디", "파라미터(없으면 안 써도 됨)");
	@Test
	public void mybatisTest() {
		// List<Employees> list = mybatis.selectList("com.yedam.app.impl.EmpMapper.getEmp", "20");
		List<Departments> list = mybatis.selectList("com.yedam.app.impl.EmpMapper.getDept");
		
		// 키값 확인하고 대소문자까지 그대로 써야 함, 내가 원하는 키값을 주고 싶으면 alias를 줘야 한다.
		log.info(list.get(0).toString());
		
		// 첫번째 요소만 log 찍기
		// log.info(list.get(0).toString());
	}
	// selectCursor로 Cursor 쿼리를 그대로 받아올 수 있다.
	
	@Test @Ignore
	public void test() {
		log.info(dao.getEmp("50").toString());
	}
	
	// @Ignore : 주석처리한 것과 같은 효과.
	@Ignore @Test
	public void getTimeTest() {
		log.info("time == " + dao.getTime().toString());
	}
	
}
