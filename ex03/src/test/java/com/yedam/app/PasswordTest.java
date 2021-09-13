package com.yedam.app;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class PasswordTest {

	@Test
	public void encodingTest() {
		// 패스워드 테이블 최소 varchar2(60) 이상 --암호화 길이까지 고려
		// Create an encoder with strength 16
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16); // (16) 암호화 지연시간
		String result = encoder.encode("user3");
		String result2 = encoder.encode("user3");
		log.info(result);
		log.info(result2);
		assertTrue(encoder.matches("user3", result)); // 암호화 된 값과 평서문 비교
		// 같을 시 success, 다를 시 false
	}
}
