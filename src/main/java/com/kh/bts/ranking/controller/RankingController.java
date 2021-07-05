package com.kh.bts.ranking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.service.RankingService;
import com.kh.bts.ranking.model.vo.Daily;

@Controller
public class RankingController {
	@Autowired
	private RankingService rankService;
	
	// Daily 랭킹 페이지로 이동
	@RequestMapping("/ranking")
	public ModelAndView ranking(ModelAndView mav) {
		List<Daily> list = rankService.selectDaily();
		mav.addObject("first", list.get(0));
		mav.addObject("second", list.get(1));
		mav.addObject("third", list.get(2));
		mav.addObject("other", list);
		mav.setViewName("rank/ranking");
		return mav;
	}

	// 데일리 랭킹 계산하는 페이지로 이동(코인계좌 전부 가져감)
	@RequestMapping("/calc")
	public ModelAndView calcYield(ModelAndView mav) {
		List<CoinAcnt> list = rankService.selectAllCoinAcnt();
		mav.addObject("coinAcnt", list);
		mav.setViewName("rank/calcYield");
		return mav;
	}

	// 코인 보유자의 데일리 랭킹 변경
	@ResponseBody
	@RequestMapping("/updateRank")
	public int updateRank(@RequestParam(name = "acntno") String acntno,
			@RequestParam(name = "appraisal") long appraisal) {
		Daily vo = new Daily();
		vo.setAcntno(acntno);
		vo.setNewesset(appraisal);
		int result = rankService.updateDaily(vo);
		return result;
	}

	// 코인 미보유자의 데일리 랭킹처리
	@ResponseBody
	@RequestMapping("/noCoinRank")
	public int noCoinRank() {
		int result = rankService.updateDailyNoCoin();
		return result;
	}



	// 코인계좌에 존재하는 코인만 가져오기(코인수량 0은 제외)
	@ResponseBody
	@RequestMapping("/coinLoad")
	public List<String> coinLoad(ModelAndView mav) {
		List<String> list = rankService.coinLoad();
		return list;
	}

	// 코인계좌에 존재하는 계좌만 가져오기(코인수량 0은 제외)
	@ResponseBody
	@RequestMapping("/coinLoad2")
	public List<String> coinLoad2() {
		List<String> list = rankService.selectAllAcntno();
		return list;
	}

}
