package com.kh.bts.member.model.service;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.model.vo.Member;

public interface MemberService {

	
	 int insertMember(Member vo, Acnt vo2) throws Exception;
	 String findPassword(Member vo) throws Exception;
	 int dupeEmail(Member vo) throws Exception;
	 int dupeNick(Member vo) throws Exception;
	 int checkAcntno(String acntno);
	 void createAuthkey(String email, String authkkey) throws Exception;
	 void createTempPassword(String email, String pw) throws Exception;
	 int updateMember(Member vo);
	 int deleteMember(String email);
	 void authMember(Member vo);
	 Member loginMember(Member vo) throws Exception;
	 String returnNickname(String email);
	 String returnAuth(String email);
	 int countMember();
	 int countTodayMember();

}
