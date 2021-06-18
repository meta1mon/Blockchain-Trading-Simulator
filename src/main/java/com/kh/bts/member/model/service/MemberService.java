package com.kh.bts.member.model.service;

import com.kh.bts.member.model.vo.Member;

public interface MemberService {
	public int insertMember(Member vo) throws Exception;
	public void createAuthkey(String email, String authkkey) throws Exception;
	public int updateMember(Member vo);
	public int deleteMember(String email);
	public void authMember(Member vo);
	public Member loginMember(Member vo) throws Exception;
}
