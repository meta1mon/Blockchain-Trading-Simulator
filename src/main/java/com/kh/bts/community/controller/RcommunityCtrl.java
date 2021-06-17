package com.kh.bts.community.controller;

import java.io.PrintWriter;

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
			Rcommunity rc, ModelAndView mv) {
		try {
			rcmService.insertRcommunity(rc);
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
		PrintWriter out = null;
		JSONObject job = new JSONObject();
		try {
			job.put("ack", rcmService.updateRcommunity(rc));
			out = response.getWriter();
			out.append(job.toJSONString());
		} catch (Exception e) {
			job.put("ack", -1);
		} finally {
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping(value = "rcDelete", method = RequestMethod.POST)
	public void RcommunityDelete(HttpServletResponse response, Rcommunity rc) {
		
		PrintWriter out = null;
		JSONObject job = new JSONObject();
		try {
			job.put("ack", rcmService.deleteRcommunity(rc));
			out = response.getWriter();
			out.append(job.toJSONString());
		} catch (Exception e) {
			job.put("ack", -1);
		} finally {
			out.flush();
			out.close();
		}
	}
	
}