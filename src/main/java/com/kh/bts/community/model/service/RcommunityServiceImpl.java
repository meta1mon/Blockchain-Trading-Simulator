package com.kh.bts.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.community.model.dao.RcommunityDao;
import com.kh.bts.community.model.vo.Rcommunity;
import com.kh.bts.community.model.vo.UserRcommuniyCheck;

@Service("rcmService")
public class RcommunityServiceImpl implements RcommunityService {
	@Autowired
	private RcommunityDao rcmDao;
	 
	public int totalCount() { // 댓글 전체 개수 조회
		return rcmDao.listCount();
	}
	
	public List<UserRcommuniyCheck> selectRcommunityList(String cno) { // 게시글에 해당하는 댓글 조회
		return rcmDao.selectRcommunityList(cno);
	}

	public Rcommunity selectRcommunity(String rno) { // 단일 댓글 조회
		return rcmDao.selectRcommunity(rno);
	}

	@Transactional
	public int insertRcommunity(Rcommunity rc, String email) { // 댓글 입력
		return rcmDao.insertRcommunity(rc, email);
	}

	@Transactional
	public int updateRcommunity(Rcommunity rc) { // 댓글 수정
		return rcmDao.updateRcommunity(rc);
	}

	@Transactional
	public int deleteRcommunity(Rcommunity rc) { // 댓글 삭제
		return rcmDao.deleteRcommunity(rc);
	}

}