package com.kh.bts.acnt.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.CoinAcnt;


@Repository("coinacntDao")
public class CoinAcntDao {
	@Autowired
	private SqlSession sqlSession;

	public int updateMyCoinAcnt(CoinAcnt vo) {
		int result = 0;
		result = sqlSession.update("coinacnt.updateCoinAcnt", vo);
		return result;
	} 
	
	public List<CoinAcnt> allselectList(String acntno){
		return sqlSession.selectList("coinacnt.selectMyCoinAcnt", acntno);
	}
	public CoinAcnt countcoin(CoinAcnt vo){
		System.out.println("다오 안 " + vo.getAcntno());
		return sqlSession.selectOne("coinacnt.countCoin", vo);
	}
	public int insertCoinAcnt(CoinAcnt vo) { // 글 입력
		return sqlSession.insert("coinacnt.insertCoinAcnt", vo);
	}
	
	public int deleteWaitBought(int cano) {
		return sqlSession.delete("coinacnt.deleteCoinAcnt", cano);
	}

}
