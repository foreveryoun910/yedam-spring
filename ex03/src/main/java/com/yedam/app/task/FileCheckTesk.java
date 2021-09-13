package com.yedam.app.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Component
@Log
public class FileCheckTesk {

		// 0/10 : 0초 간격으로 10초마다
		// 초 분 시 일 월
		// 15, 25 : 15초, 15초마다 ( , : 간격 ) ( - : 범위 )
		// (cron = "15/30 1-5 * * *")
	// @Scheduled(cron = "15,30 * * * *")
	public void checkFile() {
		log.info("file check.......................");
		log.info("==================================");
	}
}
