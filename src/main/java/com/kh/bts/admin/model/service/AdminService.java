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



	int insertCreport(Creport vo);

	int insertAcreportDeny(Acreport vo);

	int insertAcreportAccept(Acreport vo);

	int insertRreport(Rreport vo);

	int insertArreportDeny(Arreport vo);

	int insertArreportAccept(Arreport vo);

	int registerCash(Cash vo);

	int updateCash(Cash vo);

	int deleteCash(Cash vo);

	int countCashLog();

	List<CashLog> selectCashLog(int startPage, int limit);

	List<CashLog> searchCashLog(int startPage, int limit, String keyword);

	List<Member> adminSearchMember(int startPage, int limit, String keyword, int searchType);

	List<Member> adminListMember(int startPage, int limit);

	long totalCybcash();

	long countTodayWon();

	int countCreport();

	List<Creport> selectCreport(int startPage, int limit);

	int countAcreport();

	int countArreport();

	List<Acreport> selectAcreport(int startPage, int limit);

	List<Arreport> selectArreport(int startPage, int limit);

	int countRreport();

	List<Rreport> selectRreport(int startPage, int limit);

	int deleteCreport(String crno);

	int deleteRreport(String rrno);

	List<Acreport> searchAcreport(int startPage, int limit, String keyword, int searchType);

	List<Arreport> searchArreport(int startPage, int limit, String keyword, int searchType);
	
	List<Member> selectWeeklyRank();

	List<Member> selectMonthlyRank();
	
	String sendMonthlyRankReward(String[] email)throws Exception;
	
	String sendWeeklyRankReward(String[] email)throws Exception;

}
