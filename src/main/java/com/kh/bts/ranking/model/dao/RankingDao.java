package com.kh.bts.ranking.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.vo.Daily;

@Repository("rankDao")
public class RankingDao {
	@Autowired
	private SqlSession sqlSession;

	public List<String> coinLoad() {
		List<String> list = sqlSession.selectList("coinacnt.selectAllCoin");
		return list;
	}

	public List<String> selectAllAcntno() {
		List<String> list = sqlSession.selectList("coinacnt.selectAllAcntno");
		return list;
	}

	public List<CoinAcnt> selectAllCoinAcnt() {
		List<CoinAcnt> list = sqlSession.selectList("coinacnt.selectAllCoinAcnt");
		return list;
	}

	public int insertDaily(Daily vo) {
		String email = sqlSession.selectOne("acnt.returnEmail", vo.getAcntno());
		vo.setEmail(email);
		String nickname = sqlSession.selectOne("Member.returnNickname", email);
		vo.setNickname(nickname);
		// 초기값 100만원 줄건가?
		vo.setOldesset(1000000);
		int result = sqlSession.insert("ranking.insertDaily", vo);
		if (result > 0) {
			System.out.println("데일리 랭킹 삽입 성공");
		} else {
			System.out.println("데일리 랭킹 삽입 실패");
		}
		return result;
	}
}
