package com.kh.bts.ranking.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.vo.Dayli;

public interface RankingService {
	public List<CoinAcnt> selectAllCoinAcnt();
}
