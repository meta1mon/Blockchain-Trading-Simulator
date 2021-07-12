package com.kh.bts.acnt.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.dao.AcntDao;
import com.kh.bts.acnt.model.vo.Acnt;


@Service("acntService")
public class AcntServiceImpl implements AcntService{
	@Autowired
	private AcntDao acntDao;

	@Override
	public Acnt selectMyAcnt(String email) {
		return acntDao.selectMyAcnt(email);
	}

	@Override
	public int cntAcnt(Acnt vo) throws Exception {
		return acntDao.cntAcnt(vo);
	}

	@Transactional
	@Override
	public int updateAcnt(Acnt vo) throws Exception {
		return acntDao.updateMyAcnt(vo);
	}
}
