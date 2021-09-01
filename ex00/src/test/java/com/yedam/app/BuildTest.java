package com.yedam.app;

public class BuildTest {
	public static void main(String[] args) {
		
		// Build : 생성자 대체
		// 생성자 안에 매개변수를 몇 개를 넣을지 알 수 없을 때 build를 활용할 수 있다.
		Member member = Member.builder()
								.id("hong")
								.pw("1234")
								.name("홍길동")
								.build();
	}
}
