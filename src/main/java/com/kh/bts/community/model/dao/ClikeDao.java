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
	
	public int insertClike(String cno, String email) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		Clike clike = new Clike();
		clike.setCno(cno);
		clike.setEmail(email);
		int result = sqlSession.insert("clike.insertLike", clike);
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
	
	public int deleteClike(String cno, String email) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		Clike clike = new Clike();
		clike.setCno(cno);
		clike.setEmail(email);
		int result = sqlSession.delete("clike.deleteLike", cno);
		System.out.println("##############################" + result);
		int result2;
		
		if (result > 0) {
			System.out.println("추천 삭제 성공");
			result2 = sqlSession.update("clike.subLikeCount", cno);
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
	
	public int isLike(String cno, String email) {
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("Member vo 받아옴");
		System.out.println("isLike 수행 시도");
		Clike clike = new Clike();
		clike.setCno(cno);
		clike.setEmail(email);
		int result = sqlSession.selectOne("clike.selectIsLike", cno);
		return result;
	}
	
	public int likeCount(String cno) {
		return sqlSession.selectOne("clike.selectLikeCount", cno);
	}
	
}