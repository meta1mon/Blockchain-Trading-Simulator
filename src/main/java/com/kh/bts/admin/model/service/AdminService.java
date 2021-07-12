package com.kh.bts.admin.model.service;

import java.util.List;

import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.report.model.vo.Acreport;
import com.kh.bts.report.model.vo.Arreport;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

public interface AdminService {
	// 게시판 관리
	public int insertCreport(Creport vo);
	public int insertAcreportDeny(Acreport vo);
	public int insertAcreportAccept(Acreport vo);
	public int insertRreport(Rreport vo);
	public int insertArreportDeny(Arreport vo);
	public int insertArreportAccept(Arreport vo);
	public int countArreport();
	public List<Creport> selectCreport(int startPage, int limit);
	public List<Acreport> selectAcreport(int startPage, int limit);
	public List<Arreport> selectArreport(int startPage, int limit);
	public int countRreport();
	public List<Rreport> selectRreport(int startPage, int limit);
	public int deleteCreport(String crno);
	public int deleteRreport(String rrno);
	public List<Acreport> searchAcreport(int startPage, int limit, String keyword, int searchType);
	public List<Arreport> searchArreport(int startPage, int limit, String keyword, int searchType);
	// 충전 상품 관리
	public int registerCash(Cash vo);
	public int updateCash(Cash vo);
	public int deleteCash(Cash vo);
	// 충전 내역 관리
	public int countCashLog();
	public List<CashLog> selectCashLog(int startPage, int limit);
	public List<CashLog> searchCashLog(int startPage, int limit, String keyword);
	// 회원 관리
	public List<Member> adminSearchMember(int startPage, int limit, String keyword, int searchType);
	public List<Member> adminListMember(int startPage, int limit);
	public List<Member> selectWeeklyRank();
	public List<Member> selectMonthlyRank();
	public String sendWeeklyRankReward(String[] email) throws Exception;
	public String sendMonthlyRankReward(String[] email) throws Exception;
	// 헤더
	public long totalCybcash();
	public long countTodayWon();
	// 메인
	public int countCreport();
	public int countAcreport();
}
