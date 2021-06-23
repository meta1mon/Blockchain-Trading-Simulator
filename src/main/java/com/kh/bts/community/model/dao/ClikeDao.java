package com.kh.bts.community.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.community.model.vo.Clike;
import com.kh.bts.member.model.vo.Member;

@Repository("lDao")
public class ClikeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertClike(String email, String cno) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		String writer = vo.getNickname();
		System.out.println("닉네임  받아옴");
		Clike clike = new Clike();
		clike.setEmail(writer);
		int result = sqlSession.insert("clike.insertLike", cno);
		System.out.println("##############################" + result);
		int result2;
		
		if (result > 0) {
			System.out.println("추천 추가 성공");
			result2 = sqlSession.update("clike.addLikeCount", clike.getCno());
			if (result2 > 0) {
				System.out.println("추천 +1 성공");
			} else {
				System.out.println("추천 +1 실패");
			}
		} else {
			System.out.println("추천 추가 실패");
		}
		
		return result;
	}
	
	public int deleteClike(String email, String cno) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		String writer = vo.getNickname();
		System.out.println("닉네임  받아옴");
		Clike clike = new Clike();
		clike.setEmail(writer);
		int result = sqlSession.delete("clike.deleteLike", cno);
		System.out.println("##############################" + result);
		int result2;
		
		if (result > 0) {
			System.out.println("추천 삭제 성공");
			result2 = sqlSession.update("clike.addLikeCount", clike.getCno());
			if (result2 > 0) {
				System.out.println("추천 -1 성공");
			} else {
				System.out.println("추천 -1 실패");
			}
		} else {
			System.out.println("추천 삭제 실패");
		}
		
		return result;
	}
	
	public int isLike(String email, String cno) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		String writer = vo.getNickname();
		System.out.println("닉네임  받아옴");
		Clike clike = new Clike();
		clike.setEmail(writer);
		return sqlSession.selectOne("clike.selectIsLike", cno);
	}
	
	public int likeCount(String cno) {
		return sqlSession.selectOne("clike.selectLikeCount", cno);
	}
	
}