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

	public int insertCreport(Creport vo) {
		return sqlSession.insert("report.insertCreport", vo);
	}
	public int insertAcreportDeny(Acreport vo) {
		return sqlSession.insert("report.insertAcreportDeny", vo);
	}
	public int insertAcreportAccept(Acreport vo) {
		return sqlSession.insert("report.insertAcreportAccept", vo);
	}
	public int insertRreport(Rreport vo) {
		return sqlSession.insert("report.insertRreport", vo);
	}
	public int insertArreportDeny(Arreport vo) {
		return sqlSession.insert("report.insertArreportDeny", vo);
	}
	public int insertArreportAccept(Arreport vo) {
		return sqlSession.insert("report.insertArreportAccept", vo);
	}
	
	public int registerCash(Cash vo) {
		return sqlSession.insert("cash.registerCash", vo);
	}
	
	public int updateCash(Cash vo) {
		int result=0;
		result = sqlSession.update("cash.updateCash", vo);
		return result;
	}
	
	public int deleteCash(Cash vo) {
		int result = 0;
		result = sqlSession.delete("cash.deleteCash", vo);
		return result;
	}
	
	public List<CashLog> selectCashLog(int startPage, int limit){
		
		int startRow = (startPage -1)*limit; RowBounds row = new RowBounds(startRow, limit);
		
		return sqlSession.selectList("CashLog.selectCashLog", null, row);
	}
	
	public int countCashLog() {
		int result =0;
		result= sqlSession.selectOne("CashLog.countCashLog");
		return result;
	}
	
	public List<CashLog> searchCashLog(int startPage, int limit, String keyword){
		List<CashLog> list = new ArrayList<CashLog>(); 
		int startRow = (startPage - 1) * limit; 
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("CashLog.searchCashLog", keyword, row);
	}
	
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
	
	public List<Member> adminListMember(int startPage, int limit){
		
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		
		return sqlSession.selectList("Member.adminListMember", null, row);
	}
	
	public List<CoinAcnt> adminListMemberCoin(){
		List<CoinAcnt> list = new ArrayList<CoinAcnt>();
		sqlSession.selectList("resultAcnt.adminListMemberCoin");
		return list;
		
	}
	
	public long totalCybcash() {
		long result = 0;
		result = sqlSession.selectOne("acnt.totalCybcash");
		return result;
	}
	
	public long countTodayWon() {
		long result =0;
		result = sqlSession.selectOne("CashLog.countTodayWon");
		return result;
	}
	
	public int countCreport() {
		int result=0;
		result = sqlSession.selectOne("report.countCreport");
		return result;
	}
	
	public List<Creport> selectCreport(int startPage, int limit){
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		return sqlSession.selectList("report.selectCreport", null, row);
	}
	
	public int countAcreport() {
		int result = 0;
		result = sqlSession.selectOne("report.countAcreport");
		return result;
	}
	public int countArreport() {
		int result = 0;
		result = sqlSession.selectOne("report.countArreport");
		return result;
	}
	
	public List<Acreport> selectAcreport(int startPage, int limit){
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		return sqlSession.selectList("report.selectAcreport", null, row);
	}
	public List<Arreport> selectArreport(int startPage, int limit){
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		return sqlSession.selectList("report.selectArreport", null, row);
	}
	
	public int countRreport() {
		int result=0;
		result = sqlSession.selectOne("report.countRreport");
		return result;
	}
	
	public List<Rreport> selectRreport(int startPage, int limit){
		int startRow = (startPage -1)*limit; 
		RowBounds row = new RowBounds(startRow,	limit);
		return sqlSession.selectList("report.selectRreport", null, row);
	}
	
	public int deleteCreport(String crno) {
		int result = 0;
		result = sqlSession.delete("report.deleteCreport", crno);
		return result;
	}
	public int deleteRreport(String rrno) {
		int result = 0;
		result = sqlSession.delete("report.deleteRreport", rrno);
		return result;
	}

	public List<Acreport> searchAcreport(int startPage, int limit, String keyword, int searchType) {
		List<Acreport> list = new ArrayList<Acreport>();
		int startRow = (startPage - 1) * limit; 
		RowBounds row = new RowBounds(startRow, limit);
		if (keyword != null) {
			switch (searchType) {
			case 1:
				list = sqlSession.selectList("report.searchCstatus", keyword, row);
				break;
			case 2:
				list = sqlSession.selectList("report.searchCrespondent", keyword, row);
				break;
			case 3:
				list = sqlSession.selectList("report.searchCreporter", keyword, row);
				break;
			}
		}
		return list;
	}
	public List<Arreport> searchArreport(int startPage, int limit, String keyword, int searchType) {
		List<Arreport> list = new ArrayList<Arreport>();
		int startRow = (startPage - 1) * limit; 
		RowBounds row = new RowBounds(startRow, limit);
		if (keyword != null) {
			switch (searchType) {
			case 1:
				list = sqlSession.selectList("report.searchRstatus", keyword, row);
				break;
			case 2:
				list = sqlSession.selectList("report.searchRrespondent", keyword, row);
				break;
			case 3:
				list = sqlSession.selectList("report.searchRreporter", keyword, row);
			}
		}
		return list;
	}
	
}
