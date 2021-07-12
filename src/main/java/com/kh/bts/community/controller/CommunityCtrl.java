package com.kh.bts.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.bts.Paging;
import com.kh.bts.community.model.service.CommunityService;
import com.kh.bts.community.model.service.RcommunityService;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.community.model.vo.UserRcommuniyCheck;
import com.kh.bts.member.model.service.MemberService;
import com.kh.bts.ranking.model.service.RankingService;
import com.kh.bts.ranking.model.vo.Accumulative;
import com.kh.bts.ranking.model.vo.Daily;

@Controller
public class CommunityCtrl {
	private String[] tagArr;
	@Autowired
	private CommunityService cmService;

	@Autowired
	private RcommunityService rcmService;

	@Autowired
	private RankingService rankService;

	@Autowired
	private MemberService mService;

	public static final int LIMIT = 10;

	@RequestMapping("insta")
	public ModelAndView insta(ModelAndView mav,
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "searchType", defaultValue = "1") int searchType) {
		Paging paging = new Paging(1, 9);
		List<Community> list = cmService.selectAllCommunityList(paging, keyword, searchType);
		mav.addObject("commuList", list);
		mav.addObject("nowPage", paging);
		if (!keyword.equals("")) {
			mav.addObject("isSearched", "y");
		}

		List<Accumulative> list1 = rankService.selectAccumulative();
		mav.addObject("first", list1.get(0));
		mav.addObject("second", list1.get(1));
		mav.addObject("third", list1.get(2));
		mav.addObject("other", list1);

		List<Daily> list2 = rankService.selectDaily();
		mav.addObject("dailyFirst", list2.get(0));
		mav.addObject("dailySecond", list2.get(1));
		mav.addObject("dailyThird", list2.get(2));
		mav.addObject("dailyOther", list2);

		mav.setViewName("community/mikrokosmos");
		return mav;
	}

	@RequestMapping("moreInsta")
	public void moreInsta(Paging vo, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		List<Community> list = cmService.selectAllCommunityList(vo, "", 0);
		PrintWriter out = null;
		Gson gson = new GsonBuilder().create();
		String jsonlist = gson.toJson(list);
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

	// 댓글 수 가져오기
	@ResponseBody
	@RequestMapping(value = "replyCount", method = RequestMethod.POST)
	public int replyCount(Community vo, HttpServletRequest request) {
		System.out.println(vo.getCno());
		int result = cmService.countReply(vo.getCno());
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "clist", method = RequestMethod.GET)
	public ModelAndView communityListService(@RequestParam(name = "page", defaultValue = "1") int page,
			ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listCount = cmService.totalCount(); // 공지사항 개수
			int maxPage = (int) ((double) listCount / LIMIT + 0.9); // 공지사항 개수 /

			mv.addObject("noticeList", cmService.selectNoticeList(1, 10));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("community/clist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "cDetail", method = RequestMethod.GET)
	public ModelAndView communityDetail(@RequestParam(name = "cno") String cno,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수

			Community vo = cmService.selectCommunity(0, cno);
			String writerEmail = cmService.returnEmail(vo.getCwriter());

			List<UserRcommuniyCheck> list = rcmService.selectRcommunityList(cno);

			mv.addObject("community", vo);
			mv.addObject("commentList", rcmService.selectRcommunityList(cno));
			mv.addObject("writerEmail", writerEmail);

			mv.addObject("currentPage", currentPage);
			mv.setViewName("community/communityDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "cWriteForm", method = RequestMethod.GET)
	public String CommunityInsertForm(ModelAndView mv) {
		return "community/writeForm";
	}

	@RequestMapping(value = "cInsert", method = RequestMethod.POST)
	public ModelAndView communityInsert(Community c,
			@RequestParam(name = "upfile", required = false) MultipartFile report, HttpServletRequest request,
			ModelAndView mv) {
		int flag = 0; // 공지사항과 인스타의 글 작성 페이지가 공통이므로, 작성 후에 어느 페이지로 돌아가야할 지 판단하는 용도. 0은 공지사항 1은 인스타
		try {
			if (report != null && !report.equals("")) {
				saveFile(report, request);
				c.setFilepath(report.getOriginalFilename());
			}
			if (c.getCsubject() == null) { // 제목 없음. 인스타에 작성한 부분임. 태그 삽입할 예정
				c.setCcontent(changeTag(c.getCcontent())); // 태그에 클래스(tag) 추가
				String tagStr = "";
				for (int i = 0; i < tagArr.length; i++) {
					tagStr += tagArr[i] + ",";
				}
				c.setCsubject(tagStr);
				flag = 1;
			}
			String email = (String) request.getSession().getAttribute("loginMember");
			int result = cmService.insertCommunity(c, email);
			if (result > 1) {
				System.out.println("글 작성 성공");
			} else {
				System.out.println("글 작성 실패");
			}
			if (flag == 1) {
				mv.setViewName("redirect:insta");
			} else if (flag == 0) {
				mv.setViewName("redirect:clist");
			}

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "cUpdateCheck", method = RequestMethod.POST)
	public int cUpdateCheck(Community vo, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("loginMember");
		String nowNickname = mService.returnNickname(email);
		int result = 0;
		if (vo.getCwriter().equals(nowNickname)) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	@RequestMapping(value = "cUpdateForm", method = RequestMethod.POST)
	public ModelAndView cUpdateForm(@RequestParam(name = "cno") String cno,
			@RequestParam(name = "fromInsta", defaultValue = "0") int fromInsta, ModelAndView mv) {
		System.out.println(cno);
		String oracleCno = setLPad(cno, 5, "0");
		try {
			mv.addObject("community", cmService.selectCommunity(1, oracleCno));
			// 공지사항과 인스타가 같은 업데이트폼을 쓰기 때문에, 어떤 곳에서 요청한 업데이트인지 확인하기 위한 용도임
			mv.addObject("fromInsta", fromInsta);
			mv.setViewName("community/updateForm");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "cUpdate", method = RequestMethod.POST)
	public ModelAndView cUpdate(Community c, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "fromInsta", defaultValue = "0") int fromInsta,
			@RequestParam("upfile") MultipartFile report, HttpServletRequest request, ModelAndView mv) {
		try {
			if (report != null && !report.equals("")) {
				removeFile(c.getFilepath(), request);
				saveFile(report, request);
			}
			c.setFilepath(report.getOriginalFilename());

			String email = (String) request.getSession().getAttribute("loginMember");

			// 태그에 클래스(tag) 추가
			if (fromInsta == 1) {
				c.setCcontent(changeTag(c.getCcontent()));
				String tagStr = "";
				for (int i = 0; i < tagArr.length; i++) {
					tagStr += tagArr[i] + ",";
				}
				c.setCsubject(tagStr);
			}

			mv.addObject("cno", cmService.updateCommunity(c, email).getCno());
			mv.addObject("currentPage", page);
			if (fromInsta == 1) { // 인스타에서 넘어온 업데이트
				mv.setViewName("redirect:insta");
			} else { // 공지사항에서 넘어온 업데이트
				mv.setViewName("redirect:cDetail");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "cDeleteCheck", method = RequestMethod.POST)
	public int cDeleteCheck(Community vo, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("loginMember");
		String nowNickname = mService.returnNickname(email);
		int result = 0;
		if (vo.getCwriter().equals(nowNickname)) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	@RequestMapping(value = "cDelete", method = RequestMethod.POST)
	public ModelAndView communityDelete(@RequestParam(name = "cno") String cno,
			@RequestParam(name = "fromInsta", defaultValue = "0") int fromInsta,
			@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, ModelAndView mv) {
		try {
			Community c = cmService.selectCommunity(1, cno);
			removeFile(c.getFilepath(), request);

			String email = (String) request.getSession().getAttribute("loginMember");
			cmService.deleteCommunity(cno, email);
			mv.addObject("currentPage", page);
			if (fromInsta == 1) {
				mv.setViewName("redirect:insta");
			} else {
				mv.setViewName("redirect:clist");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
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

	private String setLPad(String strContext, int iLen, String strChar) {
		String strResult = "";
		StringBuilder sbAddChar = new StringBuilder();
		for (int i = strContext.length(); i < iLen; i++) { // iLen길이 만큼 strChar문자로 채운다.
			sbAddChar.append(strChar);
		}
		strResult = sbAddChar + strContext; // LPAD이므로, 채울문자열 + 원래문자열로 Concate한다.
		return strResult;
	}

	private String changeTag(String content) {

		List<Integer> list1 = new ArrayList<Integer>();
		List<Integer> list2 = new ArrayList<Integer>();

		int n = 0;
		int charFrom = 0;
		int charTo = 0;
		// @부분 인덱스 뽑아오기
		while (true) {
			if (n == 0) {
				charFrom = content.indexOf("@");
				charTo = content.indexOf(" ", charFrom + 1);
			} else {
				charFrom = content.indexOf("@", charFrom + 1);
				charTo = content.indexOf(" ", charFrom + 1);
				if (charTo == -1) {
					charTo = content.indexOf("<", charFrom + 1);
				}

			}

			if (charFrom == -1) { // @ 없으면 함수 중지
				break;
			} else { // @ 있으면 리스트에 추가
				list1.add(charFrom);
				list2.add(charTo);
			}

			n++;
		}

		// 태그 문자를 배열로 받아옴
		tagArr = new String[list1.size()];
		for (int i = 0; i < tagArr.length; i++) {
			tagArr[i] = content.substring(list1.get(i), list2.get(i));
		}

		if (list1.size() > 0) {
			String newContent = content.substring(0, list1.get(0));
			for (int i = 0; i < list1.size() - 1; i++) {
				newContent += "<span class='tag'>" + tagArr[i] + "</span>";
				newContent += content.substring(list2.get(i), list1.get(i + 1));
			}
			newContent += "<span class='tag'>" + tagArr[list1.size() - 1] + "</span>";
			newContent += content.substring(list2.get(list1.size() - 1));
			return newContent;
		} else {
			return content;
		}
	}
}