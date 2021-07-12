package com.kh.bts.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
// 이메일, 닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	public int emailCheck(Member vo) throws Exception {
		int result = mService.dupeEmail(vo);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/nickcheck", method = RequestMethod.POST)
	public int nickCheck(Member vo) throws Exception {
		int result = mService.dupeNick(vo);
		return result;
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
			int check = mService.checkAcntno(tempAcntno);
			if (check == 0) {
				vo2.setAcntno(tempAcntno);
				flag = false;
			}
		}
		int result = mService.insertMember(vo, vo2);
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
		String auth = mService.returnAuth(email);
		if (nowLogin == null) {
			if(auth == "N" || auth.equals("N")) {
				request.setAttribute("errorMessage", "이메일 인증을 진행해주세요.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
				dispatcher.forward(request, response); 
			} else {
				logger.info("======= 없는 회원 및 회원 정보 불일치 =======");
				request.setAttribute("errorMessage", "로그인 정보가 올바르지 않습니다.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
				dispatcher.forward(request, response);
			}
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
	@RequestMapping(value = "/find")
	public ModelAndView findPw(ModelAndView mv) {
		mv.setViewName("member/findpw");
		return mv;
	}
	
//	비밀번호 찾기 눌렀을 때
	@RequestMapping(value="/findpassword", method = RequestMethod.POST)
	public void findPassword(@RequestParam("email") String email, Member vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("폼에서 받아온 email 값: " + email);
		int result = mService.dupeEmail(vo);
		String auth = mService.returnAuth(email);
		if(result == 1) {
			if(auth == "Y" || auth.equals("Y")) {
				request.setAttribute("errorMessage", "임시 비밀번호가 이메일로 전송되었습니다.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/find");
				dispatcher.forward(request, response);
				mService.findPassword(vo);
			} else {
				request.setAttribute("errorMessage", "이메일 인증을 진행해주세요.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/find");
				dispatcher.forward(request, response);
			}
		}else {
			request.setAttribute("errorMessage", "존재하지 않는  회원입니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/find");
			dispatcher.forward(request, response);
		}
		System.out.println(vo.toString());
		System.out.println(mService.findPassword(vo));
	}
}
