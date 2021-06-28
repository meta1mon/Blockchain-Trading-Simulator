package com.kh.bts.admin.model.service;

import java.util.List;

import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

public interface AdminService {
	public int insertCreport(Creport vo);
	public int insertRreport(Rreport vo);
	public int registerCash(Cash vo);
	public List<Cash> selectCashAll();
	public int countCashLog();
	public List<CashLog> selectCashLog(int startPage, int limit);
	public List<CashLog> searchCashLog(String keyword);
	public List<Member> adminSearchMember(String keyword, int searchType);
	public List<Member> adminListMember(int startPage, int limit);
	public int totalCybcash();
	public int countTodayWon();
	public int countCreport();
	public int countRreport();
}
