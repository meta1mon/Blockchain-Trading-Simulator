package com.kh.bts.mainpage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.bts.admin.model.service.AdminService;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.service.MypageService;

@Controller
public class MainpageCtrl {

	@Autowired
	private AdminService aService;

	@Autowired
	private MypageService myService;

	@RequestMapping("/mainpage")
	public ModelAndView MainPage(ModelAndView mav) {
		mav.setViewName("main/mainPage");
		return mav;
	}

	@RequestMapping("/ranking")
	public ModelAndView ranking(ModelAndView mav) {
		mav.setViewName("rank/ranking");
		return mav;
	}

	@RequestMapping(value = "/")
	public String mainPage() {
		return "main/mainPage";
	}

}