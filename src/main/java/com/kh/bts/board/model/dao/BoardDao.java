package com.kh.bts.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.board.model.vo.Board;

@Repository("bDao")
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;

	public int listCount() { // 전체 글 수 조회
		return sqlSession.selectOne("Board.listCount");
	}

	public Board selectOne(String board_num) { // 글 가져오기
		return sqlSession.selectOne("Board.selectOne", board_num);
	}

	public List<Board> searchList(String keyword) { // 게시글 검색 조회
		return sqlSession.selectList("Board.searchList", keyword);
	}

	public List<Board> selectList(int startPage, int limit) { // 특정 페이지 단위의 게시글 조회
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Board.selectList", null, row);
	}

	public int insertBoard(Board b) { // 글 입력
		return sqlSession.insert("Board.insertBoard", b);
	}

	public int addReadCount(String board_num) { // 글 조회 수 증가
		return sqlSession.update("Board.addReadCount", board_num);
	}

	public int updateBoard(Board b) { // 글 수정
		return sqlSession.update("Board.updateBoard", b);
	}

	public int deleteBoard(String board_num) { // 글 삭제
		return sqlSession.delete("Board.deleteBoard", board_num);
	}
}