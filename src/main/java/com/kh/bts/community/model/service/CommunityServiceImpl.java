package com.kh.bts.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.CommunityDao;
import com.kh.bts.community.model.vo.Community;

@Service("cmService")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDao cmDao;

	@Override
	public List<Community> selectSearch(String keyword, int searchType) {
		return cmDao.searchList(keyword, searchType);
	}

	@Override
	public List<Community> selectList(int startPage, int limit) {
		return cmDao.selectList(startPage, limit);
	}

	@Override
	public int totalCount() {
		return cmDao.listCount();
	}

	@Override
	public Community selectCommunity(int chk, String cno) {
		if (chk == 0)
			cmDao.addReadCount(cno);
		return cmDao.selectOne(cno);
	}

	@Override
	public void insertCommunity(Community c) {
		cmDao.insertCommunity(c);
	}

	@Override
	public Community updateCommunity(Community c) {
		int result = cmDao.updateCommunity(c);
		if (result > 0) {
			c = cmDao.selectOne(c.getCno());
		} else {
			c = null;
		}
		return c;
	}

	@Override
	public void deleteCommunity(String cno) {
		cmDao.deleteCommunity(cno);
	}

}