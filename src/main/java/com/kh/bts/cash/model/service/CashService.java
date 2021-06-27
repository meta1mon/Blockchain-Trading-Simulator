package com.kh.bts.cash.model.service;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.cash.model.vo.CashLog;

public interface CashService {
	public int chargeCash(String email, int won);
	
}
