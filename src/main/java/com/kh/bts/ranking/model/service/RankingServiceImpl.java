package com.kh.bts.ranking.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.dao.RankingDao;
import com.kh.bts.ranking.model.vo.Accumulative;
import com.kh.bts.ranking.model.vo.Daily;
import com.kh.bts.ranking.model.vo.Monthly;
import com.kh.bts.ranking.model.vo.Weekly;

@Service("rankService")
public class RankingServiceImpl implements RankingService {
	@Autowired
	private RankingDao rankDao;

	@Override
	public List<CoinAcnt> selectAllCoinAcnt() {
		return rankDao.selectAllCoinAcnt();
	}

	@Override
	public List<String> coinLoad() {
		return rankDao.coinLoad();
	}

	@Override
	public List<String> selectAllAcntno() {
		return rankDao.selectAllAcntno();
	}

	@Transactional
	@Override
	public int updateRank(Daily vo, int criteria) {
		return rankDao.updateRank(vo, criteria);
	}

	@Transactional
	@Override
	public int updateRankNoCoin(int criteria) {
		return rankDao.updateRankNoCoin(criteria);
	}

	@Override
	public List<Daily> selectDaily() {
		return rankDao.selectDaily();
	}

	@Override
	public Daily selectMyDaily(String email) {
		return rankDao.selectMyDaily(email);
	}

	@Override
	public int selectMyDailyRank(String email) {
		return rankDao.selectMyDailyRank(email);
	}

	@Override
	public List<Accumulative> selectAccumulative() {
		return rankDao.selectAccumulative();
	}

	@Override
	public Accumulative selectMyAccumulative(String email) {
		return rankDao.selectMyAccumulative(email);
	}

	@Override
	public int selectMyAccumulativeRank(String email) {
		return rankDao.selectMyAccumulativeRank(email);
	}

	@Override
	public List<Weekly> selectWeekly() {
		return rankDao.selectWeekly();
	}

	@Override
	public Weekly selectMyWeekly(String email) {
		return rankDao.selectMyWeekly(email);
	}

	@Override
	public int selectMyWeeklyRank(String email) {
		return rankDao.selectMyWeeklyRank(email);
	}

	@Override
	public List<Monthly> selectMonthly() {
		return rankDao.selectMonthly();
	}

	@Override
	public Monthly selectMyMonthly(String email) {
		return rankDao.selectMyMonthly(email);
	}

	@Override
	public int selectMyMonthlyRank(String email) {
		return rankDao.selectMyMonthlyRank(email);
	}

}
