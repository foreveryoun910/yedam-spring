package com.yedam.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DiTest {
	
	@Autowired TV tv; // 컨테이너에 등록한 타입(class)로 가져오기 때문에 id와 @Autowired로 불러오는 객체 이름은 달라도 된다.
	
	@Test
	public void test1() {
		tv.turnon();
		tv.volumeUp();
	}
}
