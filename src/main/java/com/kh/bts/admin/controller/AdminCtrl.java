package com.kh.bts.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.admin.model.service.AdminService;
import com.kh.bts.community.model.service.CommunityService;
import com.kh.bts.community.model.service.RcommunityService;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.community.model.vo.Rcommunity;
import com.kh.bts.member.model.service.MemberService;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

@Controller
@RequestMapping("/admin")
public class AdminCtrl {
	@Autowired
	private MemberService mService;

	@Autowired
	private CommunityService cmService;

	@Autowired
	private RcommunityService rcmService;

	@Autowired
	private AdminService aService;

	public static final int LIMIT = 30;

	@ModelAttribute("countMember")
	public int countMember() {
		return mService.countMember();
	}

	@ModelAttribute("countTodayMember")
	public int countTodayMember() {
		return mService.countTodayMember();
	}

	@ModelAttribute("totalCount")
	public int totalCount() {
		return cmService.totalCount();
	}

	@ModelAttribute("totalTodayCount")
	public int totalTodayCount() {
		return cmService.totalTodayCount();
	}

	@RequestMapping(value = "/reportCommunity")
	public void reportCommunity(HttpServletRequest request, HttpServletResponse response, Community vo,
			@RequestParam("creport") int crreason) {
		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("loginMember");
		String creporter = mService.returnNickname(loginEmail);

		Creport vo2 = new Creport();
		vo2.setCsubject(vo.getCsubject());
		vo2.setCrreason(crreason);
		vo2.setCrespondent(vo.getCwriter());
		vo2.setCreporter(creporter);
		vo2.setCcontent(vo.getCcontent());
		vo2.setCno(vo.getCno());
		int result = aService.insertCreport(vo2);
		PrintWriter out = null;
		if (result > 0) {
			System.out.println("신고 성공");
		} else {
			System.out.println("신고 실패");
		}
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

///// 아직 진행 중
	@ResponseBody
	@RequestMapping(value = "/reportRcommunity")
	public int reportRcommunity(HttpServletRequest request, Rreport vo) {
		System.out.println("컨트롤러 들어오~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println(vo.getRrreason() + "댓글 신고 사유");
		System.out.println(vo.getRno() + "댓글  번호");
		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("loginMember");
		String rreporter = mService.returnNickname(loginEmail);
		String oracleRno = setLPad(vo.getRno(), 5, "0");
		Rcommunity vo2 = rcmService.selectRcommunity(oracleRno);
		vo.setRno(oracleRno);
		vo.setRreporter(rreporter);
		vo.setCno(vo2.getCno());
		vo.setRcontent(vo2.getRcontent());
		vo.setRrespondent(vo2.getRwriter());
		vo.setRrreason(vo.getRrreason());

		int result = aService.insertRreport(vo);

		return result;
	}

	@RequestMapping(value = "")
	public ModelAndView adminMain(ModelAndView mv) {
		mv.setViewName("admin/adminMain");
		return mv;
	}

	@RequestMapping(value = "/acr", method = RequestMethod.GET)
	public ModelAndView acr(ModelAndView mv) {
		mv.setViewName("admin/afterCommunityReport");
		return mv;
	}

	@RequestMapping(value = "/arr", method = RequestMethod.GET)
	public ModelAndView arr(ModelAndView mv) {
		mv.setViewName("admin/afterReplyReport");
		return mv;
	}

	@RequestMapping(value = "/cr", method = RequestMethod.GET)
	public ModelAndView cr(ModelAndView mv) {
		mv.setViewName("admin/communityReport");
		return mv;
	}

	@RequestMapping(value = "/ml", method = RequestMethod.GET)
	public ModelAndView ml(ModelAndView mv) {
		mv.setViewName("admin/memberList");
		return mv;
	}

	@RequestMapping(value = "/nl", method = RequestMethod.GET)
	public ModelAndView nl(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "searchType", defaultValue = "1") int searchType, ModelAndView mv) {
		try {
			System.out.println("nl까지 들어옴");
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = cmService.totalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			if (keyword != null && !keyword.equals(""))
				mv.addObject("list", cmService.selectSearch(keyword, searchType));
			else
				mv.addObject("list", cmService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("admin/noticeList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "/nDetail", method = RequestMethod.GET)
	public ModelAndView communityDetail(@RequestParam(name = "cno") String cno,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			mv.addObject("community", cmService.selectCommunity(0, cno));
			mv.addObject("commentList", rcmService.selectList(cno));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("admin/noticeDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "rr", method = RequestMethod.GET)
	public ModelAndView rr(ModelAndView mv) {
		mv.setViewName("admin/replyReport");
		return mv;
	}

	@RequestMapping(value = "cll", method = RequestMethod.GET)
	public ModelAndView cashLogList(ModelAndView mv) {
		mv.setViewName("admin/cashLogList");
		return mv;
	}

	private String setLPad(String strContext, int iLen, String strChar) {
		String strResult = "";
		StringBuilder sbAddChar = new StringBuilder();
		for (int i = strContext.length(); i < iLen; i++) { // iLen길이 만큼 strChar문자로 채운다.
			sbAddChar.append(strChar);
		}
		strResult = sbAddChar + strContext; // LPAD이므로, 채울문자열 + 원래문자열로 Concate한다.
		return strResult;
	}

}
