package com.kh.bts.investment.model.service;

import java.util.List;

import com.kh.bts.investment.model.vo.WaitSold;

public interface WaitSoldService {
	int insertWaitSold(WaitSold vo);
	int deleteWaitSold(int usno);
	List<WaitSold> selectListWaitSold(String acntno);
	List<WaitSold> selectAllCoinListWaitSold();
	List<WaitSold> selectAllListWaitSold();
}
