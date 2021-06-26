package com.kh.bts.cash.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.cash.model.vo.CashLog;

@Repository("cashDao")
public class CashDao {

	@Autowired
	private SqlSession sqlSession;

	// 결제 후, 충전금을 계좌에 충전해줌.
	public int chargeCash(String email, int won) {
		/*
		 * sqlSession.update("cash.chargeCash", vo1);
		 * sqlSession.selectOne("acnt.selectMyAcnt", vo1.getEmail());
		 * sqlSession.insert("cash.insertCashLog", vo2);
		 */
		return 0;
	}

}
