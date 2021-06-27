package com.kh.bts.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.CdislikeDao;

@Service("dlService")
public class CdislikeServiceImpl implements CdislikeService {
	@Autowired
	private CdislikeDao dlDao;

	public int insertCdislike(String cno, String email) {
		return dlDao.insertCdislike(cno, email);
	};

	public int deleteCdislike(String cno, String email) {
		return dlDao.deleteCdislike(cno, email);
	}

	public int isDislike(String cno, String email) {
		return dlDao.isDislike(cno, email);
	}

	public int dislikeCount(String cno) {
		return dlDao.dislikeCount(cno);
	}

}