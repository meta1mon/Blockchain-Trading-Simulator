package com.kh.bts.cash.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;

@Repository("cashDao")
public class CashDao {

	@Autowired
	private SqlSession sqlSession;
	// 전체 상품
	public List<Cash> selectTotalCash(int startPage, int limit){
		int startRow = (startPage -1)*limit; RowBounds row = new RowBounds(startRow, limit);
	    return sqlSession.selectList("cash.selectTotalCash", null, row);
	}
	// 전체 상품 개수
	public int countTotalCash() {
		int result=0;
		result = sqlSession.selectOne("cash.countTotalCash");
		return result;
	}

	// 현재 판매중인 충전 상품
	public List<Cash> selectNowCash() {
		return sqlSession.selectList("cash.selectNowCash");
	}
	
	// 판매 끝난 충전 상품
	public List<Cash> selectOldCash() {
		return sqlSession.selectList("cash.selectOldCash");
	}
	
	// 결제 후, 충전금을 계좌에 충전해줌.
	public int chargeCash(String email, int won, int sellprice) {
		Acnt vo = sqlSession.selectOne("acnt.selectMyAcnt", email);
		vo.setCybcash(won);
		int result = sqlSession.update("cash.chargeCash", vo);
		if (result > 0) {
			System.out.println("충전 완료");
			CashLog vo2 = new CashLog();
			vo2.setAcntno(vo.getAcntno());
			vo2.setEmail(email);
			vo2.setSellprice(sellprice);
			vo2.setWon(won);
			result = sqlSession.insert("cash.insertCashLog", vo2);
			if (result > 0) {
				System.out.println("캐시로그 기록 완료");
			} else {
				System.out.println("캐시로그 기록 실패");
			}
		} else {
			System.out.println("충전 실패");
		}

		return result;
	}

}
