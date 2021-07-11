package com.kh.bts.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.admin.model.dao.AdminDao;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.report.model.vo.Acreport;
import com.kh.bts.report.model.vo.Arreport;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao aDao;
	
	@Transactional
	@Override
	public int insertCreport(Creport vo) {
		return aDao.insertCreport(vo);
	}
	
	@Transactional
	@Override
	public int insertAcreportDeny(Acreport vo) {
		return aDao.insertAcreportDeny(vo);
	}
	@Transactional
	@Override
	public int insertAcreportAccept(Acreport vo) {
		return aDao.insertAcreportAccept(vo);
	}
	
	@Transactional
	@Override
	public int insertRreport(Rreport vo) {
		return aDao.insertRreport(vo);
	}
	
	@Transactional
	@Override
	public int insertArreportDeny(Arreport vo) {
		return aDao.insertArreportDeny(vo);
	}
	@Transactional
	@Override
	public int insertArreportAccept(Arreport vo) {
		return aDao.insertArreportAccept(vo);
	}

	@Transactional
	@Override
	public int registerCash(Cash vo) {
		return aDao.registerCash(vo);
	}
	
	@Transactional
	@Override
	public int updateCash(Cash vo) {
		int result = 0;
		result = aDao.updateCash(vo);
		return result;
	}
	
	@Transactional
	@Override
	public int deleteCash(Cash vo) {
		int result = 0;
		result = aDao.deleteCash(vo);
		return result;
	}


	@Override
	public int countCashLog() {
		int result = aDao.countCashLog();
		return result;
	}
	
	@Override
	public List<CashLog> selectCashLog(int startPage, int limit) {
		return aDao.selectCashLog(startPage, limit);
	}
	
	@Override
	public List<CashLog> searchCashLog(String keyword) {
		return aDao.searchCashLog(keyword);
	}
	@Override
	public List<Member> adminSearchMember(String keyword, int searchType) {
		return aDao.adminSearchMember(keyword, searchType);
	}
	@Override
	public List<Acreport> searchAcreport(String keyword, int searchType) {
		return aDao.searchAcreport(keyword, searchType);
	}

	@Override
	public List<Member> adminListMember(int startPage, int limit) {
		return aDao.adminListMember(startPage, limit);
	}

	@Override
	public long totalCybcash() {
		long result = 0;
		result= aDao.totalCybcash();
		return result;
	}
	
	@Override
	public long countTodayWon() {
		long result =0;
		result = aDao.countTodayWon();
		return result;
	}

	@Override
	public int countCreport() {
		int result = 0;
		result = aDao.countCreport();
		return result;
	}

	@Override
	public List<Creport> selectCreport(int startPage, int limit) {
		return aDao.selectCreport(startPage, limit);
	}
	
	@Override
	public int countRreport() {
		int result = 0;
		result = aDao.countRreport();
		return result;
	}
	
	@Override
	public List<Rreport> selectRreport(int startPage, int limit) {
		return aDao.selectRreport(startPage, limit);
	}
	
	@Transactional
	@Override
	public int deleteCreport(String crno) {
		int result = 0;
		result = aDao.deleteCreport(crno);
		return result;
	}
	@Transactional
	@Override
	public int deleteRreport(String rrno) {
		int result = 0;
		result = aDao.deleteRreport(rrno);
		return result;
	}
	@Override
	public int countAcreport() {
		int result = 0;
		result = aDao.countAcreport();
		return result;
	}
	@Override
	public int countArreport() {
		int result = 0;
		result = aDao.countArreport();
		return result;
	}
	@Override
	public List<Acreport> selectAcreport(int startPage, int limit) {
		return aDao.selectAcreport(startPage, limit);
	}
	@Override
	public List<Arreport> selectArreport(int startPage, int limit) {
		return aDao.selectArreport(startPage, limit);
	}
	@Override
	public List<Acreport> searchAcreportByCstatus(String cstatus, int searchType) {
		return aDao.searchAcreportByCstatus(cstatus, searchType);
	}
	@Override
	public List<Arreport> searchArreport(String keyword, int searchType) {
		return aDao.searchArreport(keyword, searchType);
	}
	@Override
	public List<Arreport> searchArreportByRstatus(String rstatus, int searchType) {
		return aDao.searchArreportByRstatus(rstatus, searchType);
	}
}
