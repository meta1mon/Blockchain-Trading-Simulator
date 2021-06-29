package com.kh.bts.acnt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.acnt.model.dao.AcntDao;
import com.kh.bts.acnt.model.vo.Acnt;


@Service("acntService")
public class AcntServiceImpl implements AcntService{
	@Autowired
	private AcntDao acntDao;

	@Override
	public Acnt selectMyAcnt(String email) {
		// TODO Auto-generated method stub
		return acntDao.selectMyAcnt(email);
	}

	@Override
	public int cntAcnt(Acnt vo) throws Exception {
		// TODO Auto-generated method stub
		return acntDao.cntAcnt(vo);
	}
}
