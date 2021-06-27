package com.kh.bts.community.model.service;

public interface ClikeService {
	public int insertClike(String cno, String email);
	
	public int deleteClike(String cno, String email);
	
	public int isLike(String cno, String email);
	
	public int likeCount(String cno);
}
