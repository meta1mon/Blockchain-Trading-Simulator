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

	// 랭킹 페이지로 이동
	@RequestMapping("/hirank")
	public ModelAndView hirank(ModelAndView mav) {
		List<CoinAcnt> list = rankService.selectAllCoinAcnt();
		mav.addObject("coinAcnt", list);
		mav.setViewName("rank/testRank");
		return mav;
	}

	// 코인계좌에 존재하는 코인만 가져오기
	@ResponseBody
	@RequestMapping("/insertRank")
	public int insertRank(@RequestParam(name = "acntno") String acntno,
			@RequestParam(name = "appraisal") long appraisal) {
		Daily vo = new Daily();
		vo.setAcntno(acntno);
		vo.setNewesset(appraisal);
		int result = rankService.insertDaily(vo);
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 코인계좌에 존재하는 코인만 가져오기
	@ResponseBody
	@RequestMapping("/coinLoad")
	public List<String> coinLoad(ModelAndView mav) {
		List<String> list = rankService.coinLoad();
		return list;
	}

	// 코인계좌에 존재하는 계좌만 가져오기
	@ResponseBody
	@RequestMapping("/coinLoad2")
	public List<String> coinLoad2() {
		List<String> list = rankService.selectAllAcntno();
		return list;
	}

	// 코인계좌의 모든 내용 불러오기
	@ResponseBody
	@RequestMapping("/coinAcntLoad")
	public List<CoinAcnt> coinAcntLoad() {
		List<CoinAcnt> list = rankService.selectAllCoinAcnt();
		return list;
	}

	// 랭킹 페이지로 이동
	@RequestMapping("/ranking")
	public ModelAndView ranking(ModelAndView mav) {
		mav.setViewName("rank/ranking");
		return mav;
	}

	// 랭킹 페이지로 이동
	@RequestMapping("/daily1")
	public ModelAndView asdfdaily(ModelAndView mav) {
		mav.setViewName("rank/liveRank");
		return mav;
	}

}
