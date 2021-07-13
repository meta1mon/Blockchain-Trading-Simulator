package com.kh.bts.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.report.model.vo.Acreport;
import com.kh.bts.report.model.vo.Arreport;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

@Repository("aDao")
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;

	// 게시글 신고
	public int insertCreport(Creport vo) {
		return sqlSession.insert("report.insertCreport", vo);
	}
	// 게시글 신고 반려
	public int insertAcreportDeny(Acreport vo) {
		return sqlSession.insert("report.insertAcreportDeny", vo);
	}
	// 게시글 신고 수리
	public int insertAcreportAccept(Acreport vo) {
		return sqlSession.insert("report.insertAcreportAccept", vo);
	}
	// 댓글 신고
	public int insertRreport(Rreport vo) {
		return sqlSession.insert("report.insertRreport", vo);
	}
	// 댓글 신고 반려
	public int insertArreportDeny(Arreport vo) {
		return sqlSession.insert("report.insertArreportDeny", vo);
	}
	// 댓글 신고 수리
	public int insertArreportAccept(Arreport vo) {
		return sqlSession.insert("report.insertArreportAccept", vo);
	}
	
	// 충전 상품 등록
	public int registerCash(Cash vo) {
		return sqlSession.insert("cash.registerCash", vo);
	}
	// 충전 상품 수정
	public int updateCash(Cash vo) {
		int result=0;
		result = sqlSession.update("cash.updateCash", vo);
		return result;
	}
	// 충전 상품 삭제
	public int deleteCash(Cash vo) {
		int result = 0;
		result = sqlSession.delete("cash.deleteCash", vo);
		return result;
	}
	// 충전 내역 조회
	public List<CashLog> selectCashLog(int startPage, int limit){
		
		int startRow = (startPage -1)*limit; RowBounds row = new RowBounds(startRow, limit);
		
		return sqlSession.selectList("CashLog.selectCashLog", null, row);
	}
	// 충전 내역 수 조회
	public int countCashLog() {
		int result =0;
		result= sqlSession.selectOne("CashLog.countCashLog");
		return result;
	}
	// 충전 내역 검색
	public List<CashLog> searchCashLog(int startPage, int limit, String keyword){
		List<CashLog> list = new ArrayList<CashLog>(); 
		int startRow = (startPage - 1) * limit; 
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("CashLog.searchCashLog", keyword, row);
	}
	// 회원 목록 검색
	public List<Member> adminSearchMember(int startPage, int limit, String keyword, int searchType){
		List<Member> list = new ArrayList<Member>();
		int startRow = (startPage - 1) * limit; 
		RowBounds row = new RowBounds(startRow, limit);
		if(keyword != null) {
			switch(searchType) {
			case 1:
				list = sqlSession.selectList("Member.adminSearchEmail", keyword, row);
				break;
			case 2:
				list = sqlSession.selectList("Member.adminSearchNick", keyword, row);
				break;
			}
		}
		
		return list;
	}
	// 회원 목록 조회
	public List<Member> adminListMember(int startPage, int limit){
		
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		
		return sqlSession.selectList("Member.adminListMember", null, row);
	}
	// 총 가상 투자금
	public long totalCybcash() {
		long result = 0;
		result = sqlSession.selectOne("acnt.totalCybcash");
		return result;
	}
	// 총 충전금
	public long countTodayWon() {
		long result =0;
		result = sqlSession.selectOne("CashLog.countTodayWon");
		return result;
	}
	// 게시물 신고 건수
	public int countCreport() {
		int result=0;
		result = sqlSession.selectOne("report.countCreport");
		return result;
	}
	// 게시물 신고 목록
	public List<Creport> selectCreport(int startPage, int limit){
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		return sqlSession.selectList("report.selectCreport", null, row);
	}
	// 게시물 신고 처리 건수
	public int countAcreport() {
		int result = 0;
		result = sqlSession.selectOne("report.countAcreport");
		return result;
	}
	// 댓글 신고 처리 건수
	public int countArreport() {
		int result = 0;
		result = sqlSession.selectOne("report.countArreport");
		return result;
	}
	// 게시글 신고 처리 목록
	public List<Acreport> selectAcreport(int startPage, int limit){
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		return sqlSession.selectList("report.selectAcreport", null, row);
	}
	// 댓글 신고 처리 목록
	public List<Arreport> selectArreport(int startPage, int limit){
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		return sqlSession.selectList("report.selectArreport", null, row);
	}
	// 댓글 신고 건수
	public int countRreport() {
		int result=0;
		result = sqlSession.selectOne("report.countRreport");
		return result;
	}
	// 댓글 신고 목록
	public List<Rreport> selectRreport(int startPage, int limit){
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		return sqlSession.selectList("report.selectRreport", null, row);
	}
	// 게시글 신고 삭제
	public int deleteCreport(String crno) {
		int result = 0;
		result = sqlSession.delete("report.deleteCreport", crno);
		return result;
	}
	// 댓글 신고 삭제
	public int deleteRreport(String rrno) {
		int result = 0;
		result = sqlSession.delete("report.deleteRreport", rrno);
		return result;
	}
	// 게시글 신고 처리 검색
	public List<Acreport> searchAcreport(int startPage, int limit, String keyword, int searchType) {
		List<Acreport> list = new ArrayList<Acreport>();
		int startRow = (startPage - 1) * limit; 
		RowBounds row = new RowBounds(startRow, limit);
		if (keyword != null) {
			switch (searchType) {
			case 1:
				list = sqlSession.selectList("report.searchCreporter", keyword, row);
				break;
			case 2:
				list = sqlSession.selectList("report.searchCrespondent", keyword, row);
				break;
			case 3:
				list = sqlSession.selectList("report.searchCstatus", keyword, row);
				break;
			}
		}
		return list;
	}
	// 댓글 신고 처리 검색
	public List<Arreport> searchArreport(int startPage, int limit, String keyword, int searchType) {
		List<Arreport> list = new ArrayList<Arreport>();
		int startRow = (startPage - 1) * limit; 
		RowBounds row = new RowBounds(startRow, limit);
		if (keyword != null) {
			switch (searchType) {
			case 1:
				list = sqlSession.selectList("report.searchRreporter", keyword, row);
				break;
			case 2:
				list = sqlSession.selectList("report.searchRrespondent", keyword, row);
				break;
			case 3:
				list = sqlSession.selectList("report.searchRstatus", keyword, row);
				break;
			}
		}
		return list;
	}
	
}
