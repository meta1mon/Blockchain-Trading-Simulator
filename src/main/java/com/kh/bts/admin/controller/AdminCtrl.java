package com.kh.bts.admin.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.admin.model.service.AdminService;
import com.kh.bts.cash.model.vo.Cash;
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

	public static final int LIMIT = 20;

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
				System.out.println("상품 등록 완료");
				out.print("<script>alert('상품 등록이 완료되었습니다.')</script>");
			} else {
				System.out.println("상품 등록 실패");
				out.print("<script>alert('상품 등록 실패')</script>");
			}
			out.print("<script>location.href='cashMR'</script>");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}
	
// 게시글 신고 등록
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

// 댓글 신고 등록
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

	@RequestMapping(value = "/cashR", method = RequestMethod.GET)
	public ModelAndView cashR(ModelAndView mv) {
		mv.setViewName("admin/cashRegister");
		return mv;
	}

	@RequestMapping(value = "/cashMR", method = RequestMethod.GET)
	public ModelAndView cashMR(ModelAndView mv) {
		mv.setViewName("admin/cashModifyRemove");
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
			mv.addObject("commentList", rcmService.selectList(cno));
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
	public ModelAndView noticeInsert(Community c,
			@RequestParam(name = "upfile", required = false) MultipartFile report, HttpServletRequest request,
			ModelAndView mv) {
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
}

