package com.kh.bts.investment.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class investmentCtrl {

	@RequestMapping("investmentpage")
	public ModelAndView MainPage(ModelAndView mav) {
		mav.setViewName("investment/investmentPage");
		return mav;
	}
	@RequestMapping("1sChart")
	public ModelAndView MainPaged(ModelAndView mav) {
		mav.setViewName("investment/1sChart");
		return mav;
	}
}