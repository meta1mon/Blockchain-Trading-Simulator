package com.kh.bts.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.community.model.dao.ClikeDao;

@Service("lService")
public class ClikeServiceImpl implements ClikeService {
	@Autowired
	private ClikeDao lDao;

	@Transactional
	public int insertClike(String cno, String email) {
		return lDao.insertClike(cno, email);
	}
	
	@Transactional
	public int deleteClike(String cno, String email) {
		return lDao.deleteClike(cno, email);
	}
	
	public int isLike(String cno, String email) {
		return lDao.isLike(cno, email);
	}
	
	public int likeCount(String cno) {
		return lDao.likeCount(cno);
	}
}