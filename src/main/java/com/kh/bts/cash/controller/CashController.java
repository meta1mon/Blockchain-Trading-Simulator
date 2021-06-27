package com.kh.bts.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.admin.model.service.AdminService;
import com.kh.bts.cash.model.service.CashService;
import com.kh.bts.cash.model.vo.Cash;

@Controller
public class CashController {
	@Autowired
	private AdminService aService;

	@Autowired
	private CashService cashService;

	// 충전 상품 불러오기
	@RequestMapping(value = "/cashShop")
	public ModelAndView cashShop(Cash vo, ModelAndView mav) {
		List<Cash> list = aService.selectCashAll();
		if (list == null) {
			System.out.println("캐시 리스트 비어있음");
		} else {
			System.out.println("캐시 리스트 들어있음");
		}
		mav.addObject("cashList", list);
		mav.setViewName("cash/cashShop");
		return mav;
	}

	// 결제 후, 충전시켜주기
	@ResponseBody
	@RequestMapping(value = "/chargeCash")
	public int chargeCash(ModelAndView mav, @RequestParam("won") int won, @RequestParam("email") String email,
			@RequestParam("sellprice") int sellprice) {
		int result = 0;
		cashService.chargeCash(email, won, sellprice);
		return result;
	}

	@RequestMapping("/pay")
	public ModelAndView pay(ModelAndView mav) {
		mav.setViewName("cash/payAPI");
		return mav;
	}
}
