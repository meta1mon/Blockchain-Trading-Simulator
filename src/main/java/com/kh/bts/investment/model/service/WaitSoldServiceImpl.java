package com.kh.bts.investment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.investment.model.dao.WaitSoldDao;
import com.kh.bts.investment.model.vo.WaitBought;
import com.kh.bts.investment.model.vo.WaitSold;
@Service("wsService")
public class WaitSoldServiceImpl implements WaitSoldService {
	@Autowired
	private WaitSoldDao wsDao;

	
	@Override
	public int insertWaitSold(WaitSold vo) {
		// TODO Auto-generated method stub
		System.out.println("잎플리먼트 속");
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

	@Override
	public List<WaitSold> selectAllCoinListWaitSold() {
		// TODO Auto-generated method stub
		return wsDao.selectAllCoinListWaitSold();
	}

	@Override
	public List<WaitSold> selectAllListWaitSold() {
		// TODO Auto-generated method stub
		return wsDao.selectAllListWaitSold();
	}
	
}
