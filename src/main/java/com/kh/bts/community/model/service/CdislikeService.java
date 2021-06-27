package com.kh.bts.community.model.service;

public interface CdislikeService {
	public int insertCdislike(String cno, String email);
	
	public int deleteCdislike(String cno, String email);
	
	public int isDislike(String cno, String email);
	
	public int dislikeCount(String cno);
}
