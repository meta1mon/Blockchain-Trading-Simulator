package com.kh.bts.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.email.MailHandler;
import com.kh.bts.member.email.TempKey;
import com.kh.bts.member.model.dao.MemberDao;
import com.kh.bts.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mDao;

	@Inject
	private JavaMailSender mailSender;
	
	// 회원 가입
	@Transactional
	@Override
	public int insertMember(Member vo, Acnt vo2) throws Exception {
		int result = 0;
		result = mDao.insertMember(vo, vo2);

		String key = new TempKey().getKey(12, false); // 랜덤 문자 생성
		mDao.createAuthkey(vo.getEmail(), key);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[BTS] 이메일을 인증하고 가입을 완료하세요.");
		sendMail.setText(new StringBuffer()
				.append("<h1 style='color: #8c8cc6; padding: 10px'>Blockchain Trading Simulator</h1>")
				.append("<p style='color: #8c8cc6; padding: 5px;'>● 새로운 연결이 세상에 스며들다.</p>")
				.append("<p style='color: #8c8cc6; padding: 5px;'>● BTS는 회원님께 다양한 서비스와 편의를 제공하는 가상자산 중개 플랫폼입니다. </p>")
				.append("<p style='color: #8c8cc6; padding: 5px;'>● 단순한 기술 커뮤니티를 넘어, SW개발자의 기술과 삶을 나누는 공간으로서의 역할을 담당하고 있습니다.</p>")
				.append("<div style='width: 100%; background-color: #8c8cc6; color:white; padding: 10px'><h2>이메일 인증</h2></div>")
				.append("<p style='margin: 20px;'>안녕하세요!</p>")
				.append("<p style='margin: 20px;'>아래 링크를 눌러 이메일을 인증하시면 회원 가입이 완료됩니다.</p>")
				.append("<p style='margin: 20px;'>인증 후 사이트를 이용하실 수 있습니다.</p>")
				.append("<p style='margin: 20px;'><a href='http://localhost:8090/bts/emailconfirm?email=").append(vo.getEmail())
				.append("&authkey=").append(key).append("' target='blenk'><button style='border: 1px solid #8c8cc6; border-radius: 5px; background: white; color: #8c8cc6'>이메일 인증 확인</button></a></p>")
				.append("<p style='margin: 20px;'>가입하여 저희 BTS를 빛내주세요!</p>")
				.append("<p style='margin: 20px;'>등록해 주셔서 감사합니다.</p>")
				.append("<hr>")
				.append("<div style='padding: 20px;'><span style='color: #8c8cc6'>♥</span><b>A</b>ces <b>R</b>ecruited <b>M</b>emeber of <b>Y</b>ear 드림<span style='color: #8c8cc6'>♥</span></div>").toString());
		sendMail.setFrom("Aces.Recruited.Member@gmail.com", "BTS");
		sendMail.setTo(vo.getEmail());
		sendMail.send();

		return result;
	}
	

	// 임시 비밀번호 생성

	@Transactional
	@Override
	public void createTempPassword(String email, String pw) throws Exception {
		mDao.createTempPassword(email, pw);
	}
	
	// 비밀번호 찾기
	@Override
	public String findPassword(Member vo) throws Exception {
		String result = null;
		if(vo.getEmail()!=null) {
			if(vo.getAuth() != null) {
			String key = new TempKey().getKey(12, false); // 랜덤 문자 생성
			mDao.createTempPassword(vo.getEmail(), key);
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[BTS] 문의 주신 임시 비밀번호 안내입니다.");
			sendMail.setText(new StringBuffer()
					.append("<h1 style='color: #8c8cc6; padding: 10px'>Blockchain Trading Simulator</h1>")
					.append("<p style='color: #8c8cc6; padding: 5px;'>● 새로운 연결이 세상에 스며들다.</p>")
					.append("<p style='color: #8c8cc6; padding: 5px;'>● BTS는 회원님께 다양한 서비스와 편의를 제공하는 가상자산 중개 플랫폼입니다. </p>")
					.append("<p style='color: #8c8cc6; padding: 5px;'>● 단순한 기술 커뮤니티를 넘어, SW개발자의 기술과 삶을 나누는 공간으로서의 역할을 담당하고 있습니다.</p>")
					.append("<div style='width: 100%; background-color: #8c8cc6; color:white; padding: 10px'><h2>임시 비밀번호 안내</h2></div>")
					.append("<p style='margin: 20px;'>안녕하세요!</p>")
					.append("<p style='margin: 20px;'>").append(vo.getEmail()).append("님께서 요청하신 임시 비밀번호입니다.</p>")
					.append("<p style='margin: 20px; color: #8c8cc6'>임시 비밀번호: ").append(key).append("</p>")
					.append("<p style='margin: 20px;'>항상 BTS를 이용해주셔서 감사합니다.</p>")
					.append("<hr>")
					.append("<div style='padding: 20px;'><span style='color: #8c8cc6'>♥</span><b>A</b>ces <b>R</b>ecruited <b>M</b>emeber of <b>Y</b>ear 드림<span style='color: #8c8cc6'>♥</span></div>").toString());
			sendMail.setFrom("Aces.Recruited.Member@gmail.com", "BTS");
			sendMail.setTo(vo.getEmail());
			sendMail.send();
			result = "Success";
			} else {
				result = "Fail";
			}
		} else {
			result = "Fail";
		}
		return result;
	}
	
	// 이메일 중복 검사
	@Override
	public int dupeEmail(Member vo) throws Exception{
		int result = 0;
		result = mDao.dupeEmail(vo);
		return result;
	}
	
	// 닉네임 중복 검사
	@Override
	public int dupeNick(Member vo)  throws Exception{
		int result = 0;
		result = mDao.dupeNick(vo);
		return result;
	}
	
	@Override
	public int checkAcntno(String acntno) {
		return mDao.checkAcntno(acntno);
	}

	// 인증키 생성
	@Override
	public void createAuthkey(String email, String authkey) throws Exception {
		mDao.createAuthkey(email, authkey);
	}

	
	// 회원 정보 수정


	@Transactional
	@Override
	public int updateMember(Member vo) {
		return mDao.updateMember(vo);
	}


	// 회원 탈퇴

	@Transactional
	@Override
	public int deleteMember(String email) {
		return mDao.deleteMember(email);
	}

	// 인증여부 Y로 수정
	@Override
	public void authMember(Member vo) {
		mDao.authMember(vo);
	}

	// 로그인
	@Override
	public Member loginMember(Member vo) throws Exception {
		return mDao.loginMember(vo);
	}
	
	// 이메일로 닉네임 가져오기
	@Override
	public String returnNickname(String email) {
		return mDao.returnNickname(email);
	}
	@Override
	public String returnAuth(String email) {
		return mDao.returnAuth(email);
	}
	
	// 회원 수 세기
	@Override
	public int countMember() {
		int result =0;
		result = mDao.countMember();
		return result;
	}
	
	// 오늘자 신규 가입 회원 수 세기
	@Override
	public int countTodayMember() {
		int result =0;
		result = mDao.countTodayMember();
		return result;
	}

}
