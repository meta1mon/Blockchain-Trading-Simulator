package com.kh.bts.member.model.service;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.model.vo.Member;

public interface MemberService {
	// 회원 가입
	public int insertMember(Member vo, Acnt vo2) throws Exception;
	// 비밀번호 찾기
	public String findPassword(Member vo) throws Exception;
	// 이메일, 닉네임 중복 검사
	public int dupeEmail(Member vo) throws Exception;
	public int dupeNick(Member vo) throws Exception;
	public int checkAcntno(String acntno);
	// 인증 번호 생성
	public void createAuthkey(String email, String authkkey) throws Exception;
	// 임시 비밀번호 생성
	public void createTempPassword(String email, String pw) throws Exception;
	// 회원 정보 수정
	public int updateMember(Member vo);
	// 회원 탈퇴
	public int deleteMember(String email);
	// 인증 여부 Y로 전환
	public void authMember(Member vo);
	// 로그인
	public Member loginMember(Member vo) throws Exception;
	public String returnAuth(String email);
	public String returnNickname(String email);
	// 회원 수
	public int countMember();
	public int countTodayMember();
}
