package com.kh.bts.community.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.community.model.vo.Cdislike;
import com.kh.bts.member.model.vo.Member;

@Repository("dlDao")
public class CdislikeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertCdislike(String email, String cno) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		String writer = vo.getNickname();
		System.out.println("닉네임  받아옴");
		Cdislike cdislike = new Cdislike();
		cdislike.setEmail(writer);
		int result = sqlSession.insert("cdislike.insertDislike", cno);
		System.out.println("##############################" + result);
		int result2;
		
		if (result > 0) {
			System.out.println("비추천 추가 성공");
			result2 = sqlSession.update("cdislike.addDislikeCount", cdislike.getCno());
			if (result2 > 0) {
				System.out.println("비추천 +1 성공");
			} else {
				System.out.println("비추천 +1 실패");
			}
		} else {
			System.out.println("비추천 추가 실패");
		}
		
		return result;
	}
	
	public int deleteCdislike(String email, String cno) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		String writer = vo.getNickname();
		System.out.println("닉네임  받아옴");
		Cdislike cdislike = new Cdislike();
		cdislike.setEmail(writer);
		int result = sqlSession.delete("cdislike.deleteDisike", cno);
		System.out.println("##############################" + result);
		int result2;
		
		if (result > 0) {
			System.out.println("비추천 삭제 성공");
			result2 = sqlSession.update("cdislike.addDislikeCount", cdislike.getCno());
			if (result2 > 0) {
				System.out.println("비추천 -1 성공");
			} else {
				System.out.println("비추천 -1 실패");
			}
		} else {
			System.out.println("비추천 삭제 실패");
		}
		
		return result;
	}
	
	public int isDislike(String email, String cno) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		String writer = vo.getNickname();
		System.out.println("닉네임  받아옴");
		Cdislike cdislike = new Cdislike();
		cdislike.setEmail(writer);
		return sqlSession.selectOne("cdislike.selectIsDislike", cno);
	}
	
	public int dislikeCount(String cno) {
		return sqlSession.selectOne("cdislike.selectDislikeCount", cno);
	}
}