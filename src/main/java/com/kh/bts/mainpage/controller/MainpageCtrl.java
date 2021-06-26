package com.kh.bts.mainpage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.bts.admin.model.service.AdminService;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.service.MypageService;

@Controller
public class MainpageCtrl {

	@Autowired
	private AdminService aService;

	@Autowired
	private MypageService myService;

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

// 결제 api
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public void payment(@RequestParam("paymentPrice") int sellprice, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("payment 컨트롤러로 들어옴");
		System.out.println(sellprice + "변수 넘어오나?");
		String loginEmail = (String) request.getSession().getAttribute("loginMember");
		
		Member vo = myService.myInfo(loginEmail);
		
		PrintWriter out = null;
		Gson gson = new GsonBuilder().create();
		String jsonlist = gson.toJson(vo);
		
		try {
			out = response.getWriter();
			out.print(jsonlist);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}

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