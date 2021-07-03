package com.kh.bts.ranking.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.dao.RankingDao;
import com.kh.bts.ranking.model.vo.Dayli;

@Service("rankService")
public class RankingServiceImpl implements RankingService{
	@Autowired
	private RankingDao rankDao;
	
	@Override
	public List<CoinAcnt> selectAllCoinAcnt() {
		return rankDao.selectAllCoinAcnt();
	}

}
