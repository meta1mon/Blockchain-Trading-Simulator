package com.kh.bts.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.RcommunityDao;
import com.kh.bts.community.model.vo.Rcommunity;

@Service("rcmService")
public class RcommunityServiceImpl implements RcommunityService {
	@Autowired
	private RcommunityDao rcmDao;
	 
	public int totalCount() { // 댓글 전체 개수 조회
		return rcmDao.listCount();
	}
	
	public List<Rcommunity> selectList(String cno) { // 게시글에 해당하는 댓글 조회
		return rcmDao.selectList(cno);
	}

	public Rcommunity selectRcommunity(String rno) { // 단일 댓글 조회
		return rcmDao.selectOne(rno);
	}

	public int insertRcommunity(Rcommunity rc) { // 댓글 입력
		return rcmDao.insertRcommunity(rc);
	}

	public int updateRcommunity(Rcommunity rc) { // 댓글 수정
		return rcmDao.updateRcommunity(rc);
	}

	public int deleteRcommunity(Rcommunity rc) { // 댓글 삭제
		return rcmDao.deleteRcommunity(rc);
	}

}