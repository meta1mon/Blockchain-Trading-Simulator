package com.kh.bts.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
