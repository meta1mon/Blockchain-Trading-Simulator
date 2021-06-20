package com.kh.bts.community.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lDao")
public class ClikeDao {
	@Autowired
	private SqlSession sqlSession;
}