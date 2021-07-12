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

// 마이페이지 진입 메커니즘 : 로그인 되어있는 아이디와 db의 비밀번호를 비교함
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

		// 새로 매퍼 만들기 귀찮아서 기존의 로그인 매퍼 사용함. 그래서 AUTH 가 y인걸 추가하는 것임
		vo.setAuth("Y");
		PrintWriter out = null;
		try {
			out = response.getWriter();

			Member loginMember = mService.loginMember(vo);

			if (loginMember != null) { // 로그인 성공
				out.print("<script>alert('환영합니다 " + loginMember.getNickname() + "님!')</script>");
				out.print("<script>location.href='mi'</script>)");
			} else { // 로그인 실패
				out.print("<script>alert('잘못된 비밀번호 입니다')</script>");
				out.print("<script>history.back()</script>");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

	// 비밀번호 변경
	@RequestMapping(value = "/passChange")
	public void passChange(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "pw") String pw) {
		logger.info("비밀번호 변경하러 들어옴");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		Member vo = new Member();
		vo.setEmail(email);
		vo.setPw(pw);
		int result = myService.passwordUpdate(vo);
		if (result > 0) {
			logger.info("비밀번호 변경 성공");
			request.getSession().removeAttribute("loginMember");
		} else {
			logger.info("비밀번호 변경 실패");
		}
		try {
			response.sendRedirect("/bts");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 계좌 비밀번호 변경
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
			logger.info("계좌 비밀번호 변경 성공");
			request.getSession().removeAttribute("loginMember");
		} else {
			logger.info("계좌 비밀번호 변경 실패");
		}
		try {
			response.sendRedirect("/bts");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 내 회원 정보 가져오기
	@RequestMapping(value = "/mi")
	public ModelAndView myInfo(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("loginMember");
		Member vo = myService.myInfo(email);
		mv.addObject("myInfo", vo);
		mv.setViewName("mypage/myInfo");
		return mv;
	}

	// 내 회원 정보 수정
	@RequestMapping(value = "/miu")
	public void myInfoUpdate(Member vo, HttpServletResponse response) {
		int result = myService.myInfoUpdate(vo);
		if (result > 0) {
			logger.info("회원정보 수정 완료");
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

	// 회원 자진 탈퇴
	@RequestMapping(value = "/mw")
	public void myDelete(Member vo, HttpServletRequest request, HttpServletResponse response) {
		String email = (String) request.getSession().getAttribute("loginMember");
		int result = myService.myDelete(email);
		if (result > 0) {
			logger.info("회원 탈퇴 성공");
		} else {
			logger.info("회원 탈퇴 실패");
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

// 나의 커뮤니티 불러오기
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

//	// 내 댓글 불러오기 -> 나의 커뮤니티로 통합
//	@RequestMapping(value = "/myRlist", method = RequestMethod.GET)
//	public ModelAndView myRlist(ModelAndView mv, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		String email = (String) session.getAttribute("loginMember");
//		List<MyRcommunity> list = myService.selectMyRcommunity(email);
//		if (list == null) {
//			System.out.println("댓글 없음");
//		} else {
//			System.out.println("댓글 있음");
//		}
//		mv.addObject("myRlist", list);
//		mv.setViewName("mypage/myRcommunity");
//		return mv;
//	}

// 내 자산 진입
	@RequestMapping(value = "/bankPwCheck", method = RequestMethod.POST)
	public void bankPwCheck(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "bankPw") int bankPw) {
		String email = (String) request.getSession().getAttribute("loginMember");
		System.out.println("이메일" + email);
		Acnt vo = myService.myAcnt(email);

		int result;
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if (vo == null) {
				logger.info("잘못된 접근");
				result = -1;
				out.print(result);
			} else {
				if (vo.getBankPw() == bankPw) {
					logger.info("계좌 비번 일치");
					result = 1;
				} else {
					logger.info("계좌 비번 불일치");
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
			System.out.println("비회원입니다");
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
			System.out.println("비회원입니다");
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
	
// 내 충전내역 -> 나의 자산으로 통합
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
