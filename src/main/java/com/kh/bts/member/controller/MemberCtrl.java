package com.kh.bts.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.member.model.service.MemberService;
import com.kh.bts.member.model.vo.Member;

@Controller
public class MemberCtrl {
	@Autowired
	private MemberService mService;
	
// 회원가입
	@RequestMapping(value = "/signup")
	public ModelAndView insertMember(ModelAndView mv) {
		mv.setViewName("member/signup");
		return mv;
	}
	@RequestMapping(value="/signupmember", method=RequestMethod.POST)
	public void insertMember(Member vo, HttpServletResponse response) throws Exception {
		int result=mService.insertMember(vo);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(out != null) {
				out.flush();
				out.close();
			}			
		}
		System.out.println(vo.toString());
	}
	
//	회원가입 후 인증 대기
	@RequestMapping(value = "/authwait")
	public ModelAndView authWait(ModelAndView mv) {
		mv.setViewName("member/authwait");
		return mv;
	}
	
// 이메일 인증 링크 눌렀을 때
	@RequestMapping(value = "/emailconfirm", method = RequestMethod.GET)
	public String emailConfirm(Member vo, Model model) throws Exception {
		mService.authMember(vo);
		model.addAttribute("vo", vo);
		return "main/mainPage";
	}
	
//	로그인
	@RequestMapping(value = "/login")
	public ModelAndView loginMember(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	}
	
	@RequestMapping(value = "/loginmember")
	public void loginMember(Member vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Member loginMember = mService.loginMember(vo);
		if (loginMember == null) {
			response.sendRedirect("login");
		} else {
			if (!loginMember.getPw().equals(vo.getPw())) {
				response.sendRedirect("login");
			} else {
				session.setAttribute("loginMember", loginMember);
				System.out.println(loginMember.getEmail() + loginMember.getNickname());
				response.sendRedirect("mainpage");
			}
		}
	}
}
