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

	// 코인계좌에 존재하는 코인만 가져오기(코인수량 0은 제외)
	public List<String> coinLoad() {
		List<String> list = sqlSession.selectList("coinacnt.selectAllCoin");
		return list;
	}

	// 코인계좌에 존재하는 계좌만 가져오기(코인수량 0은 제외)
	public List<String> selectAllAcntno() {
		List<String> list = sqlSession.selectList("coinacnt.selectAllAcntno");
		return list;
	}

	// 코인계좌 전부 가져감(코인수량 0은 제외)
	public List<CoinAcnt> selectAllCoinAcnt() {
		List<CoinAcnt> list = sqlSession.selectList("coinacnt.selectAllCoinAcnt");
		return list;
	}

	// Daily 수익률 반영(코인 보유 중인 회원들)
	public int updateDaily(Daily vo) {
		Acnt vo2 = sqlSession.selectOne("acnt.returnEmail", vo.getAcntno());
		vo.setEmail(vo2.getEmail());
		
		// 코인 평가금과 보유 현금액을 업데이트
		vo.setNewesset(vo.getNewesset() + vo2.getCybcash());
		String nickname = sqlSession.selectOne("Member.returnNickname", vo.getEmail());
		vo.setNickname(nickname);
		long oldesset = sqlSession.selectOne("ranking.selectOldEsset", vo.getAcntno());
		
		vo.setOldesset(oldesset);
		int result = sqlSession.update("ranking.updateDaily", vo);
		if (result > 0) {
			System.out.println("데일리 수익률에 평가금 반영 성공");
		} else {
			System.out.println("데일리 수익률에 평가금 반영 실패");
		}
		return result;
	}
	
	public int updateDailyNoCoin() {
		List<Acnt> list = sqlSession.selectList("coinacnt.selectNoCoinAcnt");
		int result = 0;
		for (int i = 0; i < list.size(); i++) {
			Acnt vo = list.get(i);
			long cybcash = vo.getCybcash();
			Daily vo2 = new Daily();
			vo2.setNewesset(cybcash);
			vo2.setAcntno(vo.getAcntno());
			long oldesset = sqlSession.selectOne("ranking.selectOldEsset", vo.getAcntno());
			vo2.setOldesset(oldesset);
			result = sqlSession.update("ranking.updateDaily", vo2);
			if(result > 0) {
				System.out.println(i+"번째 noCoin 유저 변경 성공");
			} else {
				System.out.println(i+"번째 noCoin 유저 변경 실패");
				break;
			}
		}
		return result;
	}

	// Daily 수익률 불러오기
	public List<Daily> selectDaily() {
		List<Daily> list = sqlSession.selectList("ranking.selectDaily");
		if (list != null) {
			System.out.println("데일리 랭킹 가져오기 성공");
		} else {
			System.out.println("데일리 랭킹 가져오기 실패");
		}
		return list;
	}
	
	// 나의 데일리 랭킹 정보 가져오기
	public Daily selectMyDaily(String email) {
		Daily vo = sqlSession.selectOne("ranking.selectMyDaily", email);
		if (vo != null) {
			System.out.println("나의 데일리 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 데일리 랭킹 가져오기 실패");
		}
		return vo;
	}

	// 나의 데일리 랭킹 정보 가져오기
	public int selectMyDailyRank(String email) {
		int result = sqlSession.selectOne("ranking.selectMyDailyRank", email);
		if (result == 0) {
			System.out.println("나의 데일리 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 데일리 랭킹 가져오기 실패");
		}
		return result;
	}
	
	

}
