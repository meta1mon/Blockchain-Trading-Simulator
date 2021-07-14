package com.kh.bts.admin.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.bts.admin.model.dao.AdminDao;
import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.cash.model.vo.CashLog;
import com.kh.bts.member.email.MailHandler;
import com.kh.bts.member.model.dao.MemberDao;
import com.kh.bts.member.model.vo.Member;
import com.kh.bts.report.model.vo.Acreport;
import com.kh.bts.report.model.vo.Arreport;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao aDao;
	
	@Autowired
	private MemberDao mDao;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Transactional
	@Override
	public int insertCreport(Creport vo) {
		return aDao.insertCreport(vo);
	}
	
	@Transactional
	@Override
	public int insertAcreportDeny(Acreport vo) {
		return aDao.insertAcreportDeny(vo);
	}
	@Transactional
	@Override
	public int insertAcreportAccept(Acreport vo) {
		return aDao.insertAcreportAccept(vo);
	}
	
	@Transactional
	@Override
	public int insertRreport(Rreport vo) {
		return aDao.insertRreport(vo);
	}
	
	@Transactional
	@Override
	public int insertArreportDeny(Arreport vo) {
		return aDao.insertArreportDeny(vo);
	}
	@Transactional
	@Override
	public int insertArreportAccept(Arreport vo) {
		return aDao.insertArreportAccept(vo);
	}

	@Transactional
	@Override
	public int registerCash(Cash vo) {
		return aDao.registerCash(vo);
	}
	
	@Transactional
	@Override
	public int updateCash(Cash vo) {
		int result = 0;
		result = aDao.updateCash(vo);
		return result;
	}
	
	@Transactional
	@Override
	public int deleteCash(Cash vo) {
		int result = 0;
		result = aDao.deleteCash(vo);
		return result;
	}


	@Override
	public int countCashLog() {
		int result = aDao.countCashLog();
		return result;
	}
	
	@Override
	public List<CashLog> selectCashLog(int startPage, int limit) {
		return aDao.selectCashLog(startPage, limit);
	}
	
	@Override
	public List<CashLog> searchCashLog(int startPage, int limit, String keyword) {
		return aDao.searchCashLog(startPage, limit, keyword);
	}
	@Override
	public List<Member> adminSearchMember(int startPage, int limit, String keyword, int searchType) {
		return aDao.adminSearchMember(startPage, limit, keyword, searchType);
	}
	@Override
	public List<Acreport> searchAcreport(int startPage, int limit, String keyword, int searchType) {
		return aDao.searchAcreport(startPage, limit, keyword, searchType);
	}

	@Override
	public List<Member> adminListMember(int startPage, int limit) {
		return aDao.adminListMember(startPage, limit);
	}

	@Override
	public long totalCybcash() {
		long result = 0;
		result= aDao.totalCybcash();
		return result;
	}
	
	@Override
	public long countTodayWon() {
		long result =0;
		result = aDao.countTodayWon();
		return result;
	}

	@Override
	public int countCreport() {
		int result = 0;
		result = aDao.countCreport();
		return result;
	}

	@Override
	public List<Creport> selectCreport(int startPage, int limit) {
		return aDao.selectCreport(startPage, limit);
	}
	
	@Override
	public int countRreport() {
		int result = 0;
		result = aDao.countRreport();
		return result;
	}
	
	@Override
	public List<Rreport> selectRreport(int startPage, int limit) {
		return aDao.selectRreport(startPage, limit);
	}
	
	@Transactional
	@Override
	public int deleteCreport(String crno) {
		int result = 0;
		result = aDao.deleteCreport(crno);
		return result;
	}
	@Transactional
	@Override
	public int deleteRreport(String rrno) {
		int result = 0;
		result = aDao.deleteRreport(rrno);
		return result;
	}
	@Override
	public int countAcreport() {
		int result = 0;
		result = aDao.countAcreport();
		return result;
	}
	@Override
	public int countArreport() {
		int result = 0;
		result = aDao.countArreport();
		return result;
	}
	@Override
	public List<Acreport> selectAcreport(int startPage, int limit) {
		return aDao.selectAcreport(startPage, limit);
	}
	@Override
	public List<Arreport> selectArreport(int startPage, int limit) {
		return aDao.selectArreport(startPage, limit);
	}
	@Override
	public List<Arreport> searchArreport(int startPage, int limit, String keyword, int searchType) {
		return aDao.searchArreport(startPage, limit, keyword, searchType);
	}

	@Override
	public List<Member> selectWeeklyRank() {
		List<Member> list = mDao.selectWeeklyTop3();
		return list;
	}

	@Override
	public List<Member> selectMonthlyRank() {
		List<Member> list = mDao.selectMonthlyTop3();
		return list;
	}
	@Override
	public String sendWeeklyRankReward(String[] email) throws Exception {
		String result = null;
		if(email!=null) {
			for(int i=0; i<email.length; i++) {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[BTS] 주간 랭킹 보상 안내드립니다.");
			sendMail.setText(new StringBuffer()
					.append("<h1 style='color: #8c8cc6; padding: 10px'>Blockchain Trading Simulator</h1>")
					.append("<p style='color: #8c8cc6; padding: 5px;'>● 새로운 연결이 세상에 스며들다.</p>")
					.append("<p style='color: #8c8cc6; padding: 5px;'>● BTS는 회원님께 다양한 서비스와 편의를 제공하는 가상자산 중개 플랫폼입니다. </p>")
					.append("<p style='color: #8c8cc6; padding: 5px;'>● 단순한 기술 커뮤니티를 넘어, SW개발자의 기술과 삶을 나누는 공간으로서의 역할을 담당하고 있습니다.</p>")
					.append("<div style='width: 100%; background-color: #8c8cc6; color:white; padding: 10px'><h2>주간 랭킹 보상 지급</h2></div>")
					.append("<p style='margin: 20px;'>안녕하세요! ").append(email[i]).append("님!</p>")
					.append("<p style='margin: 20px;'>").append("주간 랭킹 TOP3에 드신 것을 축하드립니다.</p>")
					.append("<p style='margin: 20px;'>").append("소정의 상품을 지급해드립니다.</p>")
					.append("<img src='https://mblogthumb-phinf.pstatic.net/MjAxODA5MjhfMjI3/MDAxNTM4MTQwNjMzNzI5.c7ZF7CxdxBkwou-yz5d4JnsF1mUGeNyBKd6cM28I4Ikg.sxZ2LGLrc9sC3NBGqpAE4XqHRyFVAZJks-MRwUOShP8g.JPEG.zoqgns7549/KakaoTalk_20180928_220601336.jpg?type=w800'>")
					.append("<p style='margin: 20px;'>앞으로도 BTS를 이용해주셔서 감사합니다.</p>")
					.append("<hr>")
					.append("<div style='padding: 20px;'><span style='color: #8c8cc6'>♥</span><b>A</b>ces <b>R</b>ecruited <b>M</b>emeber of <b>Y</b>ear 드림<span style='color: #8c8cc6'>♥</span></div>").toString());
			sendMail.setFrom("Aces.Recruited.Member@gmail.com", "BTS");
			sendMail.setTo(email[i]);
			sendMail.send();
			result = "Success";
			}
		} else {
			result = "Fail";
		}
		return result;
	}
	@Override
	public String sendMonthlyRankReward(String[] email) throws Exception {
		String result = null;
		if(email!=null) {
			for(int i=0; i<email.length; i++) {
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("[BTS] 월간 랭킹 보상 안내드립니다.");
				sendMail.setText(new StringBuffer()
						.append("<h1 style='color: #8c8cc6; padding: 10px'>Blockchain Trading Simulator</h1>")
						.append("<p style='color: #8c8cc6; padding: 5px;'>● 새로운 연결이 세상에 스며들다.</p>")
						.append("<p style='color: #8c8cc6; padding: 5px;'>● BTS는 회원님께 다양한 서비스와 편의를 제공하는 가상자산 중개 플랫폼입니다. </p>")
						.append("<p style='color: #8c8cc6; padding: 5px;'>● 단순한 기술 커뮤니티를 넘어, SW개발자의 기술과 삶을 나누는 공간으로서의 역할을 담당하고 있습니다.</p>")
						.append("<div style='width: 100%; background-color: #8c8cc6; color:white; padding: 10px'><h2>주간 랭킹 보상 지급</h2></div>")
						.append("<p style='margin: 20px;'>안녕하세요! ").append(email[i]).append("님!.</p>")
						.append("<p style='margin: 20px;'>").append("월간 랭킹 TOP3에 드신 것을 축하드립니다.</p>")
						.append("<p style='margin: 20px;'>").append("소정의 상품을 지급해드립니다.</p>")
						.append("<img src='https://mblogthumb-phinf.pstatic.net/MjAxODA5MjhfMjI3/MDAxNTM4MTQwNjMzNzI5.c7ZF7CxdxBkwou-yz5d4JnsF1mUGeNyBKd6cM28I4Ikg.sxZ2LGLrc9sC3NBGqpAE4XqHRyFVAZJks-MRwUOShP8g.JPEG.zoqgns7549/KakaoTalk_20180928_220601336.jpg?type=w800'>")
						.append("<p style='margin: 20px;'>항상 BTS를 이용해주셔서 감사합니다.</p>")
						.append("<hr>")
						.append("<div style='padding: 20px;'><span style='color: #8c8cc6'>♥</span><b>A</b>ces <b>R</b>ecruited <b>M</b>emeber of <b>Y</b>ear 드림<span style='color: #8c8cc6'>♥</span></div>").toString());
				sendMail.setFrom("Aces.Recruited.Member@gmail.com", "BTS");
				sendMail.setTo(email[i]);
				sendMail.send();
				result = "Success";
			}
		} else {
			result = "Fail";
		}
		return result;
	}
}
