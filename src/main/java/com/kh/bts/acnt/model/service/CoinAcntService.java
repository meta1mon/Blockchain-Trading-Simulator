package com.kh.bts.acnt.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.CoinAcnt;

public interface CoinAcntService {
	List<CoinAcnt> allselectList(String acntno);

	CoinAcnt countcoin(CoinAcnt vo);

	int insertCoinAcnt(CoinAcnt vo);

	int deleteCoinAcnt(int cano);

	int updateCoinAcnt(CoinAcnt vo) throws Exception;
}
