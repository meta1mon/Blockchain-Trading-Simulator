package com.kh.bts.community.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lDao")
public class ClikeDao {
	@Autowired
	private SqlSession sqlSession;

//	public List<Community> searchList(String keyword, int searchType) { // 검색한 게시글 조회
//		return sqlSession.selectList("Community.searchList", keyword);
//	}
//
//	public List<Community> selectList(int startPage, int limit) { // 페이지당 게시글 조회
//		int startRow = (startPage - 1) * limit;
//		RowBounds row = new RowBounds(startRow, limit);
//		return sqlSession.selectList("Community.selectList", null, row);
//	}
//
//	public int listCount() { // 게시글 전체 개수 조회
//		return sqlSession.selectOne("Community.countCommunity");
//	}
//
//	public Community selectOne(int cno) { // 게시글 단일 조회
//		return sqlSession.selectOne("Community.selectOne", cno);
//	}
//
//	public int insertCommunity(Community c) { // 게시글 삽입
//		return sqlSession.insert("Community.insertCommunity", c);
//	}
//
//	public int updateCommunity(Community c) { // 게시글 수정
//		return sqlSession.update("Community.updateCommunity", c);
//	}
//
//	public int deleteCommunity(int cno) { // 게시글 삭제
//		return sqlSession.delete("Community.deleteCommunity", cno);
//	}
//
//	public int addReadCount(int cno) { // 게시글 조회수 증가
//		return sqlSession.update("Community.addReadCount", cno);
//	}

}