package com.kh.bts.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.CdislikeDao;

@Service("dlService")
public class CdislikeServiceImpl implements CdislikeService {
	@Autowired
	private CdislikeDao dlDao;



}