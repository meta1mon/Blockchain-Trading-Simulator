package com.kh.bts.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.community.model.vo.Rcommunity;

@Repository("rcmDao")
public class RcommunityDao {
	@Autowired
	private SqlSession sqlSession;

	public List<Rcommunity> selectList(String cno) { // 게시글에 해당하는 댓글 조회
		return sqlSession.selectList("Rcommunity.selectRcommunityAll", cno);
	}
	
	public Rcommunity selectOne(String rno) { // 단일 댓글 조회
		return sqlSession.selectOne("Rcommunity.selectRcommunity", rno);
	}
	
	public int insertRcommunity(Rcommunity rc) { // 댓글 입력
		return sqlSession.insert("Rcommunity.insertRcommunity", rc);
	}
	
	public int updateRcommunity(Rcommunity rc) { // 댓글 수정
		System.out.println(rc);
		return sqlSession.update("Rcommunity.updateRcommunity", rc);
	}
	
	public int deleteRcommunity(Rcommunity rc) { // 댓글 삭제
		System.out.println(rc);
		return sqlSession.delete("Rcommunity.deleteRcommunity", rc);
	}
}