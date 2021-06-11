package com.kh.bts.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adminCtrl {
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public ModelAndView adminMain(ModelAndView mv) {
			mv.setViewName("admin/main");
		return mv;
	}
}
