package com.kh.bts.acnt.model.service;

import com.kh.bts.acnt.model.vo.Acnt;

public interface AcntService {
	Acnt selectMyAcnt(String email);

	int cntAcnt(Acnt vo) throws Exception;

	int updateAcnt(Acnt vo) throws Exception;
}
