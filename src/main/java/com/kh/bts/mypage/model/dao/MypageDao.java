package com.kh.bts.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.member.model.vo.Member;

@Repository("myDao")
public class MypageDao {
	@Autowired
	private SqlSession sqlSession;
	
	public Member myInfo(String email) {
		return sqlSession.selectOne("Member.searchMember", email);
	}
}
