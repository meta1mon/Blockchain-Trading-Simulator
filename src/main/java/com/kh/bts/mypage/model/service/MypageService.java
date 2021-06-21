package com.kh.bts.mypage.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;

public interface MypageService {
	public Member myInfo(String email);
	public int myInfoUpdate(Member vo);
	public int passwordUpdate(Member vo);
	public int bankPwUpdate(Acnt vo);
	public List<Community> myCommunity(String email);
	public int myDelete(String email);
}
