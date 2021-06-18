package com.kh.bts.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.news.model.service.NewsService;

@Controller
public class NewsCtrl {

	@Autowired
	private NewsService nService;

	@RequestMapping(value = "nlist", method = RequestMethod.GET)
	public ModelAndView newsListService(ModelAndView mv) {
		mv.setViewName("news/newsList");
		return mv;
	}
	
	@RequestMapping(value = "ncontent", method = RequestMethod.GET)
	public ModelAndView newsContentService(ModelAndView mv) {
		mv.setViewName("news/newsContent");
		return mv;
	}

}
