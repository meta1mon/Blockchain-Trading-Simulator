package com.kh.bts.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.ClikeDao;
import com.kh.bts.community.model.vo.Clike;
import com.kh.bts.member.model.vo.Member;

@Service("lService")
public class ClikeServiceImpl implements ClikeService {
	@Autowired
	private ClikeDao lDao;

	public int insertClike(String email, String cno) {
		return lDao.insertClike(email, cno);
	}
	
	public int deleteClike(String email, String cno) {
		return lDao.deleteClike(email, cno);
	}
	
	public int isLike(String email, String cno) {
		return lDao.isLike(email, cno);
	}
	
	public int likeCount(String cno) {
		return lDao.likeCount(cno);
	}
}