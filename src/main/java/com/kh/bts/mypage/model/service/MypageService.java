package com.kh.bts.mypage.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.vo.MyRcommunity;

public interface MypageService {
	Member myInfo(String email);

	int myInfoUpdate(Member vo);

	int passwordUpdate(Member vo);

	int bankPwUpdate(Acnt vo);

	List<Community> myCommunity(String email);

	int myDelete(String email);

	Acnt myAcnt(String email);

	List<MyRcommunity> selectMyRcommunity(String email);

	int myTotalCoin(Acnt vo);

	int coinListCount(Acnt vo);

	List<CoinAcnt> selectMyCoinAcnt(String acntno);

	List<CashLog> selectMyCashLog(String email);
}
