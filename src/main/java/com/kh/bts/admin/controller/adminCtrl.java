package com.kh.bts.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class adminCtrl {
	@RequestMapping(value = "/")
	public ModelAndView adminMain(ModelAndView mv) {
			mv.setViewName("admin/adminMain");
		return mv;
	}
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public ModelAndView adminHeader(ModelAndView mv) {
		mv.setViewName("admin/adminHeader");
		return mv;
	}
	@RequestMapping(value = "/aside", method = RequestMethod.GET)
	public ModelAndView adminAside(ModelAndView mv) {
		mv.setViewName("admin/adminAside");
		return mv;
	}
	@RequestMapping(value = "/acr", method = RequestMethod.GET)
	public ModelAndView acr(ModelAndView mv) {
		mv.setViewName("admin/afterCommunityReport");
		return mv;
	}
	@RequestMapping(value = "/arr", method = RequestMethod.GET)
	public ModelAndView arr(ModelAndView mv) {
		mv.setViewName("admin/afterReplyReport");
		return mv;
	}
	@RequestMapping(value = "/cr", method = RequestMethod.GET)
	public ModelAndView cr(ModelAndView mv) {
		mv.setViewName("admin/communityReport");
		return mv;
	}
	@RequestMapping(value = "/ml", method = RequestMethod.GET)
	public ModelAndView ml(ModelAndView mv) {
		mv.setViewName("admin/memberList");
		return mv;
	}
	@RequestMapping(value = "/nl", method = RequestMethod.GET)
	public ModelAndView nl(ModelAndView mv) {
		mv.setViewName("admin/noticeList");
		return mv;
	}
	@RequestMapping(value = "rr", method = RequestMethod.GET)
	public ModelAndView rr(ModelAndView mv) {
		mv.setViewName("admin/replyReport");
		return mv;
	}
}
