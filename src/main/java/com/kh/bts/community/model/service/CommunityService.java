package com.kh.bts.community.model.service;

import java.util.List;

import com.kh.bts.Paging;
import com.kh.bts.community.model.vo.Community;

public interface CommunityService {
	public List<Community> selectAllCommunityList(Paging vo);
	
	List<Community> selectSearch(int startPage, int limit, String keyword, int searchType);

	List<Community> selectList(int startPage, int limit);

	List<Community> searchpopularList();
	
	int totalCount();
	
	int totalTodayCount();

	Community selectCommunity(int chk, String cno);
	
	int insertCommunity(Community c, String email);

	Community updateCommunity(Community c, String email);

	int deleteCommunity(String cno, String email);
	
	int deleteCommunity(String cno);

	List<Community> selectNoticeList(int startPage, int limit);
	
	List<Community> selectNoticeSearch(int startPage, int limit, String keyword, int searchType);
	
	public String returnEmail(String nickName);
}
