package com.kh.bts.mainpage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.community.model.service.CommunityService;
import com.kh.bts.community.model.vo.Community;

@Controller
public class MainpageCtrl {
	@Autowired
	private CommunityService cmService;

	@RequestMapping("/mainpage")
	public ModelAndView MainPage(ModelAndView mav) {
		List<Community> mainlist = cmService.selectMainAllCommunityList();
		System.out.println(mainlist);

		mav.addObject("maincommuList0", mainlist.get(0));
		mav.addObject("maincommuList1", mainlist.get(1));
		mav.addObject("maincommuList2", mainlist.get(2));
		mav.addObject("maincommuList3", mainlist.get(3));
		mav.setViewName("main/mainPage");
		return mav;
	}

	@RequestMapping(value = "/")
	public String mainPage() {
		return "main/mainPage";
	}

}