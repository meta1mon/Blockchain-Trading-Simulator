package com.kh.bts.community.model.service;

public interface ClikeService {
	public int insertClike(String email, String cno);
	
	public int deleteClike(String email, String cno);
	
	public int isLike(String email, String cno);
	
	public int likeCount(String cno);
}
