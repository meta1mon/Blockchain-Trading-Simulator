package com.kh.bts.investment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.investment.model.dao.SoldDao;
import com.kh.bts.investment.model.vo.Sold;

@Service("sService")
public class SoldServiceImpl implements SoldService {
	@Autowired
	private SoldDao sDao;

	@Override
	public int insertSold(Sold vo) {
		// TODO Auto-generated method stub
		return sDao.insertSold(vo);
	}

	@Override
	public int deleteSold(int usno) {
		// TODO Auto-generated method stub
		return sDao.deleteWaitSold(usno);
	}

	@Override
	public List<Sold> selectListSold(String acntno) {
		// TODO Auto-generated method stub
		return sDao.selectList(acntno);
	}

}
