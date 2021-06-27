package com.kh.bts.news.controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewsCtrl {

	@RequestMapping(value = "nlist", method = RequestMethod.GET)
	public ModelAndView newsListService(ModelAndView mv) {
		mv.setViewName("news/newsList");
		return mv;
	}
	
	@RequestMapping(value = "ncontent", method = RequestMethod.GET)
	public ModelAndView newsContentService(@RequestParam(name = "news_id") int news_id, ModelAndView mv) {
		try {
			mv.addObject("news_id", news_id);
			
			mv.setViewName("news/newsContent");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		
		return mv;
	}

}
