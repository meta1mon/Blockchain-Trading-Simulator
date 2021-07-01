package com.kh.bts.admin.model.service;

import java.util.List;

import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.report.model.vo.Acreport;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

public interface AdminService {
	public int insertCreport(Creport vo);
	public int insertAcreport(Acreport vo);
	public int insertRreport(Rreport vo);
	public int registerCash(Cash vo);
	public int updateCash(Cash vo);
	public int deleteCash(Cash vo);
	public int countCashLog();
	public List<CashLog> selectCashLog(int startPage, int limit);
	public List<CashLog> searchCashLog(String keyword);
	public List<Member> adminSearchMember(String keyword, int searchType);
	public List<Member> adminListMember(int startPage, int limit);
	public int totalCybcash();
	public int countTodayWon();
	public int countCreport();
	public List<Creport> selectCreport(int startPage, int limit);
	public int countAcreport();
	public List<Acreport> selectAcreport(int startPage, int limit);
	public int countRreport();
	public List<Rreport> selectRreport(int startPage, int limit);
	public int deleteCreport(String crno);
}
