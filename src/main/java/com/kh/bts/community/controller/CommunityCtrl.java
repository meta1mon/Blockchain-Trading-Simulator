package com.kh.bts.community.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.community.model.service.CommunityService;
import com.kh.bts.community.model.vo.Community;

@Controller
public class CommunityCtrl {
	@Autowired
	private CommunityService cmService;
	public static final int LIMIT = 10;

	// RequestMethod 생략 시, GET과 POST 둘 다 가능
	@RequestMapping(value = "clist", method = RequestMethod.GET)
	public ModelAndView communityListService(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "searchType", defaultValue = "1") int searchType, ModelAndView mv) {
		try {
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
			mv.setViewName("community/clist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	// 댓글 부분은 아예 빼버렸기 때문에, 상세 글은 나와도 댓글은 안보임
	@RequestMapping(value = "cDetail", method = RequestMethod.GET)
	public ModelAndView communityDetail(@RequestParam(name = "cno") int cno,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			mv.addObject("community", cmService.selectCommunity(0, cno));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("community/communityDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "cUpdateForm", method = RequestMethod.GET)
	public ModelAndView communityDetail(@RequestParam(name = "cno") int cno, ModelAndView mv) {
		try {
			mv.addObject("community", cmService.selectCommunity(1, cno));
			mv.setViewName("community/updateForm");
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
	public ModelAndView communityInsert(Community c, @RequestParam(name = "upfile", required = false) MultipartFile report,
			HttpServletRequest request, ModelAndView mv) {
		try {
			if (report != null && !report.equals(""))
				saveFile(report, request);
			c.setFilepath(report.getOriginalFilename());
			cmService.insertCommunity(c);
			mv.setViewName("redirect:clist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "cUpdate", method = RequestMethod.POST)
	public ModelAndView communityUpdate(Community c, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam("upfile") MultipartFile report, HttpServletRequest request, ModelAndView mv) {
		try {
			if (report != null && !report.equals("")) {
				removeFile(c.getFilepath(), request);
				saveFile(report, request);
			}
			c.setFilepath(report.getOriginalFilename());
			mv.addObject("cno", cmService.updateCommunity(c).getCno());
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:cDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "cDelete", method = RequestMethod.GET)
	public ModelAndView communityDelete(@RequestParam(name = "cno") int cno,
			@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, ModelAndView mv) {
		try {
			Community c = cmService.selectCommunity(1, cno);
			removeFile(c.getFilepath(), request);
			cmService.deleteCommunity(cno);
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:clist");
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
}
