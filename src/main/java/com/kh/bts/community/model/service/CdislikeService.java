package com.kh.bts.community.model.service;

public interface CdislikeService {
	public int insertCdislike(String email, String cno);
	
	public int deleteCdislike(String email, String cno);
	
	public int isDisike(String email, String cno);
	
	public int dislikeCount(String cno);
}
