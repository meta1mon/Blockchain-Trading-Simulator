package com.kh.bts.aboutus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutUsCtrl {
	
	@RequestMapping("aboutus")
	public ModelAndView aboutUs(ModelAndView mav) {
		mav.setViewName("aboutus/aboutus");
		return mav;
	}
}
