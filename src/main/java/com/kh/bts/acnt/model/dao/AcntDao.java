package com.kh.bts.acnt.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;



@Repository("acntDao")
public class AcntDao {
	@Autowired
	private SqlSession sqlSession;
	
	public Acnt selectMyAcnt(String email){
		return sqlSession.selectOne("acnt.selectMyAcnt", email);
	}
	public int cntAcnt(Acnt vo) {
		int result = 0;
		result = sqlSession.selectOne("acnt.cntAcnt", vo);
		return result;
	}
}
