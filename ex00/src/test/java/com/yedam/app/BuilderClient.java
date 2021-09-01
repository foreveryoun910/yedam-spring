package com.yedam.app;

import static org.junit.Assert.*;

import org.junit.Test;

public class BuilderClient {

	@Test
	public void test() {
//		fail("Not yet implemented");
	}
	
	// @Test를 추가해서 테스트를 추가할 수 있다.
	@Test
	public void member() {
		Member member = Member.builder()
								.id("hong")
								.pw("1234")
								.build();
		
		// Test가 제대로 됐는지 확인.
		assertEquals(member.getId(), "hong");
	}
}
