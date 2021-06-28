package com.kh.bts.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

@Repository("aDao")
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertCreport(Creport vo) {
		return sqlSession.insert("report.insertCreport", vo);
	}
	
	public int insertRreport(Rreport vo) {
		return sqlSession.insert("report.insertRreport", vo);
	}
	
	public int registerCash(Cash vo) {
		return sqlSession.insert("cash.registerCash", vo);
	}
	
	public List<Cash> selectCashAll() {
		return sqlSession.selectList("cash.selectCashAll");
	}
	
	public List<CashLog> selectCashLog(int startPage, int limit){
		
		int startRow = (startPage -1)*limit; RowBounds row = new RowBounds(startRow,
		limit);
		
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
	
	public int totalCybcash() {
		int result = 0;
		result = sqlSession.selectOne("acnt.totalCybcash");
		return result;
	}
	
	public int countTodayWon() {
		int result =0;
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
	
}
