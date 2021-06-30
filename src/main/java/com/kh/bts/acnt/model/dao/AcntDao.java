package com.kh.bts.acnt.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;



@Repository("acntDao")
public class AcntDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int updateMyAcnt(Acnt vo) {
		int result = 0;
		System.out.println(vo.getAcntno() + "계좌번호 다오 ");
		result = sqlSession.update("acnt.updateAcnt", vo);
		System.out.println("다오 안 리절트 값 " + result);
		return result;
	} 
	public Acnt selectMyAcnt(String email){
		return sqlSession.selectOne("acnt.selectMyAcnt", email);
	}
	public int cntAcnt(Acnt vo) {
		int result = 0;
		result = sqlSession.selectOne("acnt.cntAcnt", vo);
		return result;
	}
}
