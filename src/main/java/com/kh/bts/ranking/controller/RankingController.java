package com.kh.bts.ranking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.service.RankingService;
import com.kh.bts.ranking.model.vo.Accumulative;
import com.kh.bts.ranking.model.vo.Daily;
import com.kh.bts.ranking.model.vo.Monthly;
import com.kh.bts.ranking.model.vo.Weekly;

@Controller
public class RankingController {
	@Autowired
	private RankingService rankService;

// 랭킹 페이지 이동 함수
	// Daily 랭킹 페이지로 이동
	@RequestMapping("/rankDaily")
	public ModelAndView rankDaily(ModelAndView mav, HttpSession session) {
		List<Daily> list = rankService.selectDaily();

		String email = (String) session.getAttribute("loginMember");
		Daily vo = null;
		int rank = 0;
		if (email != null) {
			vo = rankService.selectMyDaily(email);
			rank = rankService.selectMyDailyRank(email);
		}

		mav.addObject("first", list.get(0));
		mav.addObject("second", list.get(1));
		mav.addObject("third", list.get(2));
		mav.addObject("other", list);
		mav.addObject("my", vo);
		mav.addObject("rank", rank);
		mav.setViewName("rank/rankDaily");
		return mav;
	}

	// Accumulative 랭킹 페이지로 이동
	@RequestMapping("/rankAccumulative")
	public ModelAndView rankAccumulative(ModelAndView mav, HttpSession session) {
		List<Accumulative> list = rankService.selectAccumulative();

		String email = (String) session.getAttribute("loginMember");
		Accumulative vo = null;
		int rank = 0;
		if (email != null) {
			vo = rankService.selectMyAccumulative(email);
			rank = rankService.selectMyAccumulativeRank(email);
		}

		mav.addObject("first", list.get(0));
		mav.addObject("second", list.get(1));
		mav.addObject("third", list.get(2));
		mav.addObject("other", list);
		mav.addObject("my", vo);
		mav.addObject("rank", rank);
		mav.setViewName("rank/rankAccumulative");
		return mav;
	}

	// Weekly 랭킹 페이지로 이동
	@RequestMapping("/rankWeekly")
	public ModelAndView rankWeekly(ModelAndView mav, HttpSession session) {
		List<Weekly> list = rankService.selectWeekly();

		String email = (String) session.getAttribute("loginMember");
		Weekly vo = null;
		int rank = 0;
		if (email != null) {
			vo = rankService.selectMyWeekly(email);
			rank = rankService.selectMyWeeklyRank(email);
		}

		mav.addObject("first", list.get(0));
		mav.addObject("second", list.get(1));
		mav.addObject("third", list.get(2));
		mav.addObject("other", list);
		mav.addObject("my", vo);
		mav.addObject("rank", rank);
		mav.setViewName("rank/rankWeekly");
		return mav;
	}

	// Monthly 랭킹 페이지로 이동
	@RequestMapping("/rankMonthly")
	public ModelAndView rankMonthly(ModelAndView mav, HttpSession session) {
		List<Monthly> list = rankService.selectMonthly();

		String email = (String) session.getAttribute("loginMember");
		Monthly vo = null;
		int rank = 0;
		if (email != null) {
			vo = rankService.selectMyMonthly(email);
			rank = rankService.selectMyMonthlyRank(email);
		}

		mav.addObject("first", list.get(0));
		mav.addObject("second", list.get(1));
		mav.addObject("third", list.get(2));
		mav.addObject("other", list);
		mav.addObject("my", vo);
		mav.addObject("rank", rank);
		mav.setViewName("rank/rankMonthly");
		return mav;
	}

	/*
	 * // 현실 시간 반영하여 수익률 반영 함수 // 추후 admin header에 삽입할 예정.
	 * 
	 * @RequestMapping("/calcRank") public ModelAndView abc(ModelAndView mav) {
	 * mav.setViewName("rank/calcYield"); return mav; }
	 */

// 랭크의 ajax 공통 모듈
	// 코인계좌의 정보 가져오기
	@ResponseBody
	@RequestMapping("/calc")
	public List<CoinAcnt> calc(HttpServletResponse response) {
		List<CoinAcnt> list = rankService.selectAllCoinAcnt();
		System.out.println(list);
		return list;
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

	// 코인 보유자의 랭킹 처리
	@ResponseBody
	@RequestMapping("/updateRank")
	public int updateRank(@RequestParam(name = "acntno") String acntno,
			@RequestParam(name = "appraisal") long appraisal, @RequestParam(name = "criteria") int criteria) {
		Daily vo = new Daily();
		System.out.println("!@#!@#!@#!@#!@#!@#@!#!@3@");
		System.out.println(criteria);
		System.out.println(acntno);
		System.out.println(appraisal);
		vo.setAcntno(acntno);
		vo.setNewesset(appraisal);
		int result = rankService.updateRank(vo, criteria);
		System.out.println(result + "1이면 성공");
		return result;
	}

	// 코인 미보유자의 랭킹처리
	@ResponseBody
	@RequestMapping("/noCoinRank")
	public int noCoinRank(@RequestParam(name = "criteria") int criteria) {
		int result = 0;
		result = rankService.updateRankNoCoin(criteria);
		return result;
	}

}
