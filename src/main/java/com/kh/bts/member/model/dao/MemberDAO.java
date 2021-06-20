package com.kh.bts.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.model.vo.Member;

@Repository("mDao")
public class MemberDAO {
	@Autowired
	SqlSession sqlSession;

	public int insertMember(Member vo, Acnt vo2) {
		int result = 0;
		result = sqlSession.insert("Member.insertMember", vo);
		if (result > 0) {
			System.out.println("memberDao에서 회원가입 성공");
			result = sqlSession.insert("Member.insertAcnt", vo2);
		} else {
			System.out.println("memberDao에서 회원가입 실패");
		}

		if (result > 0) {
			System.out.println("memberDao에서 계좌 삽입 성공");
		} else {
			System.out.println("memberDao에서 계좌 삽입 실패");
		}
		return result;
	}

	public int checkAcntno(String acntno) {
		return sqlSession.selectOne("Member.checkAcntno", acntno);
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
		sqlSession.selectOne("Member.createAuthKey", vo);
	}

	public void authMember(Member vo) {
		sqlSession.update("Member.authMember", vo);
	}

	public Member loginMember(Member vo) throws Exception {
		return sqlSession.selectOne("Member.loginMember", vo);
	}
}
