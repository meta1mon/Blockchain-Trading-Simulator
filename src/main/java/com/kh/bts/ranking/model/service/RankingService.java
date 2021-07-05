package com.kh.bts.ranking.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.vo.Daily;

public interface RankingService {
	List<String> coinLoad();

	List<String> selectAllAcntno();

	List<CoinAcnt> selectAllCoinAcnt();

	int updateDaily(Daily vo);

	List<Daily> selectDaily();

	int updateDailyNoCoin();

	Daily selectMyDaily(String email);

	int selectMyDailyRank(String email);
}
