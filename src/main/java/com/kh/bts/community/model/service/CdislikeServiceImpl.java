package com.kh.bts.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.CdislikeDao;

@Service("dlService")
public class CdislikeServiceImpl implements CdislikeService {
	@Autowired
	private CdislikeDao dlDao;

	public int insertCdislike(String email, String cno) {
		return dlDao.insertCdislike(email, cno);
	};

	public int deleteCdislike(String email, String cno) {
		return dlDao.deleteCdislike(email, cno);
	}

	public int isDisike(String email, String cno) {
		return dlDao.isDislike(email, cno);
	}

	public int dislikeCount(String cno) {
		return dlDao.dislikeCount(cno);
	}

}