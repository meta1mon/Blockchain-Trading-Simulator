package com.kh.bts.mypage.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.HomeController;
import com.kh.bts.Paging;
import com.kh.bts.acnt.model.service.AcntService;
import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.cash.model.service.CashService;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.community.model.service.CommunityService;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.investment.model.service.BoughtService;
import com.kh.bts.investment.model.service.SoldService;
import com.kh.bts.investment.model.service.WaitBoughtService;
import com.kh.bts.investment.model.service.WaitSoldService;
import com.kh.bts.investment.model.vo.Bought;
import com.kh.bts.investment.model.vo.Sold;
import com.kh.bts.investment.model.vo.WaitBought;
import com.kh.bts.investment.model.vo.WaitSold;
import com.kh.bts.member.model.service.MemberService;
import com.kh.bts.member.model.service.MemberServiceImpl;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.service.MypageService;
import com.kh.bts.mypage.model.vo.MyRcommunity;
import com.kh.bts.ranking.model.vo.Accumulative;
import com.kh.bts.ranking.model.vo.Daily;

@Controller
@RequestMapping("mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberService mService;

	@Autowired
	private MypageService myService;

	@Autowired
	private AcntService acntService;

	@Autowired
	private WaitBoughtService wbService;
	@Autowired
	private WaitSoldService wsService;
	@Autowired
	private BoughtService bService;
	@Autowired
	private SoldService sService;
	@Autowired
	private CommunityService cmService;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ModelAndView mypageEnter(ModelAndView mv) {
		mv.setViewName("mypage/myPageEnter");
		return mv;
	}

// ??????????????? ?????? ???????????? : ????????? ???????????? ???????????? db??? ??????????????? ?????????
	@RequestMapping(value = "/admitEnter")
	public void admitEnter(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "password") String inputPass) {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("loginMember");

		Member vo = new Member();
		vo.setEmail(loginEmail);
		vo.setPw(inputPass);

		// ?????? ?????? ????????? ???????????? ????????? ????????? ?????? ?????????. ????????? AUTH ??? y?????? ???????????? ??????
		vo.setAuth("Y");
		PrintWriter out = null;
		try {
			out = response.getWriter();

			Member loginMember = mService.loginMember(vo);

			if (loginMember != null) { // ????????? ??????
				out.print("<script>alert('??????????????? " + loginMember.getNickname() + "???!')</script>");
				out.print("<script>location.href='mi'</script>)");
			} else { // ????????? ??????
				out.print("<script>alert('????????? ???????????? ?????????')</script>");
				out.print("<script>history.back()</script>");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

	// ???????????? ??????
	@RequestMapping(value = "/passChange")
	public void passChange(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "pw") String pw) {
		logger.info("???????????? ???????????? ?????????");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		Member vo = new Member();
		vo.setEmail(email);
		vo.setPw(pw);
		int result = myService.passwordUpdate(vo);
		if (result > 0) {
			logger.info("???????????? ?????? ??????");
			request.getSession().removeAttribute("loginMember");
		} else {
			logger.info("???????????? ?????? ??????");
		}
		try {
			response.sendRedirect("/bts");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// ?????? ???????????? ??????
	@RequestMapping(value = "/bankPwChange")
	public void bankPwChange(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "bankPw") int bankPw) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		Acnt vo = new Acnt();
		vo.setEmail(email);
		vo.setBankPw(bankPw);
		int result = myService.bankPwUpdate(vo);
		if (result > 0) {
			logger.info("?????? ???????????? ?????? ??????");
			request.getSession().removeAttribute("loginMember");
		} else {
			logger.info("?????? ???????????? ?????? ??????");
		}
		try {
			response.sendRedirect("/bts");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// ??? ?????? ?????? ????????????
	@RequestMapping(value = "/mi")
	public ModelAndView myInfo(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		Member vo = myService.myInfo(email);
		mv.addObject("myInfo", vo);
		mv.setViewName("mypage/myInfo");
		return mv;
	}

	// ??? ?????? ?????? ??????
	@RequestMapping(value = "/miu")
	public void myInfoUpdate(Member vo, HttpServletResponse response) {
		int result = myService.myInfoUpdate(vo);
		if (result > 0) {
			logger.info("???????????? ?????? ??????");
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}

	}

	// ?????? ?????? ??????
	@RequestMapping(value = "/mw")
	public void myDelete(Member vo, HttpServletRequest request, HttpServletResponse response) {
		String email = (String) request.getSession().getAttribute("loginMember");
		int result = myService.myDelete(email);
		if (result > 0) {
			logger.info("?????? ?????? ??????");
		} else {
			logger.info("?????? ?????? ??????");
		}
		PrintWriter out = null;
		try {
			request.getSession().removeAttribute("loginMember");
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}

	}

// ?????? ???????????? ????????????
	@RequestMapping(value = "/myClist", method = RequestMethod.GET)
	public ModelAndView myClist(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		List<Community> list = myService.myCommunity(email);
		List<MyRcommunity> replyList = myService.selectMyRcommunity(email);
		mv.addObject("myClist", list);
		mv.addObject("myRlist", replyList);
		mv.setViewName("mypage/myCommunity");
		return mv;
	}

//	// ??? ?????? ???????????? -> ?????? ??????????????? ??????
//	@RequestMapping(value = "/myRlist", method = RequestMethod.GET)
//	public ModelAndView myRlist(ModelAndView mv, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		String email = (String) session.getAttribute("loginMember");
//		List<MyRcommunity> list = myService.selectMyRcommunity(email);
//		if (list == null) {
//			System.out.println("?????? ??????");
//		} else {
//			System.out.println("?????? ??????");
//		}
//		mv.addObject("myRlist", list);
//		mv.setViewName("mypage/myRcommunity");
//		return mv;
//	}

// ??? ?????? ??????
	@RequestMapping(value = "/bankPwCheck", method = RequestMethod.POST)
	public void bankPwCheck(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "bankPw") int bankPw) {
		String email = (String) request.getSession().getAttribute("loginMember");
		System.out.println("?????????" + email);
		Acnt vo = myService.myAcnt(email);

		int result;
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if (vo == null) {
				logger.info("????????? ??????");
				result = -1;
				out.print(result);
			} else {
				if (vo.getBankPw() == bankPw) {
					logger.info("?????? ?????? ??????");
					result = 1;
				} else {
					logger.info("?????? ?????? ?????????");
					result = 0;
				}
			}
			out.println(result);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

	@RequestMapping(value = "/mpu")
	public ModelAndView mypagePasswordUpdate(ModelAndView mv, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("loginMember");
		if (loginEmail == null) {
			System.out.println("??????????????????");
		} else {
			Acnt result = acntService.selectMyAcnt(loginEmail);
			mv.addObject("acnt", result);
		}
		mv.setViewName("mypage/myPasswordUpdate");
		return mv;
	}

	@RequestMapping(value = "/me")
	public ModelAndView myEssets(ModelAndView mv, Member vo, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("loginMember");

		if (loginEmail == null) {
			System.out.println("??????????????????");
		} else {
			mv.addObject("email", loginEmail);
			Acnt acntResult = acntService.selectMyAcnt(loginEmail);

			int totalCoin = myService.myTotalCoin(acntResult);

			long totalAssets = totalCoin + acntResult.getCybcash();

			int coinListCount = myService.coinListCount(acntResult);

			List<CoinAcnt> coinList = myService.selectMyCoinAcnt(acntResult.getAcntno());

			List<WaitBought> wBoughtResult = wbService.selectListWaitBought(acntResult.getAcntno());
			List<WaitSold> wSoldResult = wsService.selectListWaitSold(acntResult.getAcntno());
			List<Bought> boughtResult = bService.selectListBought(acntResult.getAcntno());
			List<Sold> soldResult = sService.selectListSold(acntResult.getAcntno());
			List<CashLog> cashLogList = myService.selectMyCashLog(loginEmail);
			int cashLogListCount = myService.selectMyCashLog(loginEmail).size();

			mv.addObject("acnt", acntResult);
			mv.addObject("totalCoin", totalCoin);
			mv.addObject("totalAssets", totalAssets);
			mv.addObject("coinListCount", coinListCount);
			mv.addObject("coinList", coinList);
			mv.addObject("wBoughtResult", wBoughtResult);
			mv.addObject("wSoldResult", wSoldResult);
			mv.addObject("boughtResult", boughtResult);
			mv.addObject("soldResult", soldResult);
			mv.addObject("cashLogList", cashLogList);
			mv.addObject("cashLogListCount", cashLogListCount);

		}

		mv.setViewName("mypage/myEssets");
		return mv;
	}

	@RequestMapping(value = "/mee")
	public ModelAndView myEssetsEnter(ModelAndView mv) {
		mv.setViewName("mypage/myEssetsEnter");
		return mv;
	}

//	@RequestMapping(value = "/mr")
//	public ModelAndView myReply(ModelAndView mv) {
//		mv.setViewName("mypage/myRcommunity");
//		return mv;
//	}
	
	@RequestMapping(value = "/myinsta")
	public ModelAndView myInsta(ModelAndView mv, @RequestParam(name = "cno") String cno) {
		mv.addObject("community", cmService.selectCommunity(1, cno));

		mv.setViewName("mypage/myInsta");
		return mv;
	}
	
	@RequestMapping(value = "/myinstareply")
	public ModelAndView myInstaReply(ModelAndView mv, @RequestParam(name = "cno") String cno) {
		mv.addObject("community", cmService.selectCommunity(1, cno));

		mv.setViewName("mypage/myInstaReply");
		return mv;
	}
	
// ??? ???????????? -> ?????? ???????????? ??????
//	@RequestMapping(value = "/mcl")
//	public ModelAndView myCashLog(ModelAndView mv, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		String loginEmail = (String) session.getAttribute("loginMember");
//		try {
//			mv.addObject("email", loginEmail);
//			System.out.println(loginEmail);
//			mv.addObject("list", myService.selectMyCashLog(loginEmail));
//			System.out.println(myService.selectMyCashLog(loginEmail));
//			mv.addObject("listCount", myService.selectMyCashLog(loginEmail).size());
//		} catch (Exception e) {
//
//		}
//		mv.setViewName("mypage/myCashLog");
//		return mv;
//	}

}
