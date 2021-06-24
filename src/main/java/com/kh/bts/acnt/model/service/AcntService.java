package com.kh.bts.acnt.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.Acnt;
import com.kh.bts.member.model.vo.Member;

public interface AcntService {
	List<Acnt> selectListAcnt(String email);
	public int cntAcnt(Acnt vo) throws Exception;
}
