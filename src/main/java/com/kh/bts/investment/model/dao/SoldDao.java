package com.kh.bts.investment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.investment.model.vo.Sold;
import com.kh.bts.investment.model.vo.WaitSold;

@Repository("sDao")
public class SoldDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertSold(WaitSold vo) { // 글 입력
		// 체결 내역으로 옮기기
		int result = sqlSession.insert("sold.insertSold", vo);
		if (result > 0) {
			System.out.println("체결 내역으로 정상 이동");
			
			// 판매액만큼 돈을 넣어주기
			result = sqlSession.insert("acnt.plusSoldPrice", vo);
			if (result > 0) {
				System.out.println("계좌로 삽입 성공");
				
				// 미체결 내역 삭제
				result = sqlSession.delete("waitSold.afterSoldDelete", vo);
				if (result > 0) {
					System.out.println("미체결 내역 삭제 성공");
				} else {
					System.out.println("미체결 내역 삭제 실패");
				}
			} else {
				System.out.println("계좌로 삽입 실패");
			}
		} else {
			System.out.println("체결 내역으로 이동 실패");
		}
		return result;
	}

	public int deleteWaitSold(int usno) {
		return sqlSession.delete("sold.deleteSold", usno);
	}

	public List<Sold> selectList(String acntno) {
		return sqlSession.selectList("sold.selectListSold", acntno);
	}

}
