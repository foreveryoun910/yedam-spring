package com.yedam.app;

import org.springframework.stereotype.Component;

@Component
public class AppleSpeaker implements Speaker {

	@Override
	public void volumeUp() {
		System.out.println("AppleSpeaker 볼륨업");
	}

	@Override
	public void volumeDown() {
		System.out.println("AppleSpeaker 볼륨다운");
	}

}
