package com.kh.bts.community.model.service;

import java.util.List;

import com.kh.bts.community.model.vo.Rcommunity;

public interface RcommunityService {

	List<Rcommunity> selectList(String cno);

	Rcommunity selectRcommunity(String rno);

	int insertRcommunity(Rcommunity rc);

	int updateRcommunity(Rcommunity rc);

	int deleteRcommunity(Rcommunity rc);
}
