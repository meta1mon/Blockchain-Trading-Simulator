package com.kh.bts;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class DayliRank {
	/* 매월 1일 0시 30분 명예의전당 입력 */
	@Scheduled(cron = "1 * * * * *")
	public void HofScheduler() {
		System.out.println("ㅗㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑ");
	}
}
