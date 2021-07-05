package com.kh.bts.ranking.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.dao.RankingDao;
import com.kh.bts.ranking.model.vo.Daily;

@Service("rankService")
public class RankingServiceImpl implements RankingService{
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
	public int updateDaily(Daily vo) {
		return rankDao.updateDaily(vo);
	}

	@Override
	public List<Daily> selectDaily() {
		return rankDao.selectDaily();
	}

	@Transactional
	@Override
	public int updateDailyNoCoin() {
		return rankDao.updateDailyNoCoin();
	}

}
