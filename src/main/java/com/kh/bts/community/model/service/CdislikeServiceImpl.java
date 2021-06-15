package com.kh.bts.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.CdislikeDao;

@Service("dlService")
public class CdislikeServiceImpl implements CdislikeService {
	@Autowired
	private CdislikeDao dlDao;

//	@Override
//	public List<Community> selectSearch(String keyword, int searchType) {
//		return cmDao.searchList(keyword, searchType);
//	}
//
//	@Override
//	public List<Community> selectList(int startPage, int limit) {
//		return cmDao.selectList(startPage, limit);
//	}
//
//	@Override
//	public int totalCount() {
//		return cmDao.listCount();
//	}
//
//	@Override
//	public Community selectCommunity(int chk, int cno) {
//		if (chk == 0)
//			cmDao.addReadCount(cno);
//		return cmDao.selectOne(cno);
//	}
//
//	@Override
//	public void insertCommunity(Community c) {
//		cmDao.insertCommunity(c);
//	}
//
//	@Override
//	public Community updateCommunity(Community c) {
//		int result = cmDao.updateCommunity(c);
//		if (result > 0) {
//			c = cmDao.selectOne(c.getCno());
//		} else {
//			c = null;
//		}
//		return c;
//	}
//
//	@Override
//	public void deleteCommunity(int cno) {
//		cmDao.deleteCommunity(cno);
//	}

}