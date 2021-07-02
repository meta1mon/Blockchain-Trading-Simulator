package com.kh.bts.mypage.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.vo.MyRcommunity;

public interface MypageService {
	public Member myInfo(String email);
	public int myInfoUpdate(Member vo);
	public int passwordUpdate(Member vo);
	public int bankPwUpdate(Acnt vo);
	public List<Community> myCommunity(String email);
	public int myDelete(String email);
	public Acnt myAcnt(String email);
	public List<MyRcommunity> selectMyRcommunity(String email);
	public int myTotalCoin(Acnt vo);
	public int coinListCount(Acnt vo);
	public List<CoinAcnt> selectMyCoinAcnt(String acntno);
}
