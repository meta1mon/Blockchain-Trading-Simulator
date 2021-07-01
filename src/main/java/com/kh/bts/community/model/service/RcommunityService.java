package com.kh.bts.community.model.service;

import java.util.List;

import com.kh.bts.community.model.vo.Rcommunity;
import com.kh.bts.community.model.vo.UserRcommuniyCheck;

public interface RcommunityService {

	int totalCount();
	
	List<UserRcommuniyCheck> selectRcommunityList(String cno);

	Rcommunity selectRcommunity(String rno);

	int insertRcommunity(Rcommunity rc, String email);

	int updateRcommunity(Rcommunity rc);

	int deleteRcommunity(String rno, String cno);
}
