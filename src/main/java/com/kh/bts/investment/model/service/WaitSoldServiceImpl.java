package com.kh.bts.investment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.bts.investment.model.dao.WaitSoldDao;
import com.kh.bts.investment.model.vo.WaitSold;

public class WaitSoldServiceImpl implements WaitSoldService {
	@Autowired
	private WaitSoldDao wsDao;

	@Override
	public int insertWaitSold(WaitSold vo) {
		// TODO Auto-generated method stub
		return wsDao.insertWaitSold(vo);
	}

	@Override
	public int deleteWaitSold(int usno) {
		// TODO Auto-generated method stub
		return wsDao.deleteWaitSold(usno);
	}

	@Override
	public List<WaitSold> selectListWaitSold(String acntno) {
		// TODO Auto-generated method stub
		return wsDao.selectList(acntno);
	}

}
