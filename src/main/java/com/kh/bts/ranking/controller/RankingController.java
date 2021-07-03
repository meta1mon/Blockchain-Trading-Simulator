package com.kh.bts.ranking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.service.RankingService;

@Controller
public class RankingController {
	@Autowired
	private RankingService rankService;

	// 일일 랭크 삽입
	@RequestMapping("/ranking")
	public ModelAndView dayli(ModelAndView mav) {
		List<CoinAcnt> list = rankService.selectAllCoinAcnt();
		mav.setViewName("rank/ranking");
		return mav;
	}

	// 랭킹 페이지로 이동
	@RequestMapping("/ranking")
	public ModelAndView ranking(ModelAndView mav) {
		mav.setViewName("rank/ranking");
		return mav;
	}
	
}
