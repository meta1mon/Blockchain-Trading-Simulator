package com.kh.bts.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.acnt.model.vo.CoinAcnt;
import com.kh.bts.community.model.vo.Community;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.mypage.model.vo.MyRcommunity;

@Repository("myDao")
public class MypageDao {
	@Autowired
	private SqlSession sqlSession;

	public Member myInfo(String email) {
		return sqlSession.selectOne("Member.searchMember", email);
	}

	public int myInfoUpdate(Member vo) {
		return sqlSession.update("mypage.updateMember", vo);
	}

	public int passwordUpdate(Member vo) {
		return sqlSession.update("mypage.updatePassword", vo);
	}

	public int bankPwUpdate(Acnt vo) {
		return sqlSession.update("mypage.updateBankPw", vo);
	}

	public List<Community> myCommunity(String email) {
		String cwriter = sqlSession.selectOne("Member.returnNickname", email);
		if (cwriter == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
		}
		List<Community> list = sqlSession.selectList("mypage.myCommunity", cwriter);
		if (list == null) {
			System.out.println(cwriter + "인 닉네임으로 작성한 글이 없음");
		} else {
			System.out.println(cwriter + "인 닉네임으로 작성한 글이 있음");
		}
		return list;
	}

	// 내가 쓴 댓글
	public List<MyRcommunity> selectMyRcommunity(String email) {
		List<MyRcommunity> list = null;
		String rwriter = sqlSession.selectOne("Member.returnNickname", email);
		
		if (rwriter == null) {
			System.out.println("로그인 오류");
		} else {
			System.out.println("정상 로그인");
			list = sqlSession.selectList("mypage.selectMyRcommunity", rwriter);
			if (list == null) {
				System.out.println(rwriter + "인 닉네임으로 작성한 댓글이 없음");
			} else {
				System.out.println(rwriter + "인 닉네임으로 작성한 댓글이 있음");
			}
		}

		return list;
	}

	public int myDelete(String email) {
		return sqlSession.delete("mypage.deleteMember", email);
	}

	public Acnt myAcnt(String email) {
		return sqlSession.selectOne("acnt.selectMyAcnt", email);
	}

	public int myTotalCoin(Acnt vo) {
		return sqlSession.selectOne("mypage.myTotalCoin", vo);
	}

	public int coinListCount(Acnt vo) {
		return sqlSession.selectOne("mypage.coinListCount", vo);
	}

	public List<CoinAcnt> selectMyCoinAcnt(String acntno) {
		return sqlSession.selectList("coinacnt.selectMyCoinAcnt", acntno);
	}

}
