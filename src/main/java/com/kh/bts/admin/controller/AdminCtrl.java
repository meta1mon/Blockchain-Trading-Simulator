package com.kh.bts.admin.controller;

import java.io.File;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.HomeController;
import com.kh.bts.acnt.model.service.AcntService;
import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.admin.model.service.AdminService;
import com.kh.bts.cash.model.service.CashService;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.community.model.service.CommunityService;
import com.kh.bts.community.model.service.RcommunityService;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.community.model.vo.Rcommunity;
import com.kh.bts.member.model.service.MemberService;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.service.MypageService;
import com.kh.bts.report.model.vo.Acreport;
import com.kh.bts.report.model.vo.Arreport;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

@Controller
@RequestMapping("/admin")
public class AdminCtrl {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MemberService mService;

	@Autowired
	private CommunityService cmService;

	@Autowired
	private RcommunityService rcmService;

	@Autowired
	private AdminService aService;

	@Autowired
	private MypageService myService;

	@Autowired
	private CashService cashService;

	public static final int LIMIT = 10;

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

	@ModelAttribute("totalCybcash")
	public long totalCybcash() {
		return aService.totalCybcash();
	}

	@ModelAttribute("countTodayWon")
	public long countTodayWon() {
		return aService.countTodayWon();
	}

	@ModelAttribute("countCreport")
	public int countCreport() {
		return aService.countCreport();
	}

	@ModelAttribute("countRreport")
	public int countRreport() {
		return aService.countRreport();
	}

// 충전 상품 목록 불러오기
	@RequestMapping(value = "/cash", method = RequestMethod.GET)
	public ModelAndView cashR(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			int listCount = cashService.countTotalCash();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.addObject("list", cashService.selectTotalCash(currentPage, LIMIT));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		mv.setViewName("admin/cashEdit");
		return mv;
	}

//	충전 상품 수정
	@ResponseBody
	@RequestMapping(value = "/updateCash", method = RequestMethod.POST)
	public int updateCash(Cash vo, HttpServletResponse response) {
		int result = aService.updateCash(vo);
		System.out.println(result);
		return result;
	}

//	충전 상품 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCash", method = RequestMethod.POST)
	public int deleteCash(Cash vo, HttpServletResponse response) {
		int result = aService.deleteCash(vo);
		return result;
	}

// 충전 상품 등록
	@RequestMapping(value = "/cashRegister", method = RequestMethod.POST)
	public void cashRegister(Cash vo, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		vo.setSellprice(vo.getPrice() * (100 - vo.getDiscountrate()) / 100);
		int result = aService.registerCash(vo);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if (result > 0) {
				out.print("<script>alert('상품 등록이 완료되었습니다.')</script>");
			} else {
				out.print("<script>alert('상품 등록에 실패하였습니다.')</script>");
			}
			out.print("<script>location.href='cash'</script>");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

// 게시글 신고 등록
	@ResponseBody
	@RequestMapping(value = "/reportCommunity", method = RequestMethod.POST)
	public int reportCommunity(HttpServletRequest request, @RequestParam("cno") String cno,
			@RequestParam("creport") int crreason) {
		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("loginMember");
		String creporter = mService.returnNickname(loginEmail);
		Community vo = cmService.selectCommunity(1, cno);
		Creport vo2 = new Creport();
		vo2.setCsubject(vo.getCsubject());
		vo2.setCrreason(crreason);
		vo2.setCrespondent(vo.getCwriter());
		vo2.setCreporter(creporter);
		vo2.setCcontent(vo.getCcontent());
		vo2.setCno(vo.getCno());
		int result = aService.insertCreport(vo2);
		if (result > 0) {
			System.out.println("신고 성공");
		} else {
			System.out.println("신고 실패");
		}
		return result;
	}

// 게시글 신고 처리
	@RequestMapping(value = "/dealcr", method = RequestMethod.POST)
	public void insertAcreport(Acreport vo, String crno, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String cstatus = request.getParameter("cstatus");
		String cno = request.getParameter("cno");
		if (cstatus.equals("accept")) { // 수리일 때 select creport where cno list 반환 --> acreport insert --> cno 가져와서 delete
			int result = aService.insertAcreportAccept(vo); // acreport에 삽입
			int result2 = cmService.deleteCommunity(cno); // community에서 삭제
		} else if (cstatus.equals("deny")) { // 반려일 때
			int result = aService.insertAcreportDeny(vo); // acreport에 삽입
			int result2 = aService.deleteCreport(cno); // creport에서 삭제
		}
	}

//	댓글 신고 등록
	@ResponseBody
	@RequestMapping(value = "/reportRcommunity")
	public int reportRcommunity(HttpServletRequest request, Rreport vo) {
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

		int result = aService.insertRreport(vo);

		return result;
	}

	// 댓글 신고 처리
	@RequestMapping(value = "/dealrr", method = RequestMethod.POST)
	public void insertArreport(Arreport vo, String rrno, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String rstatus = request.getParameter("rstatus");
		String cno = request.getParameter("cno");
		String rno = request.getParameter("rno");
		if (rstatus.equals("accept")) { // 수리일 때
			int result = aService.insertArreportAccept(vo); // arreport에 삽입
			int result2 = aService.deleteRreport(rrno); // rreport에서 삭제
			int result3 = rcmService.deleteRcommunity(rno, cno); // Rcommunity에서 삭제
			System.out.println(result3);
		} else if (rstatus.equals("deny")) { // 반려일 때
			int result = aService.insertArreportDeny(vo); // arreport에 삽입
			int result2 = aService.deleteRreport(rrno); // rreport에서 삭제
		}
	}

	@RequestMapping(value = "")
	public ModelAndView adminMain(ModelAndView mv) {
		mv.setViewName("admin/adminMain");
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
				// mv.addObject("list", cmService.selectSearch(currentPage, LIMIT, keyword,
				// searchType));
				mv.addObject("list", cmService.selectNoticeSearch(currentPage, LIMIT, keyword, searchType));
			else
				mv.addObject("list", cmService.selectNoticeList(currentPage, LIMIT));
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
	public ModelAndView noticeDetail(@RequestParam(name = "cno") String cno,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			mv.addObject("community", cmService.selectCommunity(0, cno));
			mv.addObject("commentList", rcmService.selectRcommunityList(cno));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("admin/noticeDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "nWrite", method = RequestMethod.GET)
	public String noticeInsertForm(ModelAndView mv) {
		return "admin/noticeWrite";
	}

	@RequestMapping(value = "nInsert", method = RequestMethod.POST)
	public ModelAndView noticeInsert(Community c, @RequestParam(name = "upfile", required = false) MultipartFile report,
			HttpServletRequest request, ModelAndView mv) {
		try {
			if (report != null && !report.equals(""))
				saveFile(report, request);
			c.setFilepath(report.getOriginalFilename());

			String email = (String) request.getSession().getAttribute("loginMember");
			int result = cmService.insertCommunity(c, email);
			mv.setViewName("redirect:nl");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "nUpdateForm", method = RequestMethod.GET)
	public ModelAndView communityDetail(@RequestParam(name = "cno") String cno, ModelAndView mv) {
		try {
			mv.addObject("community", cmService.selectCommunity(1, cno));
			mv.setViewName("admin/noticeUpdate");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "nUpdate", method = RequestMethod.POST)
	public ModelAndView communityUpdate(Community c, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam("upfile") MultipartFile report, HttpServletRequest request, ModelAndView mv) {
		try {
			if (report != null && !report.equals("")) {
				removeFile(c.getFilepath(), request);
				saveFile(report, request);
			}
			c.setFilepath(report.getOriginalFilename());

			String email = (String) request.getSession().getAttribute("loginMember");
			mv.addObject("cno", cmService.updateCommunity(c, email).getCno());
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:nDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "nDelete", method = RequestMethod.GET)
	public ModelAndView communityDelete(@RequestParam(name = "cno") String cno,
			@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, ModelAndView mv) {
		try {
			Community c = cmService.selectCommunity(1, cno);
			removeFile(c.getFilepath(), request);

			String email = (String) request.getSession().getAttribute("loginMember");
			cmService.deleteCommunity(cno, email);
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:nl");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
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

	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}
		String filePath = null;
		try {
			// 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);
			filePath = folder + "\\" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}

	private void removeFile(String filepath, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		String filePath = savePath + "\\" + filepath;
		try {
			// 파일 저장
			System.out.println(filepath + "을 삭제합니다.");
			System.out.println("기존 저장 경로 : " + savePath);
			File delFile = new File(filePath);
			delFile.delete();
			System.out.println("파일 삭제가 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
	}

//	회원 리스트
	@RequestMapping(value = "/ml", method = RequestMethod.GET)
	public ModelAndView ml(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "searchType", defaultValue = "1") int searchType, ModelAndView mv) {

		try {
			int currentPage = page;
			int listCount = mService.countMember();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", aService.adminSearchMember(keyword, searchType));
			} else {
				mv.addObject("list", aService.adminListMember(currentPage, LIMIT));
			}
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		mv.setViewName("admin/memberList");
		return mv;
	}

//	회원 삭제
	@ResponseBody
	@RequestMapping(value = "/md")
	public int deleteMember(String email, HttpServletRequest request, HttpServletResponse response) throws IOException {
		int result = myService.myDelete(email);
		if (result > 0) {
			logger.info("회원 탈퇴 성공");
		} else {
			logger.info("회원 탈퇴 실패");
		}
		return result;
	}

//	캐시로그 불러오기
	@RequestMapping(value = "/cll")
	public ModelAndView cashLogList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			int listCount = aService.countCashLog();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", aService.searchCashLog(keyword));
			} else {
				mv.addObject("list", aService.selectCashLog(currentPage, LIMIT));
			}
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		mv.setViewName("admin/cashLogList");
		return mv;
	}

//	게시판 신고 목록
	@RequestMapping(value = "/cr", method = RequestMethod.GET)
	public ModelAndView cr(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			int listCount = aService.countCreport();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			mv.addObject("list", aService.selectCreport(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		mv.setViewName("admin/communityReport");
		return mv;
	}

//	게시판 신고 처리 목록
	@RequestMapping(value = "/acr", method = RequestMethod.GET)
	public ModelAndView acr(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv,
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "cstatus", defaultValue = "", required = false) String cstatus,
			@RequestParam(name = "searchType", defaultValue = "1") int searchType) {
		try {
			int currentPage = page;
			int listCount = aService.countAcreport();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", aService.searchAcreport(keyword, searchType));
			} else if (cstatus != null && !cstatus.equals("")) {
				mv.addObject("list", aService.searchAcreportByCstatus(cstatus, searchType));
			} else {
				mv.addObject("list", aService.selectAcreport(currentPage, LIMIT));
			}
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		mv.setViewName("admin/afterCommunityReport");
		return mv;
	}

//	댓글 신고 목록
	@RequestMapping(value = "/rr", method = RequestMethod.GET)
	public ModelAndView rr(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			int listCount = aService.countRreport();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			mv.addObject("list", aService.selectRreport(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		mv.setViewName("admin/replyReport");
		return mv;
	}

//	댓글 신고 처리 목록
	@RequestMapping(value = "/arr", method = RequestMethod.GET)
	public ModelAndView arr(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv,
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "rstatus", defaultValue = "", required = false) String rstatus,
			@RequestParam(name = "searchType", defaultValue = "1") int searchType) {
		try {
			int currentPage = page;
			int listCount = aService.countArreport();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);

			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", aService.searchArreport(keyword, searchType));
			} else if (rstatus != null && !rstatus.equals("")) {
				mv.addObject("list", aService.searchArreportByRstatus(rstatus, searchType));
			} else {
				mv.addObject("list", aService.selectArreport(currentPage, LIMIT));
			}
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		mv.setViewName("admin/afterReplyReport");
		return mv;
	}
}
