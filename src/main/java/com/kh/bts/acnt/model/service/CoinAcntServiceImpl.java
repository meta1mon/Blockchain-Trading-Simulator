package com.kh.bts.acnt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.acnt.model.dao.CoinAcntDao;
import com.kh.bts.acnt.model.vo.CoinAcnt;

@Service("coinacntService")
public class CoinAcntServiceImpl implements CoinAcntService{
	@Autowired
	private CoinAcntDao coinacntDao;

	@Override
	public List<CoinAcnt> allselectList(String acntno) {
		// TODO Auto-generated method stub
		return coinacntDao.allselectList(acntno);
	}

	@Override
	public int insertCoinAcnt(CoinAcnt vo) {
		// TODO Auto-generated method stub
		return coinacntDao.insertCoinAcnt(vo);
	}

	@Override
	public int deleteCoinAcnt(int cano) {
		// TODO Auto-generated method stub
		return coinacntDao.deleteWaitBought(cano);
	}

	@Override
	public CoinAcnt countcoin(CoinAcnt vo) {
		// TODO Auto-generated method stub
		return coinacntDao.countcoin(vo);
	}
	
	
}
