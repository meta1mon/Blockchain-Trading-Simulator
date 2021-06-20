package com.kh.bts.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bts.HomeController;
import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.model.service.MemberService;
import com.kh.bts.member.model.vo.Member;

@Controller
public class MemberCtrl {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MemberService mService;

// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView insertMember(ModelAndView mv) {
		mv.setViewName("member/signup");
		return mv;
	}

// 회원가입 눌렀을 때
	@RequestMapping(value = "/signupmember", method = RequestMethod.POST)
	public void insertMember(Member vo, Acnt vo2, HttpServletResponse response) throws Exception {
		// 랜덤으로 계좌번호 생성(B와 8자리 숫자)
		boolean flag = true;
		while (flag) {
			String tempAcntno = "B";
			for (int i = 0; i < 8; i++) {
				tempAcntno += ((int) (Math.random() * 10));
			}
			System.out.println("임시계좌번호" + tempAcntno);
			int check = mService.checkAcntno(tempAcntno);
			if (check == 0) {
				vo2.setAcntno(tempAcntno);
				flag = false;
			}
		}
		System.out.println("정식 계좌번호" + vo2.getAcntno() );
		
		System.out.println("bankPw 입력값이 얼마냐?" + vo2.getBankPw());
		System.out.println("acnt 이메일 입력값이 얼마냐?" + vo2.getEmail());
		int result = mService.insertMember(vo, vo2);
		System.out.println(result);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}

//	회원가입 후 인증 대기
	@RequestMapping(value = "/authwait", method = RequestMethod.GET)
	public ModelAndView authWait(ModelAndView mv) {
		mv.setViewName("member/authwait");
		return mv;
	}

// 이메일 인증 링크 눌렀을 때
	@RequestMapping(value = "/emailconfirm", method = RequestMethod.GET)
	public void emailConfirm(Member vo, Model model, HttpServletResponse response) throws Exception {
		mService.authMember(vo);
		model.addAttribute("vo", vo);
		response.sendRedirect("mainpage");
	}

//	로그인
	@RequestMapping(value = "/login")
	public ModelAndView loginMember(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	}

	@RequestMapping(value = "/loginmember")
	public void loginMember(@RequestParam("email") String email, @RequestParam("pw") String pw, Member vo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Member nowLogin = mService.loginMember(vo);
		if (nowLogin == null) {
			logger.info("======= 회원 정보 불일치 =======");
			response.sendRedirect("login");
		} else {
			logger.info("======= 로그인 성공 =======");
			String loginMember = nowLogin.getEmail();
			session.setAttribute("loginMember", loginMember);
			response.sendRedirect("mainpage");
		}

	}

//	로그아웃
	@RequestMapping(value = "/logout")
	public void logoutMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute("loginMember");
		response.sendRedirect("mainpage");
	}

//	비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/findpassword")
	public ModelAndView findPw(ModelAndView mv) {
		mv.setViewName("member/findpw");
		return mv;
	}
}
