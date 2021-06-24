package com.kh.bts.mainpage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.admin.model.service.AdminService;
import com.kh.bts.cash.model.vo.Cash;

@Controller
public class MainpageCtrl {

	@Autowired
	private AdminService aService;

	@RequestMapping("/mainpage")
	public ModelAndView MainPage(ModelAndView mav) {
		mav.setViewName("main/mainPage");
		return mav;
	}

	// 충전 상품 불러오기
	@RequestMapping(value = "/cashShop")
	public ModelAndView cashShop(Cash vo, ModelAndView mav) {
		List<Cash> list = aService.selectCashAll();
		if (list == null) {
			System.out.println("캐시 리스트 비어있음");
		} else {
			System.out.println("캐시 리스트 들어있음");
		}
		System.out.println(list.get(0).getDiscountrate());
		mav.addObject("cashList", list);
		mav.setViewName("cash/cashShop");
		return mav;
	}

	@RequestMapping("/ranking")
	public ModelAndView ranking(ModelAndView mav) {
		mav.setViewName("rank/ranking");
		return mav;
	}

	@RequestMapping("/pay")
	public ModelAndView pay(ModelAndView mav) {
		mav.setViewName("cash/payAPI");
		return mav;
	}

	@RequestMapping(value = "/")
	public String mainPage() {
		return "main/mainPage";
	}

}