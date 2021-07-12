package com.kh.bts.investment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.investment.model.dao.SoldDao;
import com.kh.bts.investment.model.vo.Sold;
import com.kh.bts.investment.model.vo.WaitSold;

@Service("sService")
public class SoldServiceImpl implements SoldService {
	@Autowired
	private SoldDao sDao;

	@Transactional
	@Override
	public int insertSold(WaitSold vo) {
		return sDao.insertSold(vo);
	}

	@Transactional
	@Override
	public int deleteSold(int usno) {
		return sDao.deleteWaitSold(usno);
	}

	@Override
	public List<Sold> selectListSold(String acntno) {
		return sDao.selectList(acntno);
	}

	@Override
	public String cntSold(String acntno) throws Exception {
		return sDao.cntSold(acntno);
	}

}
