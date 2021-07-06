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
		// TODO Auto-generated method stub
		return bDao.insertBought(vo);
	}
	@Override
	public int deleteBought(int ubno) {
		// TODO Auto-generated method stub
		return bDao.deleteBought(ubno);
	}
	@Override
	public List<Bought> selectListBought(String acntno) {
		// TODO Auto-generated method stub
		return bDao.selectList(acntno);
	}
	@Override
	public String cntBought(String acntno) throws Exception {
		// TODO Auto-generated method stub
		return bDao.cntBought(acntno);
	}
	
	
	
	

}
