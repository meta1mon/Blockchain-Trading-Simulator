package com.kh.bts.investment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.investment.model.dao.WaitBoughtDao;
import com.kh.bts.investment.model.vo.WaitBought;

@Service("wbService")
public class WaitBoughtServiceImpl implements WaitBoughtService {
	@Autowired
	private WaitBoughtDao wbDao;

	@Transactional
	@Override
	public int insertWaitBought(WaitBought vo) {
		return wbDao.insertWaitBought(vo);
	}

	@Transactional
	@Override
	public int deleteWaitBought(int ubno) {
		return wbDao.deleteWaitBought(ubno);
	}

	@Override
	public List<WaitBought> selectListWaitBought(String acntno) {
		return wbDao.selectList(acntno);
	}

	@Override
	public List<WaitBought> selectAllCoinListWaitBought() {
		return wbDao.selectAllCoinListWaitBought();
	}

	@Override
	public List<WaitBought> selectAllListWaitBought() {
		return wbDao.selectAllListWaitBought();
	}

}
