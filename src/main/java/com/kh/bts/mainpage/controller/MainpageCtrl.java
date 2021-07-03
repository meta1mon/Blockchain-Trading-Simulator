package com.kh.bts.mainpage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainpageCtrl {

	@RequestMapping("/mainpage")
	public ModelAndView MainPage(ModelAndView mav) {
		mav.setViewName("main/mainPage");
		return mav;
	}

	@RequestMapping(value = "/")
	public String mainPage() {
		return "main/mainPage";
	}

}