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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.investment.model.service.BoughtService;
import com.kh.bts.investment.model.service.SoldService;
import com.kh.bts.investment.model.service.WaitBoughtService;
import com.kh.bts.investment.model.service.WaitSoldService;
import com.kh.bts.investment.model.vo.Bought;
import com.kh.bts.investment.model.vo.Sold;
import com.kh.bts.investment.model.vo.WaitBought;
import com.kh.bts.investment.model.vo.WaitSold;
import com.kh.bts.member.model.vo.Member;

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
		mav.setViewName("investment/investmentPage");
		return mav;
	}

	@RequestMapping("1sChart")
	public ModelAndView MainPaged(ModelAndView mav) {
		mav.setViewName("investment/1sChart");
		return mav;
	}

	@RequestMapping(value = "sInsert", method = RequestMethod.POST)
	public ModelAndView SoldInsert(Sold s, HttpServletRequest request, ModelAndView mv) {
		try {

			int result = sService.insertSold(s);
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

	@RequestMapping(value = "sDelete", method = RequestMethod.GET)
	public ModelAndView SoldDelete(@RequestParam(name = "usno") int usno, HttpServletRequest request, ModelAndView mv) {
		try {
//			WaitBought wb = wbService.selectListWaitBought(acntno);
			int result = sService.deleteSold(usno);
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

	@RequestMapping(value = "slists", method = RequestMethod.GET)
	public ModelAndView SoldListService(@RequestParam(name = "acntno") String acntno, ModelAndView mv) {
		try {
			List<Sold> result = sService.selectListSold(acntno);

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

//////////////////////////////////////
	@RequestMapping(value = "bInsert", method = RequestMethod.POST)
	public ModelAndView BoughtInsert(Bought b, HttpServletRequest request, ModelAndView mv) {
		try {

			int result = bService.insertBought(b);
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

	@RequestMapping(value = "bDelete", method = RequestMethod.GET)
	public ModelAndView BoughtDelete(@RequestParam(name = "ubno") int ubno, HttpServletRequest request,
			ModelAndView mv) {
		try {
//WaitBought wb = wbService.selectListWaitBought(acntno);;
			int result = bService.deleteBought(ubno);
			System.out.println(result);
			if (result > 0) {
				System.out.println("delete성공");
			} else {
				System.out.println("delete성공");
			}
			mv.addObject("currentPage");
//mv.setViewName("redirect:wbDelete");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "blists", method = RequestMethod.GET)
	public ModelAndView BoughtListService(@RequestParam(name = "acntno") String acntno, ModelAndView mv) {
		try {
			List<Bought> result = bService.selectListBought(acntno);

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

//////////////////////////////////////
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

	@RequestMapping(value = "wsDelete", method = RequestMethod.GET)
	public ModelAndView WaitSoldDelete(@RequestParam(name = "usno") int usno, HttpServletRequest request,
			ModelAndView mv) {
		try {
//			WaitBought wb = wbService.selectListWaitBought(acntno);
			int result = wsService.deleteWaitSold(usno);
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

	@RequestMapping(value = "wslists", method = RequestMethod.GET)
	public ModelAndView WaitSoldListService(@RequestParam(name = "acntno") String acntno, ModelAndView mv) {
		try {
			List<WaitSold> result = wsService.selectListWaitSold(acntno);

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

	@RequestMapping(value = "wbInsert")
	public void WaitBoughtInsert(WaitBought wb, HttpServletResponse response) {
		System.out.println(wb.getCoin() + "코인이름");
		int result = wbService.insertWaitBought(wb);
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

	@RequestMapping(value = "wbDelete", method = RequestMethod.GET)
	public ModelAndView WaitBoughtDelete(@RequestParam(name = "ubno") int ubno, HttpServletRequest request,
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

	@RequestMapping(value = "wblists", method = RequestMethod.GET)
	public ModelAndView WaitBoughtListService(@RequestParam(name = "acntno") String acntno, ModelAndView mv) {
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
}