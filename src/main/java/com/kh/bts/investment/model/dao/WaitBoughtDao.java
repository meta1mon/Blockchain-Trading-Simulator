package com.kh.bts.investment.model.dao;

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
}
