package com.kh.bts.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.board.model.vo.Board;
import com.kh.bts.community.model.vo.Community;

@Repository("cmDao")
public class CommunityDao {
	@Autowired
	private SqlSession sqlSession;

	public List<Community> searchList(String keyword, int searchType) { // 검색한 게시글 조회
		return sqlSession.selectList("community.searchList", keyword);
	}

	public List<Community> selectList(int startPage, int limit) { // 페이지당 게시글 조회
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("community.selectList", null, row);
	}

	public int listCount() { // 게시글 전체 개수 조회
		return sqlSession.selectOne("community.countCommunity");
	}

	public Community selectOne(String cno) { // 게시글 단일 조회
		return sqlSession.selectOne("community.selectOne", cno);
	}

	public int insertCommunity(Community c) { // 게시글 삽입
		return sqlSession.insert("community.insertCommunity", c);
	}

	public int updateCommunity(Community c) { // 게시글 수정
		return sqlSession.update("community.updateCommunity", c);
	}

	public int deleteCommunity(String cno) { // 게시글 삭제
		return sqlSession.delete("community.deleteCommunity", cno);
	}

	public int addReadCount(String cno) { // 게시글 조회수 증가
		return sqlSession.update("community.addReadCount", cno);
	}

}