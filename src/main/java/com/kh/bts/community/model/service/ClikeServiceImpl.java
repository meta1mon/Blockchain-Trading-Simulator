package com.kh.bts.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.ClikeDao;

@Service("lService")
public class ClikeServiceImpl implements ClikeService {
	@Autowired
	private ClikeDao lDao;

	public int insertClike(String cno, String email) {
		return lDao.insertClike(cno, email);
	}
	
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