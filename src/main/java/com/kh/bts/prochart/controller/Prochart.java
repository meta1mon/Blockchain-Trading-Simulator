package com.kh.bts.prochart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Prochart {
	@RequestMapping("prochart")
	public ModelAndView prochart(ModelAndView mav) {
		mav.setViewName("prochart/prochart");
		return mav;
	}
}
