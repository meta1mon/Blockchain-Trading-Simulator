package com.kh.bts.investment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.investment.model.dao.BoughtDao;
import com.kh.bts.investment.model.vo.Bought;

@Service("bService")
public class BoughtServiceImpl implements BoughtService{
	@Autowired
	private BoughtDao bDao;
	@Override
	public int insertBought(Bought vo) {
		// TODO Auto-generated method stub
		return bDao.insertBought(vo);
	}

}
