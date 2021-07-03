package com.kh.bts.ranking.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.vo.Dayli;

@Repository("rankDao")
public class RankingDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CoinAcnt> selectAllCoinAcnt() {
		List<CoinAcnt> list = sqlSession.selectList("coinacnt.selectAllCoinAcnt");
		return list;
	}
}
