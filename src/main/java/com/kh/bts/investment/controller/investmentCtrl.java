package com.kh.bts.investment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.bts.investment.model.service.BoughtService;
import com.kh.bts.investment.model.service.SoldService;
import com.kh.bts.investment.model.service.WaitBoughtService;
import com.kh.bts.investment.model.service.WaitSoldService;
import com.kh.bts.investment.model.vo.Bought;
import com.kh.bts.investment.model.vo.Sold;
import com.kh.bts.investment.model.vo.WaitBought;
import com.kh.bts.investment.model.vo.WaitSold;

@Controller
public class investmentCtrl {

	@Autowired
	private WaitBoughtService wbService;

	@Autowired
	private WaitSoldService wsService;
	@Autowired
	private BoughtService bService;
	@Autowired
	private SoldService sService;

	@RequestMapping("investmentpage")
	public ModelAndView MainPage(ModelAndView mav) {
		System.out.println("메인페이지 1111111 아무거나");
		mav.setViewName("investment/investmentPage");
		System.out.println("메인페이지 22222222 아무거나");

		return mav;
	}

	@RequestMapping("1sChart")
	public ModelAndView MainPaged(ModelAndView mav) {
		mav.setViewName("investment/1sChart");
		return mav;
	}

	@RequestMapping(value = "wsInsert")
	public void WaitSoldInsert(WaitSold ws, HttpServletResponse response) {
		System.out.println(ws.getCoin() + "코인이름");
		System.out.println(ws.getSellcnt() + "코인수 ");
		System.out.println(ws.getAcntno() + "코인수 ");
		System.out.println(ws.getSellprice() + "코인수 ");
		int result = wsService.insertWaitSold(ws);
		PrintWriter out = null;
		try {
			if (result > 0) {
				System.out.println("insert성공");
			} else {
				System.out.println("insert실패");
			}
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}

	}

	@RequestMapping(value = "wbInsert")
	public void WaitBoughtInsert(WaitBought wb, HttpServletResponse response) {
		System.out.println(wb.getCoin() + "코인이름");
		int result = wbService.insertWaitBought(wb);
		PrintWriter out = null;
		try {
			if (result > 0) {
				System.out.println("insert성공");
				// 계좌 비밀번호 입력하면 => 계좌 비밀번호가 맞는가! 체크하고. 맞으면매수 매도 버튼 열림과 동시에, 현금액이랑 코인 계좌 정보 알아오고,
				// + 미체결 주문 내용까지
				// 매수 매도 버튼 눌렀을 때 미체결 테이블에 ㅑㅜㄴㄷ 하면서 동시에 ㅑㅜㄴㄷㄳ 포함한 전체 미체결 내역을 갖고 돌아ㅇ와
			} else {
				System.out.println("insert실패");
			}
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}

	}

// ajax 
	@RequestMapping(value = "ajwblists", method = RequestMethod.GET)
	public void WaitBoughtListService(@RequestParam(name="acntno") String acntno, HttpServletResponse response) {
		System.out.println(acntno);
		List<WaitBought> result = wbService.selectListWaitBought(acntno);
		System.out.println(result.size() + "크기 입니다.");
		PrintWriter out = null;
		Gson gson = new GsonBuilder().create();
		String jsonlist = gson.toJson(result);

		try {

			System.out.println("ajax select성공");

			out = response.getWriter();
			out.print(jsonlist);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

	@RequestMapping(value = "wbdelete", method = RequestMethod.GET)
	public void WaitBoughtdelete(@RequestParam(name="wbno") int wbno,HttpServletResponse response) {
		System.out.println("@@@@@@");
		//@RequestParam(name="wbno") int wbno,
		System.out.println(wbno);
		int result = wbService.deleteWaitBought(wbno);
		PrintWriter out = null;
		try {
			if (result > 0) {
				System.out.println("wbdelete 성공");
			} else {
				System.out.println("wbdelete 실패");
			}
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
		System.out.println("@@@@@@여기까지");
	
	}

//// ajax 아닌버젼
//	@RequestMapping(value = "wblists", method = RequestMethod.GET)
//	public ModelAndView WaitBoughtListService2(@RequestParam(name="acntno") String acntno,ModelAndView mv) {
//		// DB에서 ID 가지고 acnt 읽어오기
//		System.out.println("아무거나11111");
//		System.out.println(acntno);
//		List<WaitBought> result = wbService.selectListWaitBought("b12345678");
//		for (int i = 0; i < result.size(); i++) {
//			System.out.println(result.get(i).getCoin());
//		}
//		System.out.println(result.size() + "크기 입니다.");
//
//		mv.addObject("wblists", result);
//		mv.setViewName("investment/investmentPage");
//		System.out.println("아무거나2222222");
//		return mv;
//	}
}