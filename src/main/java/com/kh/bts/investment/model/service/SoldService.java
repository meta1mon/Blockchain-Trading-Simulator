package com.kh.bts.investment.model.service;

import java.util.List;

import com.kh.bts.investment.model.vo.Sold;
import com.kh.bts.investment.model.vo.WaitSold;

public interface SoldService {
	int insertSold(WaitSold vo);

	int deleteSold(int usno);

	List<Sold> selectListSold(String acntno);

	public String cntSold(String acntno) throws Exception;
}
