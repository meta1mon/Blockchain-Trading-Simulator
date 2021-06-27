package com.kh.bts.investment.model.service;

import java.util.List;

import com.kh.bts.investment.model.vo.WaitBought;

public interface WaitBoughtService {
	int insertWaitBought(WaitBought vo);
	int deleteWaitBought(int ubno);
	List<WaitBought> selectListWaitBought(String acntno);
	List<WaitBought> selectAllCoinListWaitBought();
	List<WaitBought> selectAllListWaitBought();
}
