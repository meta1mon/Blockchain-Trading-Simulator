package com.kh.bts.news.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("nDao")
public class NewsDao {
	@Autowired
	private SqlSession sqlSession;
}
