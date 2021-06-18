package com.kh.bts.investment.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.investment.model.vo.Bought;



@Repository("bDao")
public class BoughtDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertBought(Bought vo) { // 글 입력
		return sqlSession.insert("bought.insertBought", vo);
	}
	public int deleteBought(int ubno) {
		return sqlSession.delete("bought.deleteBought", ubno);
	}
	
	public List<Bought> selectList(String acntno){
		return sqlSession.selectList("bought.selectListBought", acntno);
	}
}
