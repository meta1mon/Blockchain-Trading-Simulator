package com.kh.bts.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.Paging;
import com.kh.bts.community.model.dao.CommunityDao;
import com.kh.bts.community.model.vo.Community;

@Service("cmService")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDao cmDao;

	@Override
	public List<Community> selectAllCommunityList(Paging vo, String keyword, int searchType) {
		return cmDao.selectAllCommunityList(vo, keyword, searchType);
	}
	
	@Override
	public List<Community> selectList(int startPage, int limit) {
		return cmDao.selectList(startPage, limit);
	}

	@Override
	public List<Community> searchpopularList() {
		return cmDao.searchpopularList();
	}
	
	@Override
	public int totalCount() {
		return cmDao.listCount();
	}
	@Override
	public int totalTodayCount() {
		return cmDao.listTodayCount();
	}

	@Override
	public Community selectCommunity(int chk, String cno) {
		if (chk == 0)
			cmDao.addReadCount(cno);
		return cmDao.selectOne(cno);
	}

	@Transactional
	@Override
	public int insertCommunity(Community c, String email) {
		return cmDao.insertCommunity(c, email);
	}

	@Transactional
	@Override
	public Community updateCommunity(Community c, String email) {
		int result = cmDao.updateCommunity(c, email);
		if (result > 0) {
			c = cmDao.selectOne(c.getCno());
		} else {
			c = null;
		}
		return c;
	}

	@Transactional
	@Override
	public int deleteCommunity(String cno, String email) {
		return cmDao.deleteCommunity(cno, email);
	}

	@Transactional
	@Override
	public int deleteCommunity(String cno) {
		return cmDao.deleteCommunity(cno);
	}

	@Override
	public List<Community> selectNoticeList(int startPage, int limit) {
		return cmDao.selectNoticeList(startPage, limit);
	}
	
	@Override
	public String returnEmail(String nickName) {
		return cmDao.returnEmail(nickName);
	}

	@Override
	public List<Community> selectNoticeSearch(int startPage, int limit, String keyword, int searchType) {
		// TODO Auto-generated method stub
		return cmDao.searchNoticeList(startPage, limit, keyword, searchType);
	}

	@Override
	public List<Community> selectMainAllCommunityList() {
		// TODO Auto-generated method stub
		return cmDao.selectMainAllCommunityList();
	}


}