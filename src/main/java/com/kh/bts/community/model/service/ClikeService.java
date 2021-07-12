package com.kh.bts.community.model.service;

public interface ClikeService {
	int insertClike(String cno, String email);

	int deleteClike(String cno, String email);

	int isLike(String cno, String email);

	int likeCount(String cno);
}
