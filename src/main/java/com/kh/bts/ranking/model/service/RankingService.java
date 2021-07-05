package com.kh.bts.ranking.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.vo.Accumulative;
import com.kh.bts.ranking.model.vo.Daily;

public interface RankingService {
	List<String> coinLoad();

	List<String> selectAllAcntno();

	List<CoinAcnt> selectAllCoinAcnt();

	int updateDaily(Daily vo, int criteria);

	List<Daily> selectDaily();

	int updateDailyNoCoin(int criteria);

	Daily selectMyDaily(String email);

	int selectMyDailyRank(String email);

	List<Accumulative> selectAccumulative();

	Accumulative selectMyAccumulative(String email);

	int selectMyAccumulativeRank(String email);
}
