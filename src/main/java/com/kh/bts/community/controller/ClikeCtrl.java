package com.kh.bts.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@RequestMapping(value = "clike", method = RequestMethod.GET)
	public ModelAndView communityDetail(@RequestParam(name = "cno") String cno, HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) {

		// 이미 추천했는지 판단
		int isLike = 0;

		try {
			String email = (String) request.getSession().getAttribute("loginMember");
			isLike = lService.insertClike(email, cno);
			if (isLike == 1) { // 이미 추천했음 => 추천 취소
				mv.addObject("community", lService.deleteClike(email, cno));

			} else if (isLike == 0) { // 추천 안했음 => 추천 실행
				mv.addObject("community", lService.insertClike(email, cno));

			}

			mv.setViewName("redirect:cDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
}
