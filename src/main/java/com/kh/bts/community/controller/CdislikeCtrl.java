package com.kh.bts.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.community.model.service.CdislikeService;

@Controller
public class CdislikeCtrl {
	@Autowired
	private CdislikeService dlService;

	@RequestMapping(value = "cdislike", method = RequestMethod.POST)
	public void communityDetail(@RequestParam(name = "cno") String cno, HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) {

		// 이메일 가져오기
		String email = (String) request.getSession().getAttribute("loginMember");

		// 이미 추천했는지 판단
		int isDislike = 0;
		try {

			isDislike = dlService.isDislike(cno, email);
			System.out.println("컨트롤러 isDislike : " + isDislike);
			if (isDislike > 0) { // 이미 추천했음 => 추천 취소
				dlService.deleteCdislike(cno, email);

			} else if (isDislike == 0) { // 추천 안했음 => 추천 실행
				dlService.insertCdislike(cno, email);

			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
	}
}