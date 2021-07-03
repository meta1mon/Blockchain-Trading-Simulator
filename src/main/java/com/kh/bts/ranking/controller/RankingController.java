package com.kh.bts.ranking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RankingController {

	@RequestMapping("/ranking")
	public ModelAndView ranking(ModelAndView mav) {
		mav.setViewName("rank/ranking");
		return mav;
	}
}
