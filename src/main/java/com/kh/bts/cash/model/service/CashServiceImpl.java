package com.kh.bts.cash.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.cash.model.dao.CashDao;
import com.kh.bts.cash.model.vo.CashLog;

@Service("cashService")
public class CashServiceImpl implements CashService{

	@Autowired
	private CashDao cashDao;
	
	@Transactional
	@Override
	public int chargeCash(String email, int won, int sellprice) {
		return cashDao.chargeCash(email, won, sellprice);
	}

}
