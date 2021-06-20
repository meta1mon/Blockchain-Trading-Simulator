package com.kh.bts.investment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.investment.model.service.WaitBoughtService;
import com.kh.bts.investment.model.vo.WaitBought;

@Controller
public class investmentCtrl {

	@Autowired
	private WaitBoughtService wbService;

	@RequestMapping("investmentpage")
	public ModelAndView MainPage(ModelAndView mav) {
		mav.setViewName("investment/investmentPage");
		return mav;
	}

	@RequestMapping("1sChart")
	public ModelAndView MainPaged(ModelAndView mav) {
		mav.setViewName("investment/1sChart");
		return mav;
	}

	@RequestMapping(value = "wbInsert", method = RequestMethod.POST)
	public ModelAndView boardInsert(WaitBought wb, HttpServletRequest request, ModelAndView mv) {
		try {

			int result = wbService.insertWaitBought(wb);
			System.out.println(result);
			if (result > 0) {
				System.out.println("insert성공");

			} else {
				System.out.println("insert실패");

			}
			// mv.setViewName("redirect:investmentpage");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "wblists", method = RequestMethod.GET)
	public ModelAndView boardListService(@RequestParam(name = "acntno") String acntno, ModelAndView mv) {
		try {
			List<WaitBought> result = wbService.selectListWaitBought(acntno);

			if (result != null) {
				System.out.println("select성공");

			} else {
				System.out.println("select실패");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "wbDelete", method = RequestMethod.GET)
	public ModelAndView boardDelete(@RequestParam(name = "ubno") int ubno, HttpServletRequest request,
			ModelAndView mv) {
		try {
//			WaitBought wb = wbService.selectListWaitBought(acntno);
			int result = wbService.deleteWaitBought(ubno);
			System.out.println(result);
			if (result > 0) {
				System.out.println("delete성공");
			} else {
				System.out.println("delete성공");
			}
			mv.addObject("currentPage");
//			mv.setViewName("redirect:wbDelete");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
}