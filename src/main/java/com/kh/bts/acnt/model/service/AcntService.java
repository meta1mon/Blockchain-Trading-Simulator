package com.kh.bts.acnt.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.model.vo.Member;

public interface AcntService {
	Acnt selectMyAcnt(String email);
	public int cntAcnt(Acnt vo) throws Exception;
}
