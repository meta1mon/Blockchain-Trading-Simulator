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
	
	public int insertRcommunity(Rcommunity rc, String email) { // 댓글 입력
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		String cwriter = vo.getNickname();
		rc.setRwriter(cwriter);
		int result = sqlSession.insert("community.insertCommunity", rc);
		return result;
	}
	
	public int updateRcommunity(Rcommunity rc) { // 댓글 수정
		System.out.println(rc);
		return sqlSession.update("rcommunity.updateRcommunity", rc);
	}
	
	public int deleteRcommunity(Rcommunity rc) { // 댓글 삭제
		System.out.println(rc);
		return sqlSession.delete("rcommunity.deleteRcommunity", rc);
	}
}