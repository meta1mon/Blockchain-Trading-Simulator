package com.kh.bts.ranking.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.vo.Daily;

public interface RankingService {
	public List<String> coinLoad();
	public List<String> selectAllAcntno();
	public List<CoinAcnt> selectAllCoinAcnt();
	public int insertDaily(Daily vo);
}
