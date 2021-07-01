package com.kh.bts.community.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.community.model.service.RcommunityService;
import com.kh.bts.community.model.vo.Rcommunity;
import com.kh.bts.member.model.vo.Member;

@Controller
public class RcommunityCtrl {

	@Autowired
	private Rcommunity rc;
	
	@Autowired
	private RcommunityService rcmService;

	@RequestMapping(value = "rcInsert", method = RequestMethod.GET)
	public ModelAndView RcommunityInsert(
			@RequestParam(name = "cno")String cno,
			@RequestParam(name = "page", defaultValue = "1") int page,
			Rcommunity rc, HttpServletRequest request, ModelAndView mv) {
		try {
			String email = (String) request.getSession().getAttribute("loginMember");
			int result = rcmService.insertRcommunity(rc, email);
			mv.addObject("cno", cno);
			mv.addObject("page", page);
			mv.setViewName("redirect:cDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "rcUpdate", method = RequestMethod.POST)
	public void RcommunityUpdate(HttpServletResponse response, Rcommunity rc) {
		System.out.println("들어오나??????????????");
		PrintWriter out = null;
		try {
			int result = rcmService.updateRcommunity(rc);
			out = response.getWriter();
			out.print(result);
		} catch (Exception e) {
		} finally {
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping(value = "rcDelete", method = RequestMethod.POST)
	public void RcommunityDelete(HttpServletResponse response, Rcommunity rc) {
		System.out.println("들오나 함수 딜맃트?");
		String oracleRno = setLPad(rc.getRno(), 5, "0");
		String oracleCno = setLPad(rc.getCno(), 5, "0");
		int result = rcmService.deleteRcommunity(oracleRno, oracleCno);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(result);
		} catch (Exception e) {
		} finally {
			out.flush();
			out.close();
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
	
}