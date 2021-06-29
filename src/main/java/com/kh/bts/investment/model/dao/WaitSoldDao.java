package com.kh.bts.investment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.investment.model.vo.WaitSold;

@Repository("wsDao")
public class WaitSoldDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertWaitSold(WaitSold vo) { // 글 입력
		return sqlSession.insert("waitSold.insertWaitSold", vo);
	}

	public int deleteWaitSold(int usno) {
		return sqlSession.delete("waitSold.deleteWaitSold", usno);
	}

	public List<WaitSold> selectList(String acntno) {
		return sqlSession.selectList("waitSold.selectListWaitSold", acntno);
	}

	public List<WaitSold> selectAllCoinListWaitSold() {
		return sqlSession.selectList("waitSold.selectAllCoinListWaitSold");
	}

	public List<WaitSold> selectAllListWaitSold() {
		return sqlSession.selectList("waitSold.selectAllListWaitSold");
	}
}
