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
	public int insertAcreport(Acreport vo) {
		return sqlSession.insert("report.insertAcreport", vo);
	}
	public int insertRreport(Rreport vo) {
		return sqlSession.insert("report.insertRreport", vo);
	}
	public int insertArreport(Arreport vo) {
		return sqlSession.insert("report.insertArreport", vo);
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
	
	public List<CashLog> searchCashLog(String keyword){
		return sqlSession.selectList("CashLog.searchCashLog", keyword);
	}
	
	public List<Member> adminSearchMember(String keyword, int searchType){
		List<Member> list = new ArrayList<Member>();
		if(keyword != null) {
			switch(searchType) {
			case 1:
				list = sqlSession.selectList("Member.adminSearchEmail", keyword);
				break;
			case 2:
				list = sqlSession.selectList("Member.adminSearchNick", keyword);
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

	public List<Acreport> searchAcreport(String keyword, int searchType) {
		List<Acreport> list = new ArrayList<Acreport>();
		if (keyword != null) {
			switch (searchType) {
			case 2:
				list = sqlSession.selectList("report.searchCrespondent", keyword);
				break;
			case 3:
				list = sqlSession.selectList("report.searchCreporter", keyword);
				break;
			}
		}
		return list;
	}
	public List<Acreport> searchAcreportByCstatus(String cstatus, int searchType) {
		List<Acreport> list = new ArrayList<Acreport>();
		list = sqlSession.selectList("report.searchCstatus", cstatus);
		return list;
	}
	public List<Arreport> searchArreport(String keyword, int searchType) {
		List<Arreport> list = new ArrayList<Arreport>();
		if (keyword != null) {
			switch (searchType) {
			case 2:
				list = sqlSession.selectList("report.searchRrespondent", keyword);
				break;
			case 3:
				list = sqlSession.selectList("report.searchRreporter", keyword);
			}
		}
		return list;
	}
	public List<Arreport> searchArreportByRstatus(String rstatus, int searchType) {
		List<Arreport> list = new ArrayList<Arreport>();
		list = sqlSession.selectList("report.searchRstatus", rstatus);
		return list;
	}
	
}
