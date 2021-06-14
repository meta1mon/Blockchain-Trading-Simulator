package com.kh.bts.news.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bts.news.model.dao.NewsDao;

@Service("nService")
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsDao nDao;
	
}
