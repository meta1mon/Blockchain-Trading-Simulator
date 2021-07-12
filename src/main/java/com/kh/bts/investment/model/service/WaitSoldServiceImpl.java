package com.kh.bts.investment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.investment.model.dao.WaitSoldDao;
import com.kh.bts.investment.model.vo.WaitBought;
import com.kh.bts.investment.model.vo.WaitSold;

@Service("wsService")
public class WaitSoldServiceImpl implements WaitSoldService {
	@Autowired
	private WaitSoldDao wsDao;

	@Transactional
	@Override
	public int insertWaitSold(WaitSold vo) {
		return wsDao.insertWaitSold(vo);
	}

	@Transactional
	@Override
	public int deleteWaitSold(int usno) {
		return wsDao.deleteWaitSold(usno);
	}

	@Override
	public List<WaitSold> selectListWaitSold(String acntno) {
		return wsDao.selectList(acntno);
	}

	@Override
	public List<WaitSold> selectAllCoinListWaitSold() {
		return wsDao.selectAllCoinListWaitSold();
	}

	@Override
	public List<WaitSold> selectAllListWaitSold() {
		return wsDao.selectAllListWaitSold();
	}

}
