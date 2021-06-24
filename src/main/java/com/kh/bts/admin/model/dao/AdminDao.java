package com.kh.bts.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

@Repository("aDao")
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertCreport(Creport vo) {
		return sqlSession.insert("report.insertCreport", vo);
	}
	
	public int insertRreport(Rreport vo) {
		return sqlSession.insert("report.insertRreport", vo);
	}
	
	public int registerCash(Cash vo) {
		return sqlSession.insert("cash.registerCash", vo);
	}
}
