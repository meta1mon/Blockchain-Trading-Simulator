package com.kh.bts.ranking.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.ranking.model.vo.Accumulative;
import com.kh.bts.ranking.model.vo.Daily;
import com.kh.bts.ranking.model.vo.Monthly;
import com.kh.bts.ranking.model.vo.Weekly;

@Repository("rankDao")
public class RankingDao {
	@Autowired
	private SqlSession sqlSession;

// 모든 랭킹 공통 함수
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

	// 수익률 반영(코인 보유 중인 회원들)
	public int updateRank(Daily vo, int criteria) {
		int result = 0;

		Acnt vo2 = sqlSession.selectOne("acnt.returnEmail", vo.getAcntno());
		vo.setEmail(vo2.getEmail());

		// 코인 평가금과 보유 현금액을 업데이트
		String nickname = sqlSession.selectOne("Member.returnNickname", vo.getEmail());
		vo.setNickname(nickname);
		if (criteria == 0) { // 누적 랭킹, 수익률 판단 기준은 오백만원!
			// 현질 반영
			vo.setNewesset(vo.getNewesset() + vo2.getCybcash());
			vo.setOldesset(5000000);
			result = sqlSession.update("ranking.updateAccumulative", vo);
		} else {
			long oldesset = sqlSession.selectOne("ranking.selectOldEsset", vo.getAcntno());
			vo.setOldesset(oldesset);
			if (criteria == 1) { // 일간
				// 현질 금액 제거
				long subtractCash = sqlSession.selectOne("ranking.subtractDailyCashLog", vo.getAcntno());
				vo.setNewesset(vo.getNewesset() + vo2.getCybcash() - subtractCash);
				result = sqlSession.update("ranking.updateDaily", vo);
			} else if (criteria == 2) { // 주간
				// 현질 금액 제거
				long subtractCash = sqlSession.selectOne("ranking.subtractWeeklyCashLog", vo.getAcntno());
				vo.setNewesset(vo.getNewesset() + vo2.getCybcash() - subtractCash);
				result = sqlSession.update("ranking.updateWeekly", vo);
			} else if (criteria == 3) { // 월간
				// 현질 금액 제거
				long subtractCash = sqlSession.selectOne("ranking.subtractMonthlyCashLog", vo.getAcntno());
				vo.setNewesset(vo.getNewesset() + vo2.getCybcash() - subtractCash);
				result = sqlSession.update("ranking.updateMonthly", vo);
			}
		}

		if (result > 0) {
			System.out.println(criteria + " 영역 수익률에 평가금 반영 성공");
		} else {
			System.out.println(criteria + " 영역 수익률에 평가금 반영 실패");
		}
		return result;
	}

	public int updateRankNoCoin(int criteria) {
		List<Acnt> list = sqlSession.selectList("coinacnt.selectNoCoinAcnt");
		int result = 0;
		for (int i = 0; i < list.size(); i++) {
			Acnt vo = list.get(i);
			long cybcash = vo.getCybcash();
			Daily vo2 = new Daily();
			vo2.setAcntno(vo.getAcntno());
			
			if (criteria == 0) { // 누적 랭킹, 수익률 판단 기준은 오백만원!
				// 현질 금액 반영
				vo2.setNewesset(cybcash);
				vo2.setOldesset(5000000);
				result = sqlSession.update("ranking.updateAccumulative", vo2);
				
			} else {
				long oldesset = sqlSession.selectOne("ranking.selectOldEsset", vo.getAcntno());
				vo2.setOldesset(oldesset);
				if (criteria == 1) { // 일간
					// 현질 금액 제거
					long subtractCash = sqlSession.selectOne("ranking.subtractDailyCashLog", vo.getAcntno());
					vo2.setNewesset(cybcash - subtractCash);
					result = sqlSession.update("ranking.updateDaily", vo2);

				} else if (criteria == 2) { // 주간
					// 현질 금액 제거
					long subtractCash = sqlSession.selectOne("ranking.subtractWeeklyCashLog", vo.getAcntno());
					vo2.setNewesset(cybcash - subtractCash);
					result = sqlSession.update("ranking.updateWeekly", vo2);

				} else if (criteria == 3) { // 월간
					// 현질 금액 제거
					long subtractCash = sqlSession.selectOne("ranking.subtractMonthlyCashLog", vo2.getAcntno());
					vo2.setNewesset(cybcash - subtractCash);
					result = sqlSession.update("ranking.updateMonthly", vo2);

				}
			}

			if (result > 0) {
				System.out.println(i + "번째 noCoin 유저 " + criteria + " 영역 변경 성공");
			} else {
				System.out.println(i + "번째 noCoin 유저 " + criteria + " 영역 변경 실패");
				break;
			}
		}
		return result;
	}

// Daily
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

	// 나의 Daily 랭킹 정보 가져오기
	public Daily selectMyDaily(String email) {
		Daily vo = sqlSession.selectOne("ranking.selectMyDaily", email);
		if (vo != null) {
			System.out.println("나의 데일리 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 데일리 랭킹 가져오기 실패");
		}
		return vo;
	}

	// 나의 Daily 랭킹 정보 가져오기
	public int selectMyDailyRank(String email) {
		int result = sqlSession.selectOne("ranking.selectMyDailyRank", email);
		if (result == 0) {
			System.out.println("나의 데일리 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 데일리 랭킹 가져오기 실패");
		}
		return result;
	}

// Accumulative
	// Accumulative 수익률 불러오기
	public List<Accumulative> selectAccumulative() {
		List<Accumulative> list = sqlSession.selectList("ranking.selectAccumulative");
		if (list != null) {
			System.out.println("데일리 랭킹 가져오기 성공");
		} else {
			System.out.println("데일리 랭킹 가져오기 실패");
		}
		return list;
	}

	// 나의 Accumulative 랭킹 정보 가져오기
	public Accumulative selectMyAccumulative(String email) {
		Accumulative vo = sqlSession.selectOne("ranking.selectMyAccumulative", email);
		if (vo != null) {
			System.out.println("나의 데일리 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 데일리 랭킹 가져오기 실패");
		}
		return vo;
	}

	// 나의 Accumulative 랭킹 정보 가져오기
	public int selectMyAccumulativeRank(String email) {
		int result = sqlSession.selectOne("ranking.selectMyAccumulativeRank", email);
		if (result == 0) {
			System.out.println("나의 데일리 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 데일리 랭킹 가져오기 실패");
		}
		return result;
	}

// Weekly
	// Weekly 수익률 불러오기
	public List<Weekly> selectWeekly() {
		List<Weekly> list = sqlSession.selectList("ranking.selectWeekly");
		if (list != null) {
			System.out.println("Weekly 랭킹 가져오기 성공");
		} else {
			System.out.println("Weekly 랭킹 가져오기 실패");
		}
		return list;
	}

	// 나의 Weekly 랭킹 정보 가져오기
	public Weekly selectMyWeekly(String email) {
		Weekly vo = sqlSession.selectOne("ranking.selectMyWeekly", email);
		if (vo != null) {
			System.out.println("나의 Weekly 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 Weekly 랭킹 가져오기 실패");
		}
		return vo;
	}

	// 나의 Weekly 랭킹 정보 가져오기
	public int selectMyWeeklyRank(String email) {
		int result = sqlSession.selectOne("ranking.selectMyWeeklyRank", email);
		if (result == 0) {
			System.out.println("나의 Weekly 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 Weekly 랭킹 가져오기 실패");
		}
		return result;
	}

// Monthly
	// Monthly 수익률 불러오기
	public List<Monthly> selectMonthly() {
		List<Monthly> list = sqlSession.selectList("ranking.selectMonthly");
		if (list != null) {
			System.out.println("Monthly 랭킹 가져오기 성공");
		} else {
			System.out.println("Monthly 랭킹 가져오기 실패");
		}
		return list;
	}

	// 나의 Monthly 랭킹 정보 가져오기
	public Monthly selectMyMonthly(String email) {
		Monthly vo = sqlSession.selectOne("ranking.selectMyMonthly", email);
		if (vo != null) {
			System.out.println("나의 Monthly 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 Monthly 랭킹 가져오기 실패");
		}
		return vo;
	}

	// 나의 Monthly 랭킹 정보 가져오기
	public int selectMyMonthlyRank(String email) {
		int result = sqlSession.selectOne("ranking.selectMyMonthlyRank", email);
		if (result == 0) {
			System.out.println("나의 Monthly 랭킹 가져오기 성공");
		} else {
			System.out.println("나의 Monthly 랭킹 가져오기 실패");
		}
		return result;
	}

}
