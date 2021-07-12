package com.kh.bts.cash.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;

public interface CashService {
	int chargeCash(String email, int won, int sellprice);

	List<Cash> selectTotalCash(int startPage, int limit);

	int countTotalCash();

	List<Cash> selectNowCash();

	List<Cash> selectOldCash();
}
