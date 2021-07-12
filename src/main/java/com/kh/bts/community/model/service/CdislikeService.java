package com.kh.bts.community.model.service;

public interface CdislikeService {
	int insertCdislike(String cno, String email);

	int deleteCdislike(String cno, String email);

	int isDislike(String cno, String email);

	int dislikeCount(String cno);
}
