package com.kh.bts.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.ranking.model.vo.Daily;

@Repository("mDao")
public class MemberDAO {
	@Autowired
	SqlSession sqlSession;

	// 회원가입
	public int insertMember(Member vo, Acnt vo2) {
		int result = 0;
		result = sqlSession.insert("Member.insertMember", vo);
		if (result > 0) {
			System.out.println("memberDao에서 회원가입 성공");
			result = sqlSession.insert("Member.insertAcnt", vo2);
			if (result > 0) {
				System.out.println("memberDao에서 계좌 삽입 성공");
				Daily vo3 = new Daily();
				vo3.setEmail(vo.getEmail());
				vo3.setNickname(vo.getNickname());
				vo3.setAcntno(vo2.getAcntno());
				result = sqlSession.insert("ranking.insertDaily", vo3);
				if (result > 0) {
					System.out.println("Daily 랭크 참가 완료");
				} else {
					System.out.println("Daily 랭크 참가 실패");
				}
			} else {
				System.out.println("memberDao에서 계좌 삽입 실패");
			}
		} else {
			System.out.println("memberDao에서 회원가입 실패");
		}

		return result;
	}

	// 이메일, 닉네임 중복 체크
	public int dupeEmail(Member vo) {
		int result = 0;
		result = sqlSession.selectOne("Member.dupeEmail", vo);
		return result;
	}

	public int dupeNick(Member vo) {
		int result = 0;
		result = sqlSession.selectOne("Member.dupeNick", vo);
		return result;
	}

	public String returnNickname(String email) {
		return sqlSession.selectOne("Member.returnNickname", email);
	}

	// 계좌번호 중복 체크
	public int checkAcntno(String acntno) {
		return sqlSession.selectOne("Member.checkAcntno", acntno);
	}

	public int updateMember(Member vo) {
		return sqlSession.update("Member.updateMember", vo);
	}

	public int deleteMember(String email) {
		return sqlSession.delete("Member.deleteMember", email);
	}

	// 인증키 생성
	public void createAuthkey(String email, String authkey) throws Exception {
		Member vo = new Member();
		vo.setEmail(email);
		vo.setAuthkey(authkey);
		sqlSession.selectOne("Member.createAuthKey", vo);
	}

	// 임시 비밀번호 생성
	public void createTempPassword(String email, String pw) throws Exception {
		Member vo = new Member();
		vo.setEmail(email);
		vo.setPw(pw);
		sqlSession.selectOne("Member.createTempPassword", vo);
	}

	// 이메일 인증 링크 클릭시, 멤버 Auth를 Y로 변경
	public void authMember(Member vo) {
		sqlSession.update("Member.authMember", vo);
	}

	// 로그인
	public Member loginMember(Member vo) throws Exception {
		return sqlSession.selectOne("Member.loginMember", vo);
	}

	// 전체 회원 수 조회
	public int countMember() {
		int result = 0;
		result = sqlSession.selectOne("Member.countMember");
		return result;
	}

	// 오늘 가입 회원 수 조회
	public int countTodayMember() {
		int result = 0;
		result = sqlSession.selectOne("Member.countTodayMember");
		return result;
	}
}
