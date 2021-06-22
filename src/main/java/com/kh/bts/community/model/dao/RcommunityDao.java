package com.kh.bts.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.community.model.vo.Rcommunity;
import com.kh.bts.member.model.vo.Member;

@Repository("rcmDao")
public class RcommunityDao {
	@Autowired
	private SqlSession sqlSession;

	public int listCount() { // 댓글 전체 개수 조회
		return sqlSession.selectOne("rcommunity.countRcommunity");
	}
	
	public List<Rcommunity> selectList(String cno) { // 게시글에 해당하는 댓글 조회
		return sqlSession.selectList("rcommunity.selectRcommunityAll", cno);
	}
	
	public Rcommunity selectOne(String rno) { // 단일 댓글 조회
		return sqlSession.selectOne("rcommunity.selectRcommunity", rno);
	}
	
	public int updateReplyCnt(String cno) { // 댓글 입력 시 댓글 수 +1
		return sqlSession.update("rcommunity.updateReplyCnt", cno);
	}
	
	public int insertRcommunity(Rcommunity rc, String email) { // 댓글 입력
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		System.out.println("############################################## vo 받아");
		String rwriter = vo.getNickname();
		System.out.println("############################################## 닉네임  받아");
		rc.setRwriter(rwriter);
		int result = sqlSession.insert("rcommunity.insertRcommunity", rc);
		System.out.println("##############################" + result);
		int result2;
		
		if (result > 0) {
			System.out.println("댓글 추가 성공");
			result2 = sqlSession.update("rcommunity.updateReplyCnt", rc.getCno());
			if (result2 > 0) {
				System.out.println("댓글 개수 +1 성공");
			} else {
				System.out.println("댓글 개수 +1 실패");
			}
		} else {
			System.out.println("댓글 추가 실패");
		}
		
		return result;
	}
	
	public int updateRcommunity(Rcommunity rc) { // 댓글 수정
		System.out.println(rc);
		return sqlSession.update("rcommunity.updateRcommunity", rc);
	}
	
	public int deleteRcommunity(Rcommunity rc) { // 댓글 삭제
		System.out.println(rc);
		int result = sqlSession.delete("rcommunity.deleteRcommunity", rc);
		int result2;
		
		if (result > 0) {
			System.out.println("댓글 삭제 성공");
			result2 = sqlSession.update("rcommunity.updateDelReplyCnt", rc.getCno());
			if (result2 > 0) {
				System.out.println("댓글 개수 -1 성공");
			} else {
				System.out.println("댓글 개수 -1 실패");
			}
		} else {
			System.out.println("댓글 삭제 실패");
		}
		
		return result;
		
	}
}