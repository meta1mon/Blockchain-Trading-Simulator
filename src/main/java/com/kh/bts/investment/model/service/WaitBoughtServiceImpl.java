package com.kh.bts.investment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.investment.model.dao.WaitBoughtDao;
import com.kh.bts.investment.model.vo.WaitBought;

@Service("wbService")
public class WaitBoughtServiceImpl implements WaitBoughtService {
	@Autowired
	private WaitBoughtDao wbDao;



	@Override
	public int insertWaitBought(WaitBought vo) {
		// TODO Auto-generated method stub
		return wbDao.insertWaitBought(vo);
	}

}
