package com.kh.bts.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;

@Repository("myDao")
public class MypageDao {
	@Autowired
	private SqlSession sqlSession;

	public Member myInfo(String email) {
		return sqlSession.selectOne("Member.searchMember", email);
	}

	public int myInfoUpdate(Member vo) {
		return sqlSession.update("Member.updateMember", vo);
	}

	public int passwordUpdate(Member vo) {
		return sqlSession.update("Member.updatePassword", vo);
	}

	public int bankPwUpdate(Acnt vo) {
		return sqlSession.update("Member.updateBankPw", vo);
	}

	public List<Community> myCommunity(String email) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if(vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		String cwriter = vo.getNickname();
		List<Community> list = sqlSession.selectList("community.myCommunity", cwriter);
		if(list == null) {
			System.out.println(cwriter + "인 닉네임으로 작성한 글이 없음");
		} else {
			System.out.println(cwriter + "인 닉네임으로 작성한 글이 있음");
		}
		return list;
	}

}
