package com.kh.bts.investment.model.service;

import java.util.List;

import com.kh.bts.investment.model.vo.Sold;


public interface SoldService {
	int insertSold(Sold vo);
	int deleteSold(int usno);
	List<Sold> selectListSold(String acntno);
}
