package com.kh.bts.investment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.investment.model.vo.WaitBought;

@Repository("wbDao")
public class WaitBoughtDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertWaitBought(WaitBought vo) { // 글 입력
		return sqlSession.insert("waitBought.insertWaitBought", vo);
	}

	public int deleteWaitBought(int ubno) {
		return sqlSession.delete("waitBought.deleteWaitBought", ubno);
	}

	public List<WaitBought> selectList(String acntno) {
		return sqlSession.selectList("waitBought.selectListWaitBought", acntno);
	}

	public List<WaitBought> selectAllCoinListWaitBought() {
		return sqlSession.selectList("waitBought.selectAllCoinListWaitBought");
	}

	public List<WaitBought> selectAllListWaitBought() {
		return sqlSession.selectList("waitBought.selectAllListWaitBought");
	}
}