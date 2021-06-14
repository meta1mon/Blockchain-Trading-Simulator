package com.kh.bts.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
//	회원가입
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView insertMember(ModelAndView mv) {
		mv.setViewName("member/insert");
		return mv;
	}
	@RequestMapping(value="/insertmember", method=RequestMethod.POST)
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
	
//	회원가입 후 인증 대기 페이지
	@RequestMapping(value = "/authwait")
	public ModelAndView authWait(ModelAndView mv) {
		mv.setViewName("member/authwait");
		return mv;
	}
	
// 인증메일 클릭 시 이동 페이지
	@RequestMapping(value = "/emailconfirm", method = RequestMethod.GET)
	public String emailConfirm(Member vo, Model model) throws Exception { // 이메일인증
		mService.authMember(vo);
		model.addAttribute("vo", vo);
		return "home";
	}
	
//	로그인
	@RequestMapping(value = "/login")
	public ModelAndView loginMember(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	}
	
	@RequestMapping(value = "/loginmember")
	public String loginMember(Member vo, HttpServletRequest request) throws Exception {
		Member loginMember = mService.loginMember(vo);
		if (loginMember == null) {
			System.out.println("로그인 실패");
			return "redirect:/";
		} else {
			request.getSession().setAttribute("loginMember", loginMember);
		}
		return "home";
	}

}
