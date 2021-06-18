package com.kh.bts.investment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.investment.model.vo.Sold;



@Repository("sDao")
public class SoldDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertSold(Sold vo) { // 글 입력
		return sqlSession.insert("sold.insertSold", vo);
	}
	public int deleteWaitSold(int usno) {
		return sqlSession.delete("sold.deleteSold", usno);
	}
	
	public List<Sold> selectList(String acntno){
		return sqlSession.selectList("sold.selectListSold", acntno);
	}
	
}
