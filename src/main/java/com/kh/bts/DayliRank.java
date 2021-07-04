package com.kh.bts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.service.RankingService;

@Component
public class DayliRank {
	@Autowired
	private RankingService rankService;

	// 매 분마다
	@Scheduled(cron = "0 0/1 * 1/1 * ?")
	public void gt() {
		System.out.println("ㅗㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑㅗㅑ");
	}
	
}
