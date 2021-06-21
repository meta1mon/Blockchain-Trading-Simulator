package com.kh.bts.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.dao.MypageDao;

@Service("myService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDao myDao;

	
	@Override
	public Member myInfo(String email) {
		return myDao.myInfo(email);
	}
	
	@Transactional
	@Override
	public int myInfoUpdate(Member vo) {
		return myDao.myInfoUpdate(vo);
	}

	
	@Transactional
	@Override
	public int passwordUpdate(Member vo) {
		return myDao.passwordUpdate(vo);
	}

	@Transactional
	@Override
	public int bankPwUpdate(Acnt vo) {
		return myDao.bankPwUpdate(vo);
	}

	@Override
	public List<Community> myCommunity(String email) {
		return myDao.myCommunity(email);
	}

	@Transactional
	@Override
	public int myDelete(String email) {
		return myDao.myDelete(email);
	}
}
