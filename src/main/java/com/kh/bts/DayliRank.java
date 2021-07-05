package com.kh.bts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.controller.RankingController;
import com.kh.bts.ranking.model.service.RankingService;

@EnableScheduling
@Configuration
@Component
public class DayliRank {
	@Autowired
	private RankingService rankService;

	/* @Scheduled(cron = "0 0 0 * * ?") 매일 자정*/

	@Scheduled(cron = "0 0/1 * 1/1 * ?")
	public void gt() {
		// 매개변수 없어야 함. return값 없어야 함
		/*
		 * RankingController rc = new RankingController(); ModelAndView mav = new
		 * ModelAndView(); rc.calcYield(mav);
		 */
		
		System.out.println("hi~ 스케쥴 작업 진행 중~");
		
	}

}
