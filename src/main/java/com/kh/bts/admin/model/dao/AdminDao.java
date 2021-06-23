package com.kh.bts.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.community.model.vo.Community;
import com.kh.bts.report.model.vo.Creport;

@Repository("aDao")
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertCreport(Creport vo) {
		
		return 0;
	}
}
