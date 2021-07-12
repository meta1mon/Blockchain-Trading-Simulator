package com.kh.bts.acnt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.dao.CoinAcntDao;
import com.kh.bts.acnt.model.vo.CoinAcnt;

@Service("coinacntService")
public class CoinAcntServiceImpl implements CoinAcntService{
	@Autowired
	private CoinAcntDao coinacntDao;

	@Override
	public List<CoinAcnt> allselectList(String acntno) {
		return coinacntDao.allselectList(acntno);
	}

	@Transactional
	@Override
	public int insertCoinAcnt(CoinAcnt vo) {
		return coinacntDao.insertCoinAcnt(vo);
	}

	@Transactional
	@Override
	public int deleteCoinAcnt(int cano) {
		return coinacntDao.deleteWaitBought(cano);
	}

	@Override
	public CoinAcnt countcoin(CoinAcnt vo) {
		return coinacntDao.countcoin(vo);
	}

	@Transactional
	@Override
	public int updateCoinAcnt(CoinAcnt vo) throws Exception {
		return coinacntDao.updateMyCoinAcnt(vo);
	}
	
	
}
