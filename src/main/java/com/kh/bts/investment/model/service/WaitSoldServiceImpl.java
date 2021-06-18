package com.kh.bts.investment.model.service;

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

}
