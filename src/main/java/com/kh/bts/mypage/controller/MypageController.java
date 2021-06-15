package com.kh.bts.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	
	@RequestMapping(value = "")
	public ModelAndView mypageEnter(ModelAndView mv) {
		mv.setViewName("mypage/myPageEnter");
		return mv;
	}

	@RequestMapping(value = "/myInfo")
	public ModelAndView myInfo(ModelAndView mv) {
		mv.setViewName("mypage/myInfo");
		return mv;
	}

	@RequestMapping(value = "/myInfoUpdate")
	public ModelAndView myInfoUpdate(ModelAndView mv) {
		mv.setViewName("mypage/myInfoUpdate");
		return mv;
	}

	@RequestMapping(value = "/myPasswordUpdate")
	public ModelAndView mypagePasswordUpdate(ModelAndView mv) {
		mv.setViewName("mypage/myPasswordUpdate");
		return mv;
	}

	@RequestMapping(value = "/MyEssets")
	public ModelAndView myEssets(ModelAndView mv) {
		mv.setViewName("mypage/myEssets");
		return mv;
	}

	@RequestMapping(value = "/myEssetsEnter")
	public ModelAndView myEssetsEnter(ModelAndView mv) {
		mv.setViewName("mypage/myEssetsEnter");
		return mv;
	}

	@RequestMapping(value = "/myCommunity")
	public ModelAndView myCommunity(ModelAndView mv) {
		mv.setViewName("mypage/myCommunity");
		return mv;
	}

	@RequestMapping(value = "/myReply")
	public ModelAndView myReply(ModelAndView mv) {
		mv.setViewName("mypage/myReply");
		return mv;
	}

}
