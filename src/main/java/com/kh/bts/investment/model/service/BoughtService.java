package com.kh.bts.investment.model.service;

import java.util.List;

import com.kh.bts.investment.model.vo.Bought;
import com.kh.bts.investment.model.vo.WaitBought;

public interface BoughtService {
	int insertBought(WaitBought vo);

	int deleteBought(int ubno);

	List<Bought> selectListBought(String acntno);

	String cntBought(String acntno) throws Exception;
}
