package com.kh.bts.investment.model.service;

import java.util.List;

import com.kh.bts.investment.model.vo.Bought;


public interface BoughtService {
	int insertBought(Bought vo);
	int deleteBought(int ubno);
	List<Bought> selectListBought(String acntno);
}
