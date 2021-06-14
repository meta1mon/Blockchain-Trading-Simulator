package com.kh.bts.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.member.model.vo.Member;

@Repository("mDao")
public class MemberDAO {
	@Autowired SqlSession sqlSession;
	
	public int insertMember(Member vo){
		return sqlSession.insert("Member.insertMember", vo);
	}
	
	public int updateMember(Member vo) {
		return sqlSession.update("Member.updateMember", vo);
	}
	
	public int deleteMember(String email) {
		return sqlSession.delete("Member.deleteMember", email);
	}
	
	public void createAuthkey(String email, String authkey) throws Exception {
		Member vo = new Member();
		vo.setEmail(email);
		vo.setAuthkey(authkey);
		sqlSession.selectOne("Member.createAuthKey", email);
	}
	
	public void authMember(Member vo) {
		sqlSession.update("Member.authMember", vo);
	}
	
	public Member loginMember(Member vo) throws Exception{
		return sqlSession.selectOne("Member.loginMember", vo);
	}

}
