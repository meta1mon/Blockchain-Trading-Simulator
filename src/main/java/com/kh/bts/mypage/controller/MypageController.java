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
	
	@RequestMapping(value = "mh")
	public ModelAndView myHeader(ModelAndView mv) {
		mv.setViewName("mypage/myHeader");
		return mv;
	}

	@RequestMapping(value = "/mi")
	public ModelAndView myInfo(ModelAndView mv) {
		mv.setViewName("mypage/myInfo");
		return mv;
	}

	@RequestMapping(value = "/miu")
	public ModelAndView myInfoUpdate(ModelAndView mv) {
		mv.setViewName("mypage/myInfoUpdate");
		return mv;
	}

	@RequestMapping(value = "/mpu")
	public ModelAndView mypagePasswordUpdate(ModelAndView mv) {
		mv.setViewName("mypage/myPasswordUpdate");
		return mv;
	}

	@RequestMapping(value = "/me")
	public ModelAndView myEssets(ModelAndView mv) {
		mv.setViewName("mypage/myEssets");
		return mv;
	}

	@RequestMapping(value = "/mee")
	public ModelAndView myEssetsEnter(ModelAndView mv) {
		mv.setViewName("mypage/myEssetsEnter");
		return mv;
	}

	@RequestMapping(value = "/mc")
	public ModelAndView myCommunity(ModelAndView mv) {
		mv.setViewName("mypage/myCommunity");
		return mv;
	}

	@RequestMapping(value = "/mr")
	public ModelAndView myReply(ModelAndView mv) {
		mv.setViewName("mypage/myReply");
		return mv;
	}

}
