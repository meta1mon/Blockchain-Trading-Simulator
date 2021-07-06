package com.kh.bts.ranking.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.vo.Accumulative;
import com.kh.bts.ranking.model.vo.Daily;
import com.kh.bts.ranking.model.vo.Monthly;
import com.kh.bts.ranking.model.vo.Weekly;

public interface RankingService {
	List<String> coinLoad();

	List<String> selectAllAcntno();

	List<CoinAcnt> selectAllCoinAcnt();

	int updateRank(Daily vo, int criteria);

	List<Daily> selectDaily();

	int updateRankNoCoin(int criteria);

	Daily selectMyDaily(String email);

	int selectMyDailyRank(String email);

	List<Accumulative> selectAccumulative();

	Accumulative selectMyAccumulative(String email);

	int selectMyAccumulativeRank(String email);

	List<Weekly> selectWeekly();

	Weekly selectMyWeekly(String email);

	int selectMyWeeklyRank(String email);

	List<Monthly> selectMonthly();

	Monthly selectMyMonthly(String email);

	int selectMyMonthlyRank(String email);
}
