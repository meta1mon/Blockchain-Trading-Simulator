package com.kh.bts.community.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dlDao")
public class CdislikeDao {
	@Autowired
	private SqlSession sqlSession;
}