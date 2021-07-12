package com.kh.bts.investment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.investment.model.dao.BoughtDao;
import com.kh.bts.investment.model.vo.Bought;
import com.kh.bts.investment.model.vo.WaitBought;

@Service("bService")
public class BoughtServiceImpl implements BoughtService{
	@Autowired
	private BoughtDao bDao;
	
	@Transactional
	@Override
	public int insertBought(WaitBought vo) {
		return bDao.insertBought(vo);
	}
	
	@Transactional
	@Override
	public int deleteBought(int ubno) {
		return bDao.deleteBought(ubno);
	}
	
	@Override
	public List<Bought> selectListBought(String acntno) {
		return bDao.selectList(acntno);
	}
	@Override
	public String cntBought(String acntno) throws Exception {
		return bDao.cntBought(acntno);
	}
	
	
	
	

}
