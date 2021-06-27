package com.kh.bts.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;
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
	
	public List<Cash> selectCashAll() {
		return sqlSession.selectList("cash.selectCashAll");
	}
	public List<Member> adminSearchMember(String keyword, int searchType){
		List<Member> list = new ArrayList<Member>();
		if(keyword != null) {
			switch(searchType) {
			case 1:
				list = sqlSession.selectList("Member.adminSearchEmail", keyword);
				break;
			case 2:
				list = sqlSession.selectList("Member.adminSearchNick", keyword);
				break;
			}
		}
		
		return list;
	}
	
	public List<Member> adminListMember(/* int startPage, int limit */){
		/*
		 * int startRow = (startPage -1)*limit; RowBounds row = new RowBounds(startRow,
		 * limit);
		 */
		return sqlSession.selectList("Member.adminListMember"/* , null, row */);
	}
}
