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
	public ModelAndView newsListService(@RequestParam(name = "news_keyword") String keyword, ModelAndView mv) {
		
		try {
			mv.addObject("keyword", keyword);
			mv.setViewName("news/newsList");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "ncontent", method = RequestMethod.GET)
	public ModelAndView newsContentService(@RequestParam(name = "news_id") int news_id, @RequestParam(name = "news_keyword") String news_keyword, ModelAndView mv) {
		try {
			mv.addObject("news_id", news_id);
			mv.addObject("news_keyword", news_keyword);
			
			mv.setViewName("news/newsContent");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		
		return mv;
	}

}
