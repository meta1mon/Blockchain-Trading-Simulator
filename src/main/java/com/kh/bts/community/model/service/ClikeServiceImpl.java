package com.kh.bts.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.community.model.dao.ClikeDao;

@Service("lService")
public class ClikeServiceImpl implements ClikeService {
	@Autowired
	private ClikeDao lDao;


}