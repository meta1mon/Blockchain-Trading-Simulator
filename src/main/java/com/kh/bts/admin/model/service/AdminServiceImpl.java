package com.kh.bts.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.admin.model.dao.AdminDao;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao aDao;
	
	@Override
	public int insertCreport(Creport vo) {
		return aDao.insertCreport(vo);
	}

	@Override
	public int insertRreport(Rreport vo) {
		return aDao.insertRreport(vo);
	}

	@Override
	public int registerCash(Cash vo) {
		return aDao.registerCash(vo);
	}

	@Override
	public List<Cash> selectCashAll() {
		return aDao.selectCashAll();
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
	public List<Member> adminListMember(int startPage, int limit) {
		return aDao.adminListMember(startPage, limit);
	}

	@Override
	public int totalCybcash() {
		int result = 0;
		result= aDao.totalCybcash();
		return result;
	}
	
	@Override
	public int countTodayWon() {
		int result =0;
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


}
