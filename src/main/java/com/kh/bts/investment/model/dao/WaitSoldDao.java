package com.kh.bts.investment.model.dao;

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
}
