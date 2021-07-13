package com.kh.bts.community.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.Paging;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;

@Repository("cmDao")
public class CommunityDao {
	@Autowired
	private SqlSession sqlSession;

	public List<Community> selectAllCommunityList(Paging vo, String keyword, int searchType) {
		List<Community> list = null;
		if (keyword.equals("")) { // 검색 안했을 때
			list = sqlSession.selectList("community.selectCommunityList", vo);
		} else if (searchType == 1) { // 태그로 검색 했을 때
			list = sqlSession.selectList("community.searchListSubject", keyword);
		} else if (searchType == 2) { // 작성자로 검색했을 때
			list = sqlSession.selectList("community.searchListWriter", keyword);
		}
		return list;
	}

	public List<Community> selectMainAllCommunityList() {
		List<Community> mlist = sqlSession.selectList("community.selectMainCommunityList");
		return mlist;
	}
	
	public int countReply(String cno) {
		int result = sqlSession.selectOne("community.countReply", cno);
		return result;
	}

	public List<Community> selectList(int startPage, int limit) { // 페이지당 게시글 조회
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("community.selectList", null, row);
	}

	public List<Community> searchpopularList() { // 조회수 상위 5개 게시글 조회
		return sqlSession.selectList("community.searchpopularList");
	}

	public int listCount() { // 공지사항 개수 조회(작성자에 관리자가 포함된 경우)
		return sqlSession.selectOne("community.countCommunity");
	}
	
	public int listTotalCount() { // 전체 글 개수(관리자 제외)
		return sqlSession.selectOne("community.countTotalCommunity");
	}

	public int listTodayCount() { // 오늘 게시글 전체 개수 조회
		return sqlSession.selectOne("community.countTodayCommunity");
	}

	public Community selectOne(String cno) { // 게시글 단일 조회
		return sqlSession.selectOne("community.selectOne", cno);
	}

	public int insertCommunity(Community c, String email) { // 게시글 삽입
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		String cwriter = vo.getNickname();
		c.setCwriter(cwriter);
		int result = sqlSession.insert("community.insertCommunity", c);
		return result;
	}

	public int updateCommunity(Community c, String email) { // 게시글 수정
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		String cwriter = vo.getNickname();
		c.setCwriter(cwriter);
		int result = sqlSession.update("community.updateCommunity", c);
		return result;
	}

	public int deleteCommunity(String cno, String email) { // 게시글 삭제
		Member vo = sqlSession.selectOne("Member.searchMember", email);
		if (vo == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		String cwriter = vo.getNickname();
		Community c = new Community();
		c.setCwriter(cwriter);
		int result = sqlSession.delete("community.deleteCommunity", cno);
		return result;
	}

	public int deleteCommunity(String cno) { // 게시글 삭제
		int result = sqlSession.delete("community.deleteCommunity", cno);
		return result;
	}

	public int addReadCount(String cno) { // 게시글 조회수 증가
		return sqlSession.update("community.addReadCount", cno);
	}

	public List<Community> selectNoticeList(int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("community.selectNoticeList", null, row);
	}

	public List<Community> searchNoticeList(int startPage, int limit, String keyword, int searchType) { // 검색한 게시글 조회
		List<Community> list = new ArrayList<Community>();
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);

		if (keyword != null) {
			switch (searchType) {
			case 1: // 제목으로 검색
				list = sqlSession.selectList("community.searchNoticeListSubject", keyword, row);
				break;
			case 2: // 내용으로 검색
				list = sqlSession.selectList("community.searchNoticeListContent", keyword, row);
				break;
			case 3: // 작성자명으로 검색
				list = sqlSession.selectList("community.searchNoticeListWriter", keyword, row);
				break;
			default:
				System.out.println("dao 오류");
				break;
			}
		}
		return list;
	}

	public String returnEmail(String nickName) {
		String result = sqlSession.selectOne("Member.returnEmail", nickName);
		return result;
	}

}