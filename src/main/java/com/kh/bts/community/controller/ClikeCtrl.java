package com.kh.bts.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.community.model.service.ClikeService;

@Controller
public class ClikeCtrl {
	@Autowired
	private ClikeService lService;

//	@RequestMapping(value = "cUpdateForm", method = RequestMethod.GET)
//	public ModelAndView communityDetail(@RequestParam(name = "cno") String cno, ModelAndView mv) {
//		try {
//			mv.addObject("community", lService.selectCommunity(1, cno));
//			mv.setViewName("community/updateForm");
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//
//	}
}
