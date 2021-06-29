package com.kh.bts.investment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.investment.model.vo.Bought;
import com.kh.bts.investment.model.vo.WaitBought;

@Repository("bDao")
public class BoughtDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertBought(WaitBought vo) { // 글 입력
		// 체결 내역으로 옮기기
		int result = sqlSession.insert("bought.insertBought", vo);
		if (result > 0) {
			System.out.println("체결 내역으로 정상 이동");
			// 코인 계좌에 넣기
			result = sqlSession.insert("coinacnt.afterBoughtCoinAcnt", vo);
			if (result > 0) {
				System.out.println("코인 계좌로 삽입 성공");
				// 미체결 내역 삭제
				result = sqlSession.delete("waitBought.afterBoughtDelete", vo);
				if (result > 0) {
					System.out.println("미체결 내역 삭제 성공");
				} else {
					System.out.println("미체결 내역 삭제 실패");
				}
			} else {
				System.out.println("코인 계좌로 삽입 실패");
			}

		} else {
			System.out.println("체결 내역으로 이동 실패");
		}

		return result;
	}

	public int deleteBought(int ubno) {
		return sqlSession.delete("bought.deleteBought", ubno);
	}

	public List<Bought> selectList(String acntno) {
		return sqlSession.selectList("bought.selectListBought", acntno);
	}
}
